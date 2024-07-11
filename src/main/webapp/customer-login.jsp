<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<jsp:include page="Components/Navegacion.jsp"></jsp:include>
	<div class="modal-dialog" role="document">
		<div class="modal-content modal-info">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<h3 class="text-center">Iniciar Sesión</h3>
							<%-- Alert message for wrong credentials --%>
							<%
							String credential = (String) session.getAttribute("credential");
							if (credential != null) {
								session.removeAttribute("credential");
							%>
							<div class="alert alert-danger text-center">You have
								entered wrong credentials.</div>
							<%
							}
							%>
							<form action="CustomerLogin" method="post">
								<div class="form-group">
									<label for="email">Email:</label> <input type="text"
										class="form-control" id="email" name="email" required>
								</div>
								<div class="form-group">
									<label for="password">Password:</label> <input type="password"
										class="form-control" id="password" name="password" required>
								</div>
								<button type="submit" class="btn btn-primary btn-block">Sign
									in</button>
							</form>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12 text-center">
							<p>
								Nuevo en Michimarket? <a href="customer-register.jsp">Crear una cuenta</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>