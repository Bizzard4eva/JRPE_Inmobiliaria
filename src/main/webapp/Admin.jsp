<%@page import="Entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<% Usuario admin = (Usuario) request.getAttribute("admin"); %>
		<% if (admin != null) { %>
		    <span>Bienvenido, <%= admin.getNombre() %>!</span>
		<% } %>
</body>
</html>