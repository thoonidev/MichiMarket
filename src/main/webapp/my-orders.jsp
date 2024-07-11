<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>ORDERS</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%
	//Checking whether customer in session or not
	if (session.getAttribute("name") != null && session.getAttribute("name") != "") {
	%>

<body>
	<jsp:include page="Components/Navegacion.jsp"></jsp:include>
	<div class="page-head bg-light mt-4 text-center">
		<div class="container">
			<h3>LIST ORDERS</h3>
		</div>
	</div>
	<hr
		style="border: 0; height: 2px; background-image: linear-gradient(to left, #fff, #000, #fff);">
	<div class="checkout">
		<div class="container text-center">
			<h3 class="mb-4">MY ORDERS</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col">SR.No</th>
							<th scope="col">Order No</th>
							<th scope="col">Product</th>
							<th scope="col">Quantity</th>
							<th scope="col">MRP(S/.)</th>
							<th scope="col">Selling Price(S/.)</th>
							<th scope="col">Total Price(S/.)</th>
							<th scope="col">Order Date</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						int index = 0;
						ResultSet totalProduct = DatabaseConnection
								.getResultFromSqlQuery("select * from tblorders where customer_name='" + session.getAttribute("name") + "' ");
						while (totalProduct.next()) {
							index++;
						%>
						<tr class="rem1">
							<td><%=index%></td>
							<td><%=totalProduct.getInt(18)%></td>
							<td><img src="uploads/<%=totalProduct.getString(9)%>"
								alt="<%=totalProduct.getString(10)%>"
								style="max-width: 150px; max-height: 100px;" class="img-fluid">
								<br> <%=totalProduct.getString(10)%></td>
							<td><%=totalProduct.getString(11)%></td>
							<td><del><%=totalProduct.getString(12)%></del></td>
							<td><%=totalProduct.getString(13)%></td>
							<td><%=totalProduct.getString(14)%></td>
							<td><%=totalProduct.getString(16)%></td>
							<%
							if (totalProduct.getString(15).equals("Deliver")) {
							%>
							<td><span class="badge badge-success">Delivered</span></td>
							<%
							} else {
							%>
							<td><span class="badge badge-danger">Pending</span></td>
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

	<script>
		$(document).ready(function() {
			$('.value-plus').on('click', function() {
				var divUpd = $(this).parent().find('.value');
				var newVal = parseInt(divUpd.text(), 10) + 1;
				divUpd.text(newVal);
			});

			$('.value-minus').on('click', function() {
				var divUpd = $(this).parent().find('.value');
				var newVal = parseInt(divUpd.text(), 10) - 1;
				if (newVal >= 1)
					divUpd.text(newVal);
			});
		});
	</script>

	<jsp:include page="footer.jsp"></jsp:include>
	<%
	} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>