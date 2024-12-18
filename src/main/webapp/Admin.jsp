<%@page import="Entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% Usuario admin = (Usuario) request.getAttribute("admin"); %>
		<% if (admin != null) { %>
		    <span>Bienvenido, <%= admin.getNombre() %>!</span>
		<% } %>
</body>
</html>