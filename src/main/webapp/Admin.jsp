<%@ page import="java.util.List"%>
<%@ page import="Entidades.Inmueble"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrador</title>
<link rel="stylesheet" href="css/Admin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/Header.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
	<div class="container mt-5">
		<div class="d-flex justify-content-between mb-2">
			<h2>Lista Inmuebles</h2>
			<button type="button" class="btn btn-success">Crea Inmueble</button>
		</div>
		<table class="table table-bordered">
			  <thead>
				<tr>
				  <th scope="col">ID</th>
				  <th scope="col">Título</th>
				  <th scope="col">Precio</th>
				  <th scope="col">Tipo</th>
				  <th scope="col">Dirección</th>
				  <th scope="col">Baños</th>
				  <th scope="col">Área Total</th>
				  <th scope="col">Área Construida</th>
				  <th scope="col">Estado</th>
				  <th scope="col">Habitaciones</th>
				  <th scope="col">Agente</th>
				  <th scope="col">Distrito</th>
				  <th scope="col" >Acciones</th>
				</tr>
			  </thead>
			  <tbody>
			  
			  <x:if test="${ not empty listInmueble }">
			  	<x:forEach var="inmueble" items="${ listInmueble }">
			  		<tr>
			  			<th scope="row">${ inmueble.idInmueble }</th>
			  			<td>${ inmueble.titulo }</td>
			  			<td>${ inmueble.precio }</td>
			  			<td>${ inmueble.tipo }</td>
			  			<td>${ inmueble.direccion }</td>
			  			<td>${ inmueble.banos }</td>
			  			<td>${ inmueble.areaTotal }</td>
			  			<td>${ inmueble.areaConstruida }</td>
			  			<td>${ inmueble.estado }</td>
			  			<td>${ inmueble.habitaciones }</td>
			  			<td>${ inmueble.usuario.nombre }</td>
			  			<td>${ inmueble.distrito.nombre }</td>
			  			<td class="d-flex gap-2">
		  					<button type="button" class="btn btn-warning" id="buttonEdit">Editar</button>
		        			<button type="button" class="btn btn-danger" id="buttonDelete">Eliminar</button>
			  			</td>	  		
			  		</tr>
			  	</x:forEach>
			  </x:if>

			  </tbody>
		</table>
	</div>
</body>
</html>