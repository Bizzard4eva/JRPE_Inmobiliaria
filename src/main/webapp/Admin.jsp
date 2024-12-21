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
			<button type="button" class="btn btn-success" onclick="openDialog()">Crea Inmueble</button>
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
		  					<button type="button" class="btn btn-warning" id="buttonEdit" onclick="openUpdate()">Editar</button>
		        			<button type="button" class="btn btn-danger" id="buttonDelete" onclick="openDelete()">Eliminar</button>
			  			</td>	  		
			  		</tr>
			  	</x:forEach>
			  </x:if>

			  </tbody>
		</table>
	</div>
	
	<div class="modal fade" id="modalForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title text-center" id="myModalLabel">Agrega un inmueble</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>			
				</div>
				
				<div class="modal-body">
					<form role="form">
						<input type="hidden" id="inputType" value="register">
						<div class="form-group">
							<label>Titulo</label>
							<input class="form-control" type="text" id="titulo">
						</div>
						<div class="form-group">
							<label>Descripción</label>
							<input class="form-control" type="text" id="descripcion">
						</div>
						<div class="form-group">
							<label>Precio</label>
							<input class="form-control" type="text" id="precio">
						</div>
						<div class="form-group">
							<label>Dirección</label>
							<input class="form-control" type="text" id="direccion">
						</div>
						<div class="d-flex justify-content-between gap-3">
							<div class="form-group w-100">
								<label>Habitaciones</label>
								<input class="form-control" type="number" id="direccion">
							</div>
							<div class="form-group w-100">
								<label>Baños</label>
								<input class="form-control" type="text" id="banos">
							</div>
						</div>
						<div class="d-flex justify-content-between gap-3">
							<div class="form-group w-100">
								<label>Area Total</label>
								<input class="form-control" type="text" id="areaTotal">
							</div>
							<div class="form-group w-100">
								<label>Area construida</label>
								<input class="form-control" type="text" id="areaConstruida">
							</div>
						</div>
						<div class="form-group">
							<label>Precio</label>
							<input class="form-control" type="text" id="precio">
						</div>
						<div class="form-group">
							<label>Tipo</label>
							<select class="form-select" aria-label="Default select example" id="tipo">
							</select>
						</div>
						<div class="form-group">
							<label>Agente</label>
							<select class="form-select" aria-label="Default select example" id="agente">
							</select>
						</div>
						<div class="form-group">
							<label>Distrito</label>
							<select class="form-select" aria-label="Default select example" id="distrito">
							</select>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary submitBtn d-grid gap-2 col-6 mx-auto" onClick="registrarInmueble();">Registrar</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="modalFormUpdate" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title text-center" id="myModalLabel">Actualizar un inmueble</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>			
				</div>
				
				<div class="modal-body">
					<form role="form">
						<input type="hidden" id="inputType" value="register">
						<div class="form-group">
							<label>Titulo</label>
							<input class="form-control" type="text" id="titulo">
						</div>
						<div class="form-group">
							<label>Descripción</label>
							<input class="form-control" type="text" id="descripcion">
						</div>
						<div class="form-group">
							<label>Precio</label>
							<input class="form-control" type="text" id="precio">
						</div>
						<div class="form-group">
							<label>Dirección</label>
							<input class="form-control" type="text" id="direccion">
						</div>
						<div class="d-flex justify-content-between gap-3">
							<div class="form-group w-100">
								<label>Habitaciones</label>
								<input class="form-control" type="number" id="direccion">
							</div>
							<div class="form-group w-100">
								<label>Baños</label>
								<input class="form-control" type="text" id="banos">
							</div>
						</div>
						<div class="d-flex justify-content-between gap-3">
							<div class="form-group w-100">
								<label>Area Total</label>
								<input class="form-control" type="text" id="areaTotal">
							</div>
							<div class="form-group w-100">
								<label>Area construida</label>
								<input class="form-control" type="text" id="areaConstruida">
							</div>
						</div>
						<div class="form-group">
							<label>Precio</label>
							<input class="form-control" type="text" id="precio">
						</div>
						<div class="form-group">
							<label>Tipo</label>
							<select class="form-select" aria-label="Default select example" id="tipo">
							</select>
						</div>
						<div class="form-group">
							<label>Agente</label>
							<select class="form-select" aria-label="Default select example" id="agente">
							</select>
						</div>
						<div class="form-group">
							<label>Distrito</label>
							<select class="form-select" aria-label="Default select example" id="distrito">
							</select>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-warning submitBtn d-grid gap-2 col-6 mx-auto" onClick="actualizarInmueble();">Actualizar</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" tabindex="-1" role="dialog" id="modalFormDelete">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
			<h5 class="modal-title d-flex justify-content-center">¿Estas seguro de eliminar ?</h5>
	      <div class="modal-footer d-flex justify-content-center" >
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Eliminar</button>
	      </div>
	    </div>
	  </div>
	</div>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
function openDialog(){
	$('#modalForm').modal('show');
}

function openUpdate(){
	$('#modalFormUpdate').modal('show');
}

function openDelete(){
	$('#modalFormDelete').modal('show');
}

</script>
</body>
</html>