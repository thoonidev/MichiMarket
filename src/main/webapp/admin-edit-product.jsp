<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EDITAR PRODUCTO</title>
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
	<div class="content-wrapper mb-4">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h4 class="text-center mb-4 mt-4">EDITAR PRODUCTO</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<h5 class="card-header">EDITAR</h5>
						<div class="card-body">
							<%
							// Getting input from the admin
							int id = Integer.parseInt(request.getParameter("id"));
							// Querying to database
							ResultSet updateResult = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct where id='" + id + "' ");
							while (updateResult.next()) {
							%>
							<form role="form" action="admin-edit-product-process.jsp"
								method="post">
								<div class="form-group">
									<label>Product Id</label> <input class="form-control"
										type="text" name="pid"
										value="<%=updateResult.getString("id")%>" readonly />
								</div>
								<div class="form-group">
									<label>Nombre</label> <input class="form-control"
										type="text" name="pname"
										value="<%=updateResult.getString("name")%>" />
								</div>
								<div class="form-group">
									<label>Precio</label> <input class="form-control" type="text"
										name="price" value="<%=updateResult.getString("price")%>" />
								</div>
								<div class="form-group">
									<label>Descripción</label> <input class="form-control"
										type="text" style="min-height: 100px;" name="description"
										value="<%=updateResult.getString("description")%>" />
								</div>
								<div class="form-group">
									<label>Precio Máximo</label> <input class="form-control"
										type="text" name="mprice"
										value="<%=updateResult.getString("mrp_price")%>" />
								</div>
								<div class="form-group">
									<label>Estado</label> <select class="form-control"
										name="status">
										<option>Active</option>
										<option>In-Active</option>
									</select>
								</div>

								<button type="submit" class="btn btn-success">Update
									Product</button>
							</form>
							<%
							}
							%>
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