<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD PRODUCT</title>
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
	<div class="container mb-4">
		<div class="row mt-4">
			<div class="col-md-12">
				<h4 class="text-center mb-4">ADD PRODUCT</h4>
			</div>
		</div>
		<%-- Código Java para mostrar el mensaje de éxito --%>
		<%
		String message = (String) session.getAttribute("message");
		if (message != null) {
			session.removeAttribute("message");
		%>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			Producto agregado exitosamente.
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
		}
		%>

		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<h5 class="card-header">AGREGAR PRODUCTO</h5>
					<div class="card-body">
						<form action="AddProducts" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Nombre</label> <input class="form-control"
									type="text" name="pname" required>
							</div>
							<div class="form-group">
								<label>Precio</label> <input class="form-control" type="number"
									name="price" required>
							</div>
							<div class="form-group">
								<label>Descripción</label> <input class="form-control"
									type="text" style="min-height: 100px;" name="description"
									required>
							</div>
							<div class="form-group">
								<label>Precio Máximo</label> <input class="form-control"
									type="number" name="mprice" required>
							</div>
							<div class="form-group">
								<label>Estado</label> <select class="form-control" name="status"
									required>
									<option>Active</option>
									<option>In-Active</option>
								</select>
							</div>
							<div class="form-group">
								<label>Categoría</label> <input class="form-control"
									type="text" name="category" required>
							</div>
							<div class="form-group">
								<label>Imagen</label> <input type="file"
									class="form-control-file" name="uploadLogo" required>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-success mr-2"
									onclick="return confirm('Are you sure you want to add this product?');">Add
									Product</button>
								<button type="reset" class="btn btn-danger">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
	} else {
	response.sendRedirect("admin-login.jsp");
	}
	%>
</body>
</html>