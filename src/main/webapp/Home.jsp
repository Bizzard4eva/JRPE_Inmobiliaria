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
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand d-flex align-items-center" href="#"> <img
				src="./images/logo.svg" alt="Logo" class="logo"> <span
				class="brand-name">JRPE Inmobiliaria</span>
			</a>

			<!-- Menú de navegación -->
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
	  <div class="banner-container">
        <div class="banner-content text-center">
            <h2>Bienvenidos a JRPE Inmobiliaria</h2>
            <p>Encuentra las mejores opciones para tu futuro hogar</p>

            <div class="filter p-4">
                <form class="search-filter d-flex justify-content-center">
                    <input type="text" placeholder="Palabra clave" class="form-control mx-2">
                    <select class="form-select mx-2">
                        <option value="distrito">Distrito</option>
                        <option value="modalidad">Modalidad</option>
                        <option value="tipo_inmueble">Tipo de Inmueble</option>
                    </select>
                    <select class="form-select mx-2">
                        <option value="tipo_inmueble">Tipo De Inmueble</option>
                        <option value="condicion">Condición</option>
                        <option value="precio">Precio</option>
                    </select>
                    <button type="submit" class="btn btn-search mx-2">BUSCAR</button>
                </form>
            </div>
        </div>
    </div>
	<!-- Cartas -->
	<div class="containerCard">
		<div class="card col-4">
			<img src="./images/depa1.png" class="card-img-top" alt="">
			<div class="card-body">
				<h5 class="card-title">S/1400.00</h5>
				<p class="card-text">
					<img src="./images/address.png" class="icons">Magdalena
				</p>
				<p class="card-text">
					<img src="./images/rooms.png" class="icons"> 4 dormitorios <img
						src="./images/bath.png" class="icons"> 5 baños
				</p>
				<p class="card-text">
					<img src="./images/area.png" class="icons">Área Construida
					525m²
				</p>
				<a href="" class="btn btn-primary">Detalles</a>
			</div>
		</div>
	</div>
	<!-- Pie de página -->
    <footer class="containerfooter mt-5">
        <div class="row">
            <div class="col-md-4 text-center">
                <img class="logofooter mb-3" src="images/logo.svg" alt="logo">
                <h2>JRPE Inmobiliaria</h2>
                <p>Somos una empresa dedicada a ofrecer las mejores propiedades y departamentos, brindando confianza, calidad y atención personalizada.</p>
            </div>
            <div class="info col-md-4 text-center">
                <h3>Contacto</h3>
                <p><img src="./images/phone.png" class="footer-icon" alt="Teléfono">+51 987 654 321</p>
                <p><img src="./images/email.png" class="footer-icon" alt="Email">contacto@propiedades.com</p>
                <p><img src="./images/address.png" class="footer-icon" alt="Dirección">Lima, Perú</p>
            </div>
            <div class="info col-md-4 text-center">
                <h3>Síguenos</h3>
                <a href="#" class="social-link d-block">Facebook</a>
                <a href="#" class="social-link d-block">Instagram</a>
                <a href="#" class="social-link d-block">Twitter</a>
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