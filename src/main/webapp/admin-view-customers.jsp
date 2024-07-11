<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VER USUARIOS</title>
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
					<h4 class="text-center mb-4 mt-4">VER USUARIOS</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<h5 class="card-header">USUARIOS</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Nombre</th>
											<th>Email</th>
											<th>Género</th>
											<th>Teléfono</th>
											<th>Dirección</th>
											<th>Fecha & Hora</th>
										</tr>
									</thead>
									<tbody>
										<%
										// Establecer conexión y consulta a la base de datos
										Connection connection = DatabaseConnection.getConnection();
										Statement statement = connection.createStatement();
										ResultSet resultSet = statement.executeQuery("select * from tblcustomer");
										while (resultSet.next()) {
										%>
										<tr>
											<td><%=resultSet.getInt(1)%></td>
											<td><%=resultSet.getString("name")%></td>
											<td><%=resultSet.getString("email")%></td>
											<td><%=resultSet.getString("gender")%></td>
											<td><%=resultSet.getString("phone")%></td>
											<td><%=resultSet.getString("address")%></td>
											<td><%=resultSet.getString("added_date")%></td>
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