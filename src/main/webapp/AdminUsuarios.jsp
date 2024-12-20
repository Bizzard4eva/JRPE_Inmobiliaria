<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lista Usuarios</title>
	<link rel="stylesheet" href="css/Admin.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="css/Header.css">
</head>
<body>

	<%@ include file="Header.jsp" %>
	
	<div class="container mt-5">
		<div class="d-flex justify-content-between mb-2">
			<h2>Lista Usuarios</h2>
			<button type="button" class="btn btn-success" >Agregar Empleado</button>
		</div>
		<table class="table table-bordered">
			  <thead>
				<tr>
				  <th scope="col">ID</th>
				  <th scope="col">Nombre</th>
				  <th scope="col">Rol</th>
				  <th scope="col">Email</th>
				  <th scope="col">Password</th>
				  <th scope="col">Telefono</th>
				  <th scope="col" class="col-2">Acciones</th>
				</tr>
			  </thead>
			  <tbody>
			  
			  <x:if test="${ not empty usuarios }">
			  <x:forEach var="usuario" items="${ usuarios }">
				  <tr>
				  	<th scope="row">${ usuario.idUsuario }</th>
		            <td>${ usuario.nombre }</td>
		            <td>${ usuario.rol }</td>
		            <td>${ usuario.email }</td>
		            <td>${ usuario.password }</td>
		            <td>${ usuario.telefono }</td>
		        	<td class="d-flex gap-2 w-100 col-2">
		        		<button type="button" class="btn btn-warning" >Editar</button>
		        		<button type="button" class="btn btn-danger">Eliminar</button>
		        	</td>			  	
				  </tr>		
			  </x:forEach>
			  </x:if>
			  
			  </tbody>
		</table>
	</div>
</body>
</html>