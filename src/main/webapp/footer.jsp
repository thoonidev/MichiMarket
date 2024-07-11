<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Defining Footer -->
<footer class="footer-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="contact-info">
					<h4 style="color: #ffc107;">Contáctanos:</h4>
					<ul>
						<li><i class="fas fa-map-marker-alt"></i> Dirección: Calle, <span>Olivar.</span></li>
						<li><i class="fas fa-envelope"></i> Email: <a
							href="mailto:info@gmail.com">michimarket@gmail.com</a></li>
						<li><i class="fas fa-phone"></i> Tfno: +51 985457856</li>
					</ul>
				</div>
			</div>
			<div class="col-md-6">
				<div class="footer-bottom">
					<h4>
						&copy; <span id="year"></span> MICHIMARKET | <a
							href="https://www.paypal.com/pe/welcome/signup/#/login_info" target="_blank">"NOS
							APASIONA LA TECNOLOGIA"</a>
					</h4>
				</div>
			</div>
		</div>
	</div>
</footer>

<script>
    document.getElementById("year").innerHTML = new Date().getFullYear();
</script>