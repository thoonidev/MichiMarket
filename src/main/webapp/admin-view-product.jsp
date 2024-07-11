<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VER PRODUCTOS</title>
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
					<h4 class="text-center mb-4 mt-4">VER PRODUCTOS</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<h5 class="card-header">PRODUCTOS</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Nombre</th>
											<th>Imagen</th>
											<th>Descripción</th>
											<th>MAX (S/.)</th>
											<th>Precio (S/.)</th>
											<th>Fecha</th>
											<th>Estado</th>
											<th>Acción</th>
										</tr>
									</thead>
									<tbody>
										<%
										ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
										while (rs.next()) {
										%>
										<tr>
											<td><%=rs.getInt("id")%></td>
											<td><%=rs.getString("name")%></td>
											<td><img src="uploads/<%=rs.getString(7)%>"
												class="img-fluid" style="max-width: 100px; height: auto;"
												alt="Product Image"></td>
											<td><%=rs.getString("description")%></td>
											<td><del><%=rs.getString("mrp_price")%></del></td>
											<td><%=rs.getString("price")%></td>
											<td><%=rs.getString("create_date")%></td>
											<td><%=rs.getString("active")%></td>
											<td><a
												href="admin-edit-product.jsp?id=<%=rs.getInt("id")%>"
												class="btn btn-primary btn-sm">Edit</a> <a
												href="admin-delete-product.jsp?id=<%=rs.getInt("id")%>"
												class="btn btn-danger btn-sm"
												onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
											</td>
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