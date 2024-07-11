<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VER ORDENES</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%
	//Checking whether admin in session or not
	if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<h4 class="text-center mb-4 mt-4">VER ORDENES</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<h5 class="card-header">ORDENES	</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Orden No</th>
											<th>Usuario</th>
											<th>Producto</th>
											<th>Qty</th>
											<th>Total</th>
											<th>Estado</th>
											<th>Fecha & Hora</th>
											<th>Modo Pago</th>
											<th>Acción</th>
										</tr>
									</thead>
									<tbody>
										<%
										ResultSet resultOrders = DatabaseConnection.getResultFromSqlQuery("select * from tblorders");
										while (resultOrders.next()) {
										%>
										<tr>
											<td><%=resultOrders.getInt(1)%></td>
											<td><%=resultOrders.getInt(2)%></td>
											<td><%=resultOrders.getString(3)%><br><%=resultOrders.getString(4)%><br><%=resultOrders.getString(5)%><br><%=resultOrders.getString(6)%><br><%=resultOrders.getString(7)%><br><%=resultOrders.getString(8)%></td>
											<td><img src="uploads/<%=resultOrders.getString(9)%>"
												class="img-fluid" style="max-width: 150px; height: auto;"
												alt="Product Image"><br><%=resultOrders.getString(10)%></td>
											<td><%=resultOrders.getString(11)%></td>
											<td><%=resultOrders.getString(14)%></td>
											<%
											if (resultOrders.getString(15).equals("Deliver")) {
											%>
											<td><span class="badge badge-success">Delivered</span></td>
											<%
											} else {
											%>
											<td><span class="badge badge-danger">Pending</span></td>
											<%
											}
											%>
											<td><%=resultOrders.getString(16)%></td>
											<td><%=resultOrders.getString(17)%></td>
											<%
											if (resultOrders.getString(15).equals("Deliver")) {
											%>
											<td><a
												href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>"
												class="btn btn-danger"
												onclick="return confirm('Are you sure you want to change product delivery status?');">Pending</a></td>
											<%
											} else {
											%>
											<td><a
												href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>"
												class="btn btn-success"
												onclick="return confirm('Are you sure you want to change product delivery status?');">Deliver</a></td>
											<%
											}
											%>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<%
	} else {
	response.sendRedirect("admin-login.jsp");
	}
	%>
</body>
</html>
