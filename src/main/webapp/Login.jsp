<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://bootstrap.com">
<title>Login</title>
 <link 
 	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" 
 	rel="stylesheet">
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">
</head>
<style>
	*{
		margin: 0;
		padding: o;
		box-sizing: border-box;
	}
	body {
		font-family: 'Roboto', sans-serif;
		line-height: 1.6;
	}
	.container__menu {
		background: #182F59;
	}
	.container_submenu {
		background: #818a91;
	}
	.fs-14 {
		font-size: 14px;
	}
	.fw-600 {
	  	font-weight: 600;
	}
	.h-3rem {
		height: 3rem
	}
	.text-gray-200 {
		color: #667085;
	}
	.container_form {
		min-height: 609px;
		max-height: 609px;
		height: 100%;
		overflow-y: auto; 
	}
	.login__button {
		background-color: #1b5161;
		color: #fff;
	}
	
	.login__button:hover {
		background-color: #1b5161;
		color: #fff;
		cursor: pointer;
	}
	
	.register__button {
		border: 1px solid #1b5161;
		color: #1b5161;
	}
	
	.register__button:hover {
		background-color: #83b3c1;
		color: #fff;
	}
	
	@media (max-width: 1400px) {
		.container_form {
			min-height: 540px;
			max-height: 540px;
		}
	}
	
	@media (max-width: 1200px) {
		.container_form {
			min-height: 451px;
			max-height: 451px;
		}
	}
	
	@media (max-width: 991px) {
		.container_form {
			width: 100%;
			height: auto;
			max-height: 700px;
		}
	  	.login__image {
	   	 	display: none;
	  	}
	}
	
	/* Estilos para el scrollbar en Webkit */
	::-webkit-scrollbar {
	  	width: 8px;
	}
	
	::-webkit-scrollbar-thumb {
		  background-color: #1b5161; /* Color scrollbar en Webkit */
		  border-radius: 10px; 
		  border: 2px solid #ffffff;
	}
	
	
	/* 	Estilos del header */
	.navbar {
		background-color: #1b5161;
	}
	
	.navbar .navbar-brand .logo {
		height: 50px;
	}
	
	.navbar .navbar-brand .brand-name {
		color: white;
		font-weight: bold;
	}
	
	.navbar-nav .nav-link {
		color: white;
		font-weight: 500;
	}
	
	.navbar-nav .nav-link:hover {
		color: grey;
	}
	

</style>
<body>
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
	
	<section class="container my-5">
	  <div class="row justify-content-center">
	    <div class="col-md-6 px-5 py-3 bg-light rounded container_form">
	    	<div class="my-4">
	    		<h3 class="fw-bold">BIENVENIDO</h3>
	    		<span class="fs-14 text-gray-200">Inicia sesión o regístrate para ingresar a grandes beneficios y descuentos.</span>
	    	</div>
		      <div class="text-center mb-4">
		      	<!-- Botones de cambio -->
			    <div class="col-12 text-center mb-4 w-100 d-flex">
			      <button id="login-button" class="btn me-2 w-100">Iniciar Sesión</button>
			      <button id="register-button" class="btn w-100">Crear Cuenta</button>
			    </div>
		      </div>
		      
		      <!-- Formulario de inicio de sesión -->
		      <form action="LoginServlet" id="login-form" method="POST">
		      		<% String mensaje = (String) request.getAttribute("mensaje"); %>
			        <div class="mb-3 fw-normal">
			        	<label class="mb-1" for="txtEmail">Email</label>
			          	<input type="email" class="form-control h-3rem" placeholder="Email" name="txtEmail" required>
			        </div>
			        <div class="mb-3 fw-normal">
			        	<label class="mb-1" for="txtPassword">Contraseña</label>
			          	<input type="password" class="form-control h-3rem" placeholder="Contraseña"  name="txtPassword" required>
			        </div>
			        <% if (mensaje != null) { %>
					    <div class="alert alert-danger">
					        <%= mensaje %>
					    </div>
					<% } %>
		        	<button type="submit" class="btn login__button w-100 h-3rem mt-2 fw-normal">Iniciar Sesión</button>
		      </form>
		      
		      <!-- Formulario de registro -->
		      <form action="" id="register-form" class="d-none mb-2" method="POST">
		        <div class="mb-3">
			    	<label class="mb-1" for="txtName">Nombre</label>
			        <input type="text" class="form-control h-3rem" placeholder="Nombre" name="txtName" required>
		        </div>
		        <div class="mb-3">
		        	<label class="mb-1" for="txtEmail">Email</label>
		          	<input type="email" class="form-control h-3rem" placeholder="Email" name="txtEmail" required>
		        </div>
		        <div class="mb-3">
		        	<label class="mb-1" for="txtTel">Teléfono</label>
		          	<input type="tel" class="form-control h-3rem" placeholder="Teléfono" name="txtTel" required>
		        </div>
		        <div class="mb-3">
		        	<label class="mb-1" for="txtPassword">Contraseña</label>
		            <input type="password" class="form-control h-3rem" placeholder="Contraseña" name="txtPassword" required>
		        </div>
		        <button type="submit" class="btn login__button w-100 h-3rem fw-normal"">Crear Cuenta</button>
		      </form>
		    </div>
		    <!-- Imagen -->
		    <div class="col-md-6 login__image">
		      <img src="images/login.jpg" alt="Personas firmando documentos" class="img-fluid rounded shadow">
		    </div>
		  </div>
	</section>
	<footer>
	</footer>
</body>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js">
</script>
<script type="text/javascript">
	$(document).ready(function () {
	  const $loginForm = $('#login-form')
	  const $registerForm = $('#register-form')
	  const $loginButton = $('#login-button')
	  const $registerButton = $('#register-button')

	  // Función para mostrar el formulario de inicio de sesión
	  const showLoginForm = () => {
	    $loginForm.removeClass('d-none')
	    $registerForm.addClass('d-none')

	    $loginButton.addClass('login__button').removeClass('register__button')
	    $registerButton.addClass('register__button').removeClass('login__button')
	  };

	  // Función para mostrar el formulario de registro
	  const showRegisterForm = () => {
	    $loginForm.addClass('d-none')
	    $registerForm.removeClass('d-none')

	    $loginButton.addClass('register__button').removeClass('login__button')
	    $registerButton.addClass('login__button').removeClass('register__button')
	  };

	  $loginButton.on('click', showLoginForm)
	  $registerButton.on('click', showRegisterForm)

	  showLoginForm()
	});

</script>
</html>