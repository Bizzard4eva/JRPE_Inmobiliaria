<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<% request.setAttribute("hideLoginButton", true); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://bootstrap.com">
<title>Login</title>
 <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/Header.css">
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
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
		      <form action="LoginServlet" id="login-form" method="post">
		      		<input type="hidden" name="action" value="login">
			        <div class="mb-3 fw-normal">
			        	<label class="mb-1" for="txtEmail">Email</label>
			          	<input type="email" class="form-control h-3rem" placeholder="Email" name="txtEmail" required>
			        </div>
			        <div class="mb-3 fw-normal">
			        	<label class="mb-1" for="txtPassword">Contraseña</label>
			          	<input type="password" class="form-control h-3rem" placeholder="Contraseña"  name="txtPassword" required>
			        </div>
			        
			        <x:if test="${ not empty mensaje }">
			        	<div class="alert alert-danger">
			        		${ mensaje }
			        	</div>
			        </x:if>

		        	<button type="submit" class="btn login__button w-100 h-3rem mt-2 fw-normal">Iniciar Sesión</button>
		      </form>
		      
		      <!-- Formulario de registro -->
		      <form action="UsuarioServlet" id="register-form" class="d-none mb-2" method="post">
		      	<input type="hidden" name="action" value="add">
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
		        <button type="submit" class="btn login__button w-100 h-3rem fw-normal">Crear Cuenta</button>
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