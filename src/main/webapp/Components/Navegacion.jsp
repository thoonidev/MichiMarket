<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">MICHIMARKET</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li
					class="nav-item <%=(request.getRequestURI().endsWith("index.jsp")) ? "active" : ""%>">
					<a class="nav-link" href="index.jsp"> <i class="fas fa-home"></i>
						Home
				</a>
				</li>
				<li
					class="nav-item <%=(request.getRequestURI().endsWith("products.jsp")) ? "active" : ""%>">
					<a class="nav-link" href="products.jsp"> <i class="fas fa-box"></i>
						Productos
				</a>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<%
				if (session.getAttribute("name") != null) {
				%>
				<!-- Usuario autenticado -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <i
						class="fas fa-user"></i> <%=session.getAttribute("name")%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="my-orders.jsp"><i
							class="fas fa-shopping-bag"></i> My Orders</a> <a
							class="dropdown-item" href="logout.jsp"><i
							class="fas fa-sign-out-alt"></i> Logout</a>
					</div></li>
				<%
				} else {
				%>
				<!-- Usuario no autenticado -->
				<li class="nav-item"><a class="nav-link"
					href="customer-login.jsp"> <i class="fas fa-sign-in-alt"></i>
						Login
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="customer-register.jsp"> <i class="fas fa-user-plus"></i>
						Registrarse
				</a></li>
				<li class="nav-item"><a class="nav-link" href="admin-login.jsp">
						<i class="fas fa-user-shield"></i> Admin Login
				</a></li>
				<%
				}
				%>

				<!-- Carrito de compras siempre visible -->
				<li class="nav-item"><a class="nav-link" href="checkout.jsp">
						<i class="fas fa-shopping-cart"></i> <%
 ResultSet resultCount = DatabaseConnection
 		.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
 resultCount.next();
 int count = resultCount.getInt(1);
 %> (<span class="item-count"><%=count%></span> items)
				</a></li>
			</ul>
		</div>
	</div>
</nav>




