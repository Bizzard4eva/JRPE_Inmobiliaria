<%@page import="Entidades.Distrito"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/Catalog.css">
</head>
<body>

    <!--* BANNER -->
    <header class="container-fluid">
        <div class="row text-center" id="banner">
            <h1>~Encuentra tu hogar ideal~</h1>
        </div>
    </header>
    <!--* CATALOGO -->
    <section class="container mt-5">
        <div class="row">
            <!-- FILTROS -->
            <div class="col-12 col-lg-4 col-xxl-3">
                <div class="filters shadow p-3 mb-5 bg-body rounded">
                    <form action="" method="">
                            <select id="distrito" name="distrito" class="form-select">
                                <option value="" selected>Todos</option>
                                <option value="1">Distrito 1</option>
                                <option value="2">Distrito 2</option>
                            </select>
                        </div>

                        <!-- RadioButtons para Tipo de Inmueble -->
                        <div class="mb-3">
                            <label for="form-label">Tipo de Inmueble</label>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="tipoCasa" name="tipoInmueble" value="Casa" checked>
                                <label class="form-check-label" for="tipoCasa">Casa</label>
                            </div>

                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="tipoDepartamento" name="tipoInmueble" value="Departamento">
                                <label class="form-check-label" for="tipoDepartamento">Departamento</label>
                            </div>
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
                                <input type="range" class="range-min" min="60000" max="500000" value="60000" step="10000">
                                <input type="range" class="range-max" min="60000" max="500000" value="400000" step="10000">
                            </div>

                            <div class="d-flex justify-content-between mt-2 price-input">
                                <div>
                                    <label for="inputMin" class="form-label">Mínimo:</label>
                                    <input type="number" id="inputMin" class="form-control" min="60000" max="500000" value="100000">
                                </div>
                                <div>
                                    <label for="inputMax" class="form-label">Máximo:</label>
                                    <input type="number" id="inputMax" class="form-control" min="60000" max="500000" value="400000">
                                </div>
                            </div>
                        </div>
                        <!-- Rango de Precios -->

                            <!-- Range para Area del terrono 40m2 - 600m2 -->
                        <div class="mb-3">
                            <label for="areaTotal" class="form-label">Area Total: 
                                <span id="valorAreaTotal">600</span> m²
                            </label>
                            <input type="range" class="form-range" id="areaTotal" name="cantidadAreaTotal" min="40" max="600" step="20" value="600" oninput="actualizarValorAreaTotal(this.value)">
                        </div>
                    </form>
                    
                </div>
            </div>
            <!-- FILTROS -->
            <!-- RESULTADOS -->
            <div class="col-12 col-lg-8 col-xxxl-9">
                <!-- HEADER -->
                <div class="row"> <!--//TODO-->
                    <div class="col-12"> 
                        <h2>Resultados (<span id="resultCount">?</span>)</h2>
                    </div>  
                </div>
                <!-- HEADER -->
                <!-- CARTAS DE INMUEBLES -->
                <div class="row">
                    <div class="container-fluid mt-4">
                        <div class="row g-2">
                    <!-- <%%> -->
                            <div class="col-xxl-4 col-sm-6">
                                <div class="card h-100">
                                    <img src="img/catalog_banner.jpg" class="card-img-top" alt="Card" style="height: 200px;">
                                    <div class="card-body d-flex flex-column align-items-start">
                                        <h5 class="card-title" style="color: #333;">
                                            S/PRECIO
                                        </h5>
                                        <p class="card-text" style="color: #333;">
                                            <i class="bi bi-geo-alt-fill text-primary"></i>
                                            DIRECCION
                                        </p>
                                        <p class="card-text" style="color: #333;">
                                            <i class="bi bi-hdd-fill text-primary"></i>
                                            DORMITORIOS
                                            <i class="bi bi-cloud-drizzle-fill text-primary"></i>
                                            BAÑOS
                                        </p>
                                        <p class="card-text" style="color: #333;">
                                            <i class="bi bi-aspect-ratio-fill text-primary"></i>
                                            AREATOTAL
                                            <i class="bi bi-aspect-ratio-fill text-primary"></i>
                                            AREACONST
                                        </p>
                                        <a href="CardInmuebleServlet?type=detail&id=" class="btn btn-primary" style="color: white; margin-top: auto;">
                                            Detalles
                                        </a>
                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- CARTAS DE INMUEBLES -->
                <!-- BOTON CARGAR MAS -->
                <div class="row">
                    <div class="col-12 text-center">
                        <button id="cargarMas" class="btn btn-primary">Cargar Más</button>
                    </div>
                </div>
                <!-- BOTON CARGAR MAS -->
            </div>
        </div>
    </section>

    <script src="js/Catalog.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>