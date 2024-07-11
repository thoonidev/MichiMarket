<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTRARSE</title>
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
							<div class="login-bottom">
								<h3 class="text-center">Registrate</h3>
								<%-- Success message --%>
								<%
								String success = (String) session.getAttribute("success-message");
								if (success != null) {
									session.removeAttribute("success-message");
								%>
								<div class="alert alert-success text-center">Usuario registrado exitosamente.</div>
								<%
								}
								%>
								<%-- Failure message --%>
								<%
								String fail = (String) session.getAttribute("fail-message");
								if (fail != null) {
									session.removeAttribute("fail-message");
								%>
								<div class="alert alert-danger text-center">Customer
									registration failed. Please try again.</div>
								<%
								}
								%>
								<form action="AddCustomer" method="post">
									<div class="form-group">
										<label for="name">Nombres:</label> <input type="text"
											class="form-control" id="name" placeholder="Ingrese sus nombres"
											required name="name">
									</div>
									<div class="form-group">
										<label for="email">Email:</label> <input type="email"
											class="form-control" id="email" placeholder="Email" required
											name="email">
									</div>
									<div class="form-group">
										<label for="password">Password:</label> <input type="password"
											class="form-control" id="password" placeholder="Password"
											required name="password">
									</div>
									<div class="form-group">
										<label for="mobile">Teléfono:</label> <input type="text"
											class="form-control" id="mobile" placeholder="Ingrese telefono" required
											name="mobile">
									</div>
									<div class="form-group">
										<label for="gender">Género:</label> <select
											class="form-control" id="gender" required name="gender">
											<option>Masculino</option>
											<option>Femenino</option>
										</select>
									</div>
									<div class="form-group">
										<label for="address">Dirección:</label>
										<textarea class="form-control" id="address"
											placeholder="Ingrese dirección" required style="min-height: 100px;"
											name="address"></textarea>
									</div>
									<div class="form-group">
										<label for="pincode">Pin Code:</label> <input type="text"
											class="form-control" id="pincode" placeholder="Pincode"
											required name="pincode">
									</div>
									<button type="submit" class="btn btn-primary btn-block">REGISTRAR</button>
								</form>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12 text-center">
							<p>
								Ya tienes cuenta? <a href="customer-login.jsp">Login</a>
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