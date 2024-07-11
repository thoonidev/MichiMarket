<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Defining Header for the Admin/Seller-->
<section class="menu-section">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#menu-top" aria-controls="menu-top"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="menu-top">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="dashboard.jsp">
							<i class="fas fa-home"></i> Home
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-add-product.jsp"> <i class="fas fa-plus"></i> Add
							Product
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-view-product.jsp"> <i class="fas fa-eye"></i> Ver Productos
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-all-orders.jsp"> <i class="fas fa-list"></i> Ver Ordenes
					</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="admin-pending-orders.jsp"> <i class="fas fa-clock"></i>
							Pedidos Pendientes
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-delivered-orders.jsp"> <i
							class="fas fa-check-circle"></i> Entregados
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-view-customers.jsp"> <i class="fas fa-users"></i>
							Ver Usuarios
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin-logout.jsp"> <i class="fas fa-sign-out-alt"></i>
							SALIR
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
</section>


