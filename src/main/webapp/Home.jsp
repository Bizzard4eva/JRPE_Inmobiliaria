<<<<<<< Updated upstream
<%@page import="Entidades.Distrito"%>
<%@page import="Entidades.CardInmueble"%>
<%@page import="java.util.List"%>
=======
<%@page import="Entidades.Usuario"%>
>>>>>>> Stashed changes
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Home.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid m-0 p-0">
<<<<<<< Updated upstream
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<!-- Logo -->
				<a class="navbar-brand d-flex align-items-center" href="#"> <img
					src="./images/logo.svg" alt="Logo" class="logo"> <span
					class="brand-name">JRPE Inmobiliaria</span>
				</a>

				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Nosotros</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Inmuebles</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contacto</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- Banner -->
		<div class="banner-container position-relative">

			<div
				class="banner-content text-center position-absolute top-50 start-50 translate-middle">
				<h2>Bienvenidos a JRPE Inmobiliaria</h2>
				<p>Encuentra las mejores opciones para tu futuro hogar</p>

				<div class="filter p-4">
					<form action="CardInmuebleServlet?type=search" class="search-filter d-flex justify-content-center">
						
						<input type="text" placeholder="Precio M�n"
							class="form-control mx-2" name="min"> 
					    <input type="text"
							placeholder="Precio M�x" class="form-control mx-2" name="max"> 
						<select name="distrito" class="form-select mx-2">
							<option value="">Distrito</option>
							<%
							List<Distrito> listDistrito = (List<Distrito>) request.getAttribute("listDistrito");
							if (listDistrito != null) {
								for (Distrito distrito : listDistrito) {
							%>
							 <option value="<%=distrito.getId()%>"><%=distrito.getNombre()%></option>
							<%
							}
							}
							%>
						</select>

						<select name="tipoInmueble" class="form-select mx-2">
							<option value="">Tipo</option>
							<%
                            List<String> tipoInmueble = (List<String>) request.getAttribute("tipoInmueble");
                            if (tipoInmueble != null) {
                               for (String tipo : tipoInmueble) {
                            %>
							 <option value="<%=tipo%>"><%=tipo%></option>
							<%
                            }
                            }
                            %>
						</select>
						<button type="submit" class="btn btn-search mx-2"
							style="text-align: center; width: 50%;">BUSCAR</button>
					</form>
				</div>
			</div>

=======
	<nav class="navbar navbar-expand-lg">
		<div class="container">
		<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>
			<!-- Logo -->
			<a class="navbar-brand d-flex align-items-center" href="/"> <img
				src="./images/logo.svg" alt="Logo" class="logo"> <span
				class="brand-name">JRPE Inmobiliaria</span>
			</a>
			<% if (usuario != null) { %>
			    <span class="text-white">- <%= usuario.getNombre() %>!</span>
			<% } %>
			<!-- Men� de navegaci�n -->
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="/">Inicio</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Nosotros</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Inmuebles</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Contacto</a>
				</li>
			</ul>
>>>>>>> Stashed changes
		</div>
		<!-- Cartas -->
		<div class="container mt-4">
			<div class="row g-4">
				<%
				List<CardInmueble> listCardInmueble = (List<CardInmueble>) request.getAttribute("listCardInmueble");
				if (listCardInmueble != null) {
					for (CardInmueble card : listCardInmueble) {
				%>
				<div class="col-md-4">
					<div class="card h-100">
						<img src="<%=card.getRutaImagenInmueble()%>" class="card-img-top"
							alt="" style="height: 220px;">
						<div class="card-body d-flex flex-column align-items-start">
							<h5 class="card-title" style="color: #333;">
								S/<%=card.getPrecioInmueble()%></h5>
							<p class="card-text" style="color: #333;">
								<img src="./images/address.png" class="icons">
								<%=card.getDireccionInmueble()%>
							</p>
							<p class="card-text" style="color: #333;">
								<img src="./images/rooms.png" class="icons">
								<%=card.getHabitacionesInmueble()%>
								dormitorios <img src="./images/bath.png" class="icons">
								<%=card.getBanosInmueble()%>
								ba�os
							</p>
							<p class="card-text" style="color: #333;">
								<img src="./images/area.png" class="icons" style="color: #333;"><%=card.getAreaTotalInmueble()%>
								m� <img src="./images/area.png" class="icons"
									style="color: #333;"><%=card.getAreaConstruidaInmueble()%>
								m�
							</p>
							<a
								href="CardInmuebleServlet?type=detail&id=<%=card.getIdInmueble()%>"
								class="btn"
								style="background-color: #1b5161; color: white; margin-top: auto;">Detalles</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
		<!-- Pie de p�gina -->
		<footer class="containerfooter mt-5">
			<div class="row">
				<div class="col-md-4 text-center">
					<img class="logofooter mb-3" src="images/logo.svg" alt="logo">
					<h2>JRPE Inmobiliaria</h2>
					<p>Somos una empresa dedicada a ofrecer las mejores propiedades
						y departamentos, brindando confianza, calidad y atenci�n
						personalizada.</p>
				</div>
				<div class="info col-md-4 text-center">
					<h3>Contacto</h3>
					<p>
						<img src="./images/phone.png" class="footer-icon" alt="Tel�fono">+51
						987 654 321
					</p>
					<p>
						<img src="./images/email.png" class="footer-icon" alt="Email">contacto@propiedades.com
					</p>
					<p>
						<img src="./images/address.png" class="footer-icon"
							alt="Direcci�n">Lima, Per�
					</p>
				</div>
				<div class="info col-md-4 text-center">
					<h3>S�guenos</h3>
					<a href="#" class="social-link d-block">Facebook</a> <a href="#"
						class="social-link d-block">Instagram</a> <a href="#"
						class="social-link d-block">Twitter</a>
				</div>
			</div>
			<div class="row mt-4">
				<div class="copy col text-center">
					<p>&copy; 2024 Propiedades. Todos los derechos reservados.</p>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>