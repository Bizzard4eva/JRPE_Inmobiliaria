<%@ page import="Entidades.CardInmueble"%>
<%@ page import="Entidades.TipoInmueble"%>
<%@ page import="Entidades.Distrito"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/Catalog.css">
</head>
<body>

	<%@ include file="Header.jsp" %>
	
	<x:if test="${ 
	not empty listTipoInmueble and
	not empty listDistrito and
	not empty tipoInmuebleSelected and
	not empty distritoSelected and 
	not empty resultCount and 
	not empty minPrice and 
	not empty maxPrice and
	not empty areaTotal}">
	
    <!--* BANNER -->
    <section class="container-fluid banner">
        <div class="row text-center" >
            <h1>~Encuentra tu hogar ideal~</h1>
        </div>
    </section>
    <!--* CATALOGO -->
    <section class="container mt-5">
       <div class="row">
           <!-- FILTROS -->
           <div class="col-12 col-lg-4 col-xxl-3">
               <div class="filters shadow p-3 mb-5 bg-body rounded">
                   <form action="InmuebleServlet" method="post">
				      <input type="hidden" name="action" value="loadCatalog">
					  <input type="hidden" name="redirectTo" value="Catalog">
                       <!-- Combo Box para Distritos -->
                       <div class="mb-3">
                           <label for="distrito" class="form-label">Distrito</label>
							<select id="distrito" name="distritoSelected" class="form-select">
							    <option value="">Todos</option>
							    
							    <x:forEach var="distrito" items="${ listDistrito }">
							    	<option value="${ distrito.idDistrito }" ${ distrito.idDistrito == distritoSelected ? 'selected' : '' }>
							    		${ distrito.nombre }
							    	</option>
							    </x:forEach>
							    
							</select>
                       </div>

                       <!-- RadioButtons para Tipo de Inmueble -->
                       <div class="mb-3">
                           <label for="form-label">Tipo de Inmueble</label>
                           
                           <x:forEach var="tipo" items="${ listTipoInmueble }">
                           	<div class="form-check">
                           		<input type="radio" class="form-check-input" id="" name="tipoInmuebleSelected" 
                           		value="${ tipo.idTipoInmueble }" 
                           		${ tipo.idTipoInmueble == tipoInmuebleSelected ? 'checked' : '' }>
                           		<label  class="form-check-label" for="tipo${ tipo.tipo }">${ tipo.tipo }</label>
                           	</div>
                           </x:forEach>
                           
                       </div>

                       <!-- Range para la barra de Dormitorios 1-7 -->
                       <div class="mb-3">
                           <label for="dormitorios" class="form-label">Cantidad de Dormitorios: 
                               <span id="valorDormitorios">4</span>
                           </label>
                           <input type="range" class="form-range" id="dormitorios" name="cantidadDormitorios" min="1" max="7" step="1" value="4" oninput="actualizarValorDormitorios(this.value)">
                       </div>

                       <!-- Rango de Precios -->
                       <div class="mb-4">
                           <label class="form-label">Rango de Precios:</label>

                           <div class="slider">
                               <div class="progress"></div>
                           </div>

                           <div class="range-input">
                               <input type="range" class="range-min" min="60000" max="500000" value="${ minPrice }" step="10000">
                               <input type="range" class="range-max" min="60000" max="500000" value="${ maxPrice }" step="10000">
                           </div>

                           <div class="d-flex justify-content-between mt-2 price-input">
                               <div>
                                   <label for="inputMin" class="form-label">Mínimo:</label>
                                   <input type="number" name="minPrice" id="inputMin" class="form-control" min="60000" max="500000" value="${ minPrice }">
                               </div>
                               <div>
                                   <label for="inputMax" class="form-label">Máximo:</label>
                                   <input type="number" name="maxPrice" id="inputMax" class="form-control" min="60000" max="500000" value="${ maxPrice }">
                               </div>
                           </div>
                       </div>

                       <!-- Range para Area del terrono 40m2 - 600m2 -->
                       <div class="mb-3">
                           <label for="areaTotal" class="form-label">Area Total: 
                               <span id="valorAreaTotal">${ areaTotal }</span> m²
                           </label>
                           <input type="range" class="form-range" id="areaTotal" name="areaTotal" min="40" max="600" step="20" value="${ areaTotal }" oninput="actualizarValorAreaTotal(this.value)">
                       </div>
                       
						<button type="submit" class="btn btn-search bg-primary mx-2" style="text-align: center; width: 50%; color:white;">
							BUSCAR
						</button>
                   </form>
               </div>
           </div>
           <!-- FILTROS -->
            
           <!-- RESULTADOS -->
           <div class="col-12 col-lg-8 col-xxxl-9">
               <!-- HEADER -->
               <div class="row">
                   <div class="col-12"> 
                       <h2>Resultados (<span>${ resultCount }</span>)</h2>
                   </div>  
               </div>
               <!-- HEADER -->
               <!-- CARTAS DE INMUEBLES -->
               <div class="row">
                   <div class="container-fluid mt-4">
                       <div class="row g-2">
                       
                       <x:forEach var="card" items="${ listCardsFiltered }">
                       	<div class="col-xxl-4 col-sm-6 mb-5">
                       		<div class="card h-100">
	                       		<img src="${ card.rutaImagenInmueble }" class="card-img-top" alt="Card" style="height: 200px;">
	                       		<div class="card-body d-flex flex-column align-items-start">
	                       			<h5 class="card-title" style="color: #333;">S/${ card.precioInmueble }</h5>
	                       			<p class="card-text" style="color: #333;">
	                       				<i class="bi bi-geo-alt-fill text-primary"></i>${ card.direccionInmueble }                       		
	                       			</p>
	                       			<p class="card-text" style="color: #333;">
	                       				<i class="bi bi-hdd-fill text-primary"></i> ${ card.habitacionesInmueble }
	                       				<i class="bi bi-cloud-drizzle-fill text-primary"></i> ${ card.banosInmueble }    			
	                       			</p>
	                       			<p class="card-text" style="color: #333;">
	                       				<i class="bi bi-aspect-ratio-fill text-primary"></i> ${ card.areaTotalInmueble }
	                       				<i class="bi bi-aspect-ratio-fill text-primary"></i> ${ card.areaConstruidaInmueble }
	                       			</p>
									<a href="InmuebleServlet?action=loadProperty&idInmueble=${ card.idInmueble }&redirectTo=Property"
									class="btn btn-primary" style="color: white; margin-top: auto;">
									Detalles
									</a>
	                       		</div>                     		
                       		</div>
                       	</div>
                       </x:forEach>                                        
                           
                       </div>
                   </div>
               </div>
               <!-- BOTON CARGAR MAS -->
               <div class="row">
                   <div class="col-12 text-center">
                       <button id="cargarMas" class="btn btn-primary">Cargar Más</button>
                   </div>
               </div>

           </div>
       </div>
   	</section>

	</x:if>
	
   <script src="js/Catalog.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>