<%@ page import="Entidades.Header"%>
<%@ page import="Entidades.Usuario"%>
<%@ page import="Util.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="css/Header.css">
</head>
<body>
	<% String nombreUsuario = (String) session.getAttribute(Constants.NAME); %>
	<% String rolUsuario = (String) session.getAttribute(Constants.ROL); %>
	<nav class="navbar navbar-expand-lg">
		<!-- Login desktop -->
		<div class="container container__header">
			<!-- Logo -->
			<a class="navbar-brand d-flex align-items-center" href="Home.jsp"> 
				<img src="./images/logo.svg" alt="Logo" class="logo" height="50" width="50"> 
				<span class="brand-name">JRPE Inmobiliaria</span>
				<% if (nombreUsuario != null) { %>
					<div class="usuario__name"> - <%= nombreUsuario %> </div>
				<% } %>
			</a>
			 
			<div class="d-flex align-items-center">
				<!-- Menu -->
				<ul class="menu__header">
					<% if (rolUsuario != null && (rolUsuario.equals("Administrador") || rolUsuario.equals("Agente"))) { %>
						<% for (Header item : Constants.ITEMS_HEADER_ADMIN) { %>
								<li class="nav-item">
									<a class="nav-link" href="<%= item.getUrl()%>">
										<%= item.getItemMenu()%>
									</a>
								</li>
						<% } %>
					<% } else {%>
						<% for (Header item : Constants.ITEMS_HEADER) { %>
								<li class="nav-item">
									<a class="nav-link" href="<%= item.getUrl()%>">
										<%= item.getItemMenu()%>
									</a>
								</li>
						<% } %>
					<% } %>
				</ul>

				<% if (nombreUsuario != null) { %>
				    <form 
				        action="LoginServlet" 
				        method="post" 
				        id="cerrar-sesion"
				        style="<% if (request.getAttribute("hideLoginButton") != null) { %>display: none;<% } %>"
				    >
				        <input type="hidden" name="action" value="logout">
				        <button class="btn btn-outline-light" type="submit">Cerrar Sesión </button>
				    </form>
				<% } else { %>
				    <div 
				        class="button__login" 
				        id="button-login"
				        style="<% if (request.getAttribute("hideLoginButton") != null) { %>display: none;<% } %>"
				    >
				        <img alt="candado" src="images/svg/login.svg" class="icon__login">
				        <a href="Login.jsp">
				            Inicio Sesión
				        </a>
				    </div>
				<% } %>
			</div>
		</div>
	</nav>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script type="text/javascript"></script>
</html>