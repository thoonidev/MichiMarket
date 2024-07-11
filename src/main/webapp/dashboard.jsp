<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DASHBOARD</title>
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
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12">
					<h4 class="header-line text-center">ADMIN DASHBOARD</h4>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-md-4 col-sm-6">
					<div class="card text-white bg-info mb-4">
						<div class="card-body text-center">
							<i class="fa fa-history fa-5x"></i>
							<%-- Count product query --%>
							<%
							ResultSet totalProduct = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblproduct");
							totalProduct.next();
							int allProducts = totalProduct.getInt(1);
							%>
							<h3><%=allProducts%></h3>
							<p class="card-text">Total Productos</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="card text-white bg-success mb-4">
						<div class="card-body text-center">
							<i class="fa fa-users fa-5x"></i>
							<%-- Count customer query --%>
							<%
							ResultSet totalCustomer = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcustomer");
							totalCustomer.next();
							int allCustomer = totalCustomer.getInt(1);
							%>
							<h3><%=allCustomer%></h3>
							<p class="card-text">Total Usuarios</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="card text-white bg-warning mb-4">
						<div class="card-body text-center">
							<i class="fa fa-recycle fa-5x"></i>
							<%-- Count orders query --%>
							<%
							ResultSet totalOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorders");
							totalOrders.next();
							int allOrders = totalOrders.getInt(1);
							%>
							<h3><%=allOrders%></h3>
							<p class="card-text">Total Ordenes</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container mt-4">
			<div class="row justify-content-center">
				<!-- Columna para el gráfico de barras -->
				<div class="col-md-6 mb-4">
					<div class="text-center">
						<canvas id="myBarChart" width="400" height="300"></canvas>
					</div>
				</div>
				<!-- Columna para el gráfico circular -->
				<div class="col-md-4 mb-4 text-center">
					<div class="text-center">
						<canvas id="myPieChart" width="400" height="300"></canvas>
					</div>
				</div>
			</div>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				// Configuración del gráfico de barras
				var ctxBar = document.getElementById('myBarChart').getContext(
						'2d');
				var barChart = new Chart(ctxBar, {
					type : 'bar',
					data : {
						labels : [ '******' ],
						datasets : [ {
							label : 'Productos',
							data : [
		<%=allProducts%>
			],
							backgroundColor : 'rgba(54, 162, 235, 0.6)',
							borderColor : 'rgba(54, 162, 235, 1)',
							borderWidth : 2
						}, {
							label : 'Usuarios',
							data : [
		<%=allCustomer%>
			],
							backgroundColor : 'rgba(75, 192, 192, 0.6)',
							borderColor : 'rgba(75, 192, 192, 1)',
							borderWidth : 2
						}, {
							label : 'Ordenes',
							data : [
		<%=allOrders%>
			],
							backgroundColor : 'rgba(255, 206, 86, 0.6)',
							borderColor : 'rgba(255, 206, 86, 1)',
							borderWidth : 2
						} ]
					},
					options : {
						plugins : {
							title : {
								display : true,
								text : 'GRAFICO BARRAS',
								font : {
									size : 16
								}
							}
						},
						scales : {
							y : {
								beginAtZero : true,
								max : 20,
								ticks : {
									precision : 0
								}
							}
						}
					}
				});

				// Configuración del gráfico circular
				var ctxPie = document.getElementById('myPieChart').getContext(
						'2d');
				var pieChart = new Chart(ctxPie, {
					type : 'pie',
					data : {
						labels : [ 'Productos', 'Usuarios', 'Ordenes' ],
						datasets : [ {
							label : 'Data',
							data : [
		<%=allProducts%>
			,
		<%=allCustomer%>
			,
		<%=allOrders%>
			],
							backgroundColor : [ 'rgba(54, 162, 235, 0.6)',
									'rgba(75, 192, 192, 0.6)',
									'rgba(255, 206, 86, 0.6)' ],
							borderColor : [ 'rgba(54, 162, 235, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(255, 206, 86, 1)' ],
							borderWidth : 2
						} ]
					},
					options : {
						plugins : {
							title : {
								display : true,
								text : 'GRAFICO CIRCULAR',
								font : {
									size : 16
								}
							}
						},
						scales : {
							y : {
								beginAtZero : true,
								max : 20,
								ticks : {
									precision : 0
								}
							}
						}
					}
				});
			});
		</script>

		<jsp:include page="footer.jsp"></jsp:include>
		<%
		} else {
		response.sendRedirect("admin-login.jsp");
		}
		%>
	
</body>
</html>