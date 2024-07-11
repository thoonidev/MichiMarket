<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MICHIMARKET</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<jsp:include page="Components/Navegacion.jsp"></jsp:include>
	<div id="visual" class="carousel slide" data-ride="carousel">
		<!-- Indicadores -->
		<ul class="carousel-indicators">
			<li data-target="#visual" data-slide-to="0" class="active"
				style="background-color: black;"></li>
			<li data-target="#visual" data-slide-to="1"
				style="background-color: black;"></li>
			<li data-target="#visual" data-slide-to="2"
				style="background-color: black;"></li>
		</ul>

		<!-- Slides -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="images/1.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/2.png" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/3.jpg" alt="Third slide">
			</div>
		</div>

		<!-- Controles -->
		<a class="carousel-control-prev" href="#visual" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#visual" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<br />
	<div class="product-easy">
		<div class="container">
			<div class="row  mb-4">
				<div class="col">
					<h2 class="text-center">NUESTROS PRODUCTOS</h2>
				</div>
			</div>

			<div class="row">
				<!-- Iterar sobre los productos -->
				<%
				ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct LIMIT 4");
				%>
				<%
				while (retriveProduct.next()) {
				%>
				<div class="col-md-3 mb-4">
					<form action="AddToCart" method="post">
						<div class="card shadow-sm h-100">
							<input type="hidden" name="productId"
								value="<%=retriveProduct.getInt("id")%>"> <img
								src="uploads/<%=retriveProduct.getString("image_name")%>"
								alt="Product Image" class="card-img-top"
								style="height: 200px; object-fit: cover;">
							<div class="card-body">
								<h5 class="card-title"><%=retriveProduct.getString("name")%></h5>
								<p class="card-text">
									Category:
									<%=retriveProduct.getString("product_category")%></p>
								<div
									class="d-flex justify-content-between align-items-center mb-2">
									<input type="hidden" name="price"
										value="<%=retriveProduct.getString("price")%>"> <input
										type="hidden" name="mrp_price"
										value="<%=retriveProduct.getString("mrp_price")%>">
									<del class="text-muted">
										S/.
										<%=retriveProduct.getString("mrp_price")%></del>
									<span class="item_price">S/. <%=retriveProduct.getString("price")%></span>
								</div>
								<input type="submit" value="Add to Cart"
									class="btn btn-dark btn-block"
									onclick="return confirm('Are you sure you want to add this item to your cart?');">
							</div>
						</div>
					</form>
				</div>
				<%
				}
				%>
			</div>

			<!-- Enlace para ver todos los productos -->
			<div class="text-center mt-4">
				<a href="products.jsp" class="btn btn-info">Ver todos los
					productos</a>
			</div>

		</div>
	</div>
	<br />
	<div class="container">
		<div class="row text-center">
			<div class="col-md-12 mb-4">
				<h3>PASOS PARA COMPRAR EN LÍNEA</h3>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-md-3 mb-4">
				<div class="card text-white bg-success h-100">
					<div
						class="card-body d-flex flex-column justify-content-center align-items-center">
						<i class="fas fa-user fa-3x mb-3"></i>
						<h4 class="card-title">INGRESE A SU CUENTA</h4>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card text-white bg-danger h-100">
					<div
						class="card-body d-flex flex-column justify-content-center align-items-center">
						<i class="fas fa-check fa-3x mb-3"></i>
						<h4 class="card-title">SELECCIONA ARTÍCULO</h4>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card text-white bg-primary h-100">
					<div
						class="card-body d-flex flex-column justify-content-center align-items-center">
						<i class="fas fa-credit-card fa-3x mb-3"></i>
						<h4 class="card-title">HACER EL PAGO</h4>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card text-white bg-warning h-100">
					<div
						class="card-body d-flex flex-column justify-content-center align-items-center">
						<i class="fas fa-truck fa-3x mb-3"></i>
						<h4 class="card-title">RECIBE SU PEDIDO</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>