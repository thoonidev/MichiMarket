import com.connection.DatabaseConnection;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ExportPDFServlet")
public class ExportPDFServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/pdf");
		try {
			OutputStream out = response.getOutputStream();
			Document document = new Document(PageSize.A4.rotate());
			PdfWriter.getInstance(document, out);

			document.open();

			// Add logo or text (MichiMarket) to PDF
			Font logoFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
			Paragraph logo = new Paragraph("MichiMarket", logoFont);
			logo.setAlignment(Element.ALIGN_LEFT);
			logo.setIndentationLeft(20);
			logo.setSpacingBefore(10);
			document.add(logo);

			// Add title to PDF
			Font titleFont = new Font(Font.FontFamily.HELVETICA, 24, Font.BOLD);
			Paragraph title = new Paragraph("Ordenes Entregadas", titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			title.setSpacingAfter(20);
			document.add(title);

			// Add table with orders data
			PdfPTable table = new PdfPTable(9);
			table.setWidthPercentage(100);

			// Header cells
			Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
			PdfPCell cell;

			cell = new PdfPCell(new Phrase("#", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Orden No", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Usuario", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Producto", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Qty", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Total", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Estado", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Fecha & Hora", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Modo Pago", headerFont));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(cell);

			// Retrieve data from database
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from tblorders where order_status='Deliver'");
			ResultSet resultOrders = pstmt.executeQuery();
			while (resultOrders.next()) {
				table.addCell(String.valueOf(resultOrders.getInt(1))); // Order ID
				table.addCell(resultOrders.getString(2));
				table.addCell(resultOrders.getString(3));
				table.addCell(resultOrders.getString(10));
				table.addCell(resultOrders.getString(11));
				table.addCell(resultOrders.getString(14));
				table.addCell(resultOrders.getString(15));
				table.addCell(resultOrders.getString(16));
				table.addCell(resultOrders.getString(17));
			}

			// Close resources
			resultOrders.close();
			pstmt.close();
			con.close();

			document.add(table);
			document.close();

		} catch (DocumentException | SQLException e) {
			e.printStackTrace();
		}
	}
}
