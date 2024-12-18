<%@page import="Entidades.Venta"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista ventas</title>
<link rel="stylesheet" href="css/Admin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/Header.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
	<div class="container mt-5">
		<div class="d-flex justify-content-between mb-2">
			<h2>Lista Ventas</h2>
			<button type="button" class="btn btn-success">Agregar Venta</button>
		</div>
		<table class="table table-bordered">
			  <thead>
				<tr>
				  <th scope="col">ID</th>
				  <th scope="col">Inmueble</th>
				  <th scope="col">Cliente</th>
				  <th scope="col">Agente</th>
				  <th scope="col">Precio Final</th>
				  <th scope="col">Fecha Venta</th>
				  <th scope="col" >Acciones</th>
				</tr>
			  </thead>
			  <tbody>
				<% List<Venta> listVenta = (List<Venta>) request.getAttribute("ventas"); %>
				<% if (listVenta != null) { %>
				    <% for (Venta venta : listVenta) { %>
				        <tr>
				            <th scope="row"><%= venta.getIdVenta() %></th>
				            <td><%= venta.getInmueble() %></td>
				            <td><%= venta.getCliente() %></td>
				            <td><%= venta.getAgente() %></td>
				            <td><%= venta.getPrecioFinal() %></td>
				            <td><%= venta.getFechaVenta() %></td>
				        	<td class="d-flex gap-2">
				        		<button type="button" class="btn btn-warning" >Editar</button>
				        		<button type="button" class="btn btn-danger" >Eliminar</button>
				        	</td>
				        </tr>
				    <% } %>
				<% } %>
			  </tbody>
		</table>
</body>
</html>