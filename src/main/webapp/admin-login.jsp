<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN LOGIN</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<section class="menu-section">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand text-white" href="index.jsp">MICHIMARKET</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#menu-top" aria-controls="menu-top"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="menu-top">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link text-white"
							href="index.jsp"> <i class="fas fa-home"></i> Home
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="admin-login.jsp"> <i class="fas fa-user-shield"></i>
								Admin Login
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</section>

	<div class="content-wrapper">
		<div class="container">
			<div class="row justify-content-center mt-4">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header bg-danger text-white">Admin Login</div>
						<div class="card-body">
							<%-- Mensaje de error si las credenciales son incorrectas --%>
							<%
							String credential = (String) session.getAttribute("credential");
							if (credential != null) {
								session.removeAttribute("credential");
							%>
							<div class="alert alert-danger">You have entered wrong
								credentials.</div>
							<%
							}
							%>
							<form action="AdminLogin" method="post">
								<div class="form-group">
									<label for="email">Email Id.:</label> <input type="text"
										id="email" name="email" class="form-control" required>
								</div>
								<div class="form-group">
									<label for="upass">Password.:</label> <input type="password"
										id="upass" name="upass" class="form-control" required>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-success">Admin
										Login</button>
									<button type="reset" class="btn btn-primary">Clear</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>