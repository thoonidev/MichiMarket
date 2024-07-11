<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PRODUCTOS</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<jsp:include page="Components/Navegacion.jsp"></jsp:include>
	<div class="page-head">
		<div class="container">
			<h3 class="text-center mt-4">PRODUCTOS</h3>
		</div>
	</div>
	<hr
		style="border: 0; height: 2px; background-image: linear-gradient(to left, #fff, #000, #fff);">
	<div class="electronics">
		<div class="container">
			<div class="clearfix"></div>
			<div class="row">
				<div class="col">
					<h3 class="text-center mb-4">NUESTROS PRODUCTOS</h3>
				</div>
			</div>
			<div class="row">
				<%
				ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
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
								<%--<p class="card-text">
									Categoría:
									<%=retriveProduct.getString("product_category")%></p>
								<p class="card-text">
									Descripción:
									<%=retriveProduct.getString("description")%></p>--%>
								<div class="mb-3">
									<p class="mb-1">
										<strong>Categoría: </strong><%=retriveProduct.getString("product_category")%></p>
									<p class="mb-1">
										<strong>Descripción: </strong><%=retriveProduct.getString("description")%></p>
								</div>
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
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>