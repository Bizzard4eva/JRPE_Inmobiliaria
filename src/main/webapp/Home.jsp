<%@ page import="Entidades.TipoInmueble"%>
<%@ page import="Entidades.CardInmueble"%>
<%@ page import="Entidades.Distrito"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/Home.css">
</head>
<body>

	<div class="container-fluid m-0 p-0">
		<%@ include file="Header.jsp" %>
		<!-- Banner -->
		<div class="banner-container position-relative">

			<div
				class="banner-content text-center position-absolute top-50 start-50 translate-middle">
				<h2>Bienvenidos a JRPE Inmobiliaria</h2>
				<p>Encuentra las mejores opciones para tu futuro hogar</p>

				<div class="filter p-4" style="background-color: rgba(0, 0, 0, 0.5); border-radius: 30px;">
						<form action="InmuebleServlet" class="search-filter d-flex justify-content-center">
							<input type="hidden" name="action" value="loadCatalog">
							<input type="hidden" name="redirectTo" value="Catalog">
							
							<input type="text" name="minPrice" placeholder="Precio Min" class="form-control mx-2">
							<input type="text" name="maxPrice" placeholder="Precio Max" class="form-control mx-2">
							<select name="distritoSelected" class="form-select mx-2">
								<option value="1">Distrito</option>
								
								<x:if test="${ not empty listDistrito }">
									<x:forEach var="distrito" items="${ listDistrito }">
										<option value="${ distrito.idDistrito }">${ distrito.nombre }</option>
									</x:forEach>
								</x:if>
								
							</select>

							<select name="tipoInmuebleSelected" class="form-select mx-2">
								<option value="1">Tipo</option>
								
								<x:if test="${ not empty listTipoInmueble }">
									<x:forEach var="tipo" items="${ listTipoInmueble }">
										<option value="${ tipo.idTipoInmueble }">${ tipo.tipo }</option>
									</x:forEach>
								</x:if>
								
							</select>
							<button type="submit" class="btn btn-search mx-2" style="background-color: #1b5161; text-align: center; width: 50%; color:white;">
								BUSCAR
							</button>
					</form>
				</div>
			</div>

		</div>
		<!-- Cartas -->
		<div class="container mt-4">
			<div class="row g-4">
			
				<x:if test="${ not empty listCardInmueble }">
					<x:forEach var="card" items="${ listCardInmueble }">
						<div class="col-md-4">
							<div class="card h-100">
								<img src="${ card.rutaImagenInmueble }" class="card-img-top" style="height: 220px;">
								<div class="card-body d-flex flex-column align-items-start">
									<h5 class="card-title" style="color: #333;">S/${ card.precioInmueble }</h5>
									<p class="card-text" style="color: #333;">
										<img src="./images/address.png" class="icons">${ card.direccionInmueble }
									</p>
									<p class="card-text" style="color: #333;">
										<img src="./images/rooms.png" class="icons">
										${ card.habitacionesInmueble } dormitorios
									</p>
									<p class="card-text" style="color: #333;">
										<img src="./images/bath.png" class="icons">
										${ card.banosInmueble } baños
									</p>
									<p class="card-text" style="color: #333;">
										<img src="./images/area.png" class="icons" style="color: #333;">
										${ card.areaTotalInmueble }
										<img src="./images/area.png" class="icons" style="color: #333;">
										${ card.areaConstruidaInmueble }
									</p>
									<a href="InmuebleServlet?action=loadProperty&idInmueble=${ card.idInmueble }&redirectTo=Property" 
									class="btn" style="background-color: #1b5161; color: white; margin-top: auto;">Detalles</a>																	
								</div>
							</div>
						</div>
					</x:forEach>
				</x:if>
				
			</div>
		</div>
		<!-- Pie de pagina -->
		<footer class="containerfooter mt-5">
			<div class="row">
				<div class="col-md-4 text-center">
					<img class="logofooter mb-3" src="images/logo.svg" alt="logo">
					<h2 style="color: white;">JRPE Inmobiliaria</h2>
					<p style="color: white;">Somos una empresa dedicada a ofrecer las mejores propiedades
						y departamentos, brindando confianza, calidad y atencion
						personalizada.</p>
				</div>
				<div class="info col-md-4 text-center">
					<h3>Contacto</h3>
					<p>
						<img src="./images/phone.png" class="footer-icon" alt="Telefono">+51
						987 654 321
					</p>
					<p>
						<img src="./images/email.png" class="footer-icon"
							alt="Email">contacto@propiedades.com
					</p>
					<p>
						<img src="./images/address.png" class="footer-icon" alt="Direccion">Lima,
						Peru
					</p>
				</div>
				<div class="info col-md-4 text-center">
					<h3>Siguenos</h3>
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