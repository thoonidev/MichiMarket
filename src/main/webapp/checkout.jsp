<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CHECKOUT</title>
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

	<div class="page-head">
		<div class="container">
			<h3 class="text-center mt-4">CHECK OUT</h3>
		</div>
	</div>
	<hr
		style="border: 0; height: 2px; background-image: linear-gradient(to left, #fff, #000, #fff);">
	<div class="checkout">
		<div class="container">
			<h3 class="text-center mb-4">MY SHOPPING BAG</h3>

			<%-- Si hay elementos en el carrito, mostrar la tabla --%>
			<%
			int index = 0;
			int paymentId = 101;
			ResultSet rsCountCheck = DatabaseConnection
					.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
			rsCountCheck.next();
			int cartItem = rsCountCheck.getInt(1);
			/*System.out.println("cartItem  " + cartItem);*/
			if (cartItem > 0) {
			%>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>SR.No</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>MRP(S/)</th>
							<th>Selling Price(S/)</th>
							<th>Total Price(S/)</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						ResultSet totalProduct = DatabaseConnection.getResultFromSqlQuery(
								"select tblproduct.image_name,tblproduct.name,tblcart.quantity,tblcart.mrp_price,tblcart.discount_price,tblcart.total_price,tblcart.product_id from tblproduct,tblcart where tblproduct.id=tblcart.product_id and customer_id='"
								+ session.getAttribute("id") + "' ");
						while (totalProduct.next()) {
							index++;
						%>
						<tr class="rem1">
							<td><%=index%></td>
							<td><img src="uploads/<%=totalProduct.getString(1)%>" alt=""
								class="pro-image-front" style="width: 150px; height: 100px;"><br>
								<%=totalProduct.getString(2)%></td>
							<td>
								<form action="UpdateProductQuantity" method="post"
									class="form-inline">
									<input type="hidden" value="<%=totalProduct.getInt(7)%>"
										name="productId"> <input type="number" name="quantity"
										value="<%=totalProduct.getInt(3)%>" class="form-control mr-2"
										style="width: 70px;"> <input type="submit"
										class="btn btn-danger" value="Change">
								</form>
							</td>
							<td><del>
									S/.
									<%=totalProduct.getString(4)%></del></td>
							<td>S/. <%=totalProduct.getString(5)%></td>
							<td>S/. <%=totalProduct.getString(6)%></td>
							<td><a
								href="removeProductFromCart.jsp?productId=<%=totalProduct.getInt(7)%>"
								onclick="return confirm('Are you sure you want to remove this item from cart?');">
									<i class="fa fa-trash"></i>
							</a></td>
						</tr>
						<%
						}
						%>
						<%-- Calcular el total final --%>
						<%
						double finalBill = 0.0;
						ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery(
								"select sum(total_price), sum(mrp_price) from tblcart where customer_id='" + session.getAttribute("id") + "' ");
						if (totolAmount.next()) {
							finalBill = totolAmount.getInt(1);
						}
						%>
						<tr>
							<td colspan="5" class="text-right"><strong>Total
									Amount:</strong></td>
							<td colspan="2">S/. <%=finalBill%></td>
						</tr>
					</tbody>
				</table>
			</div>

			<%-- Formulario de dirección de facturación y pago --%>
			<form action="GetProductsOrder" method="post">
				<h4 class="mt-4">
					<strong class="text-primary">DIRECCIÓN DE ENVÍO</strong>
				</h4>

				<%-- Mostrar información del usuario --%>
				<%
				ResultSet userInfoResult = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where id='"
						+ session.getAttribute("id") + "' and name='" + session.getAttribute("name") + "'");
				if (userInfoResult.next()) {
				%>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Nombres</label> <input type="text" name="name"
								value="<%=userInfoResult.getString("name")%>"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Teléfono</label> <input type="text" name="phone"
								value="<%=userInfoResult.getString("phone")%>"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="text" name="email"
								value="<%=userInfoResult.getString("email")%>"
								class="form-control" readonly>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Dirección</label> <input type="text" name="address"
								value="<%=userInfoResult.getString("address")%>"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Pin Code</label> <input type="text" name="pincode"
								value="<%=userInfoResult.getString("pin_code")%>"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Tipo Dirección</label> <select name="addressType"
								class="form-control">
								<option>Home</option>
								<option>Office</option>
								<option>Commercial</option>
							</select>
						</div>
						<div class="form-group">
							<label>Modo Pago</label> <select name="payment"
								class="form-control">
								<option>COD</option>
								<option>Credit Card</option>
								<option>Debit Card</option>
								<option>Online Banking</option>
								<option>UPI Id</option>
							</select>
						</div>
						<%
						ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorders");
						if (rsPaymentId.next()) {
							paymentId = rsPaymentId.getInt("max(payment_id)");
							paymentId++;
						}
						%>
						<input type="hidden" name="payment_id" value="<%=paymentId%>">
						<input type="submit" value="Buy Products" class="btn btn-success"
							onclick="return confirm('Are you sure Do you want to buy this order?');">
					</div>
				</div>
			</form>
			<%
			}
			%>

			<%-- Si no hay elementos en el carrito --%>
			<%
			} else {
			%>
			<div style="text-align: center;">
				<strong style="background-color: pink;">Gracias por dar orden.</strong>
			</div>
			<%
			if (index == 0) {
			%>
			<div style="text-align: center;">
				<strong style="background-color: pink;">No hay artículos
					en tu carrito.</strong>
			</div>
			<%
			}
			%>

			<%
			}
			%>

			<%-- Botón de volver a la tienda --%>
			<div class="container mt-5 mb-5">
				<div class="checkout-left">
					<div class="checkout-right-basket animated wow slideInRight"
						data-wow-delay=".5s">
						<form action="products.jsp">
							<button type="submit" class="btn btn-warning">
								<i class="fa fa-chevron-left"></i> Back To Shopping
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('.value-plus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) + 1;
							divUpd.text(newVal);
						});

		$('.value-minus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) - 1;
							if (newVal >= 1)
								divUpd.text(newVal);
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