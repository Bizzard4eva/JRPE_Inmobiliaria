<%@page import="java.util.List"%>
<%@page import="Entidades.Inmueble"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Propiedades</title>
<link rel="stylesheet" href="css/Property.css">
<link rel="stylesheet" href="css/Home.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<style>
  .thumbnail {
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .thumbnail:hover {
    transform: scale(1.1); /* Incrementa el tamaño al hacer hover */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Agrega sombra para un efecto visual atractivo */
  }
  
  .container-thumbnail {
  	width: 107px;
  }
  
</style>
<body>
	<%
		Inmueble inmueble = (Inmueble) request.getAttribute("inmuebleDetail");
	%>

	<%@ include file="Header.jsp" %>
    <div class="d-flex justify-content-center align-items-center bg-light">
      <section class="w-100 bg-white p-4 rounded shadow">
        <div class="container">
        <%
        	List<String> imagenes = (List<String>) request.getAttribute("imagenesInmueble");
        	if(imagenes != null)   {
        %>
          <div class="row d-flex justify-content-center">
            <!-- Imagen grande -->
            <div class="col-lg-8 col-md-7 col-sm-12">
              <div class="ratio ratio-16x9">
                <img id="mainImage" src="<%=imagenes.get(0)%>" class="img-fluid rounded" alt="Imagen grande"/>
              </div>
            </div>

            <!-- Imagenes pequeñas alineadas verticalmente -->
    	<div class="col-lg-1 col-md-2 col-sm-12">
		  <div class="d-flex flex-column justify-content-between h-100 container-thumbnail">
		    <img src="<%=imagenes.get(1)%>" class="img-fluid rounded flex-grow-1 mb-2 thumbnail" alt="Thumbnail 1" 
		         onclick="changeImage(this)"/>
		    <img src="<%=imagenes.get(2)%>" class="img-fluid rounded flex-grow-1 mb-2 thumbnail" alt="Thumbnail 2"
		         onclick="changeImage(this)"/>
		    <img src="<%=imagenes.get(3)%>" class="img-fluid rounded flex-grow-1 mb-2 thumbnail" alt="Thumbnail 3"
		         onclick="changeImage(this)"/>
		    <img src="<%=imagenes.get(4)%>" class="img-fluid rounded flex-grow-1 mb-2 thumbnail" alt="Thumbnail 4"
		         onclick="changeImage(this)"/>
		  </div>
		</div>
		<%
        	}
		%>	
          </div>
        </div>
        <div class="card-body d-flex justify-content-evenly">
          <div class="card-title mb-0 d-flex flex-column">
            <div>
              <h1 class="mt-5" style="color: #d3d3d3"><span><%=inmueble.getTitulo() %></span> - <span>Venta</span></h1>
            </div>
            <div>
              <p class="mk-mod-flex">
                <img src="./images/location-outline-1.png" />
                &nbsp;
                <span style="color: #0b0b0b">
                  Direccion:
                  <a href="#map" class="text-decoration-none" title="Ver ubicacion">
                  	<%=inmueble.getDireccion()%>
                  </a>
                </span>
              </p>
            </div>
          </div>
          <div class="d-flex justify-content-center flex-column mt-5">
            <h2 class="card-title mb-0 d-flex flex-column align-items-start">
             S/<%=inmueble.getPrecio()%>
            </h2>
            <div>
              <p class="mk-entry-id">
                <span>ID:</span><span class="decrip-span"><%=inmueble.getIdInmueble() %></span>
              </p>
            </div>
          </div>
        </div>
      </section>
    </div>
    <div class="p-5" style="box-shadow: 0px 0px 5.30948px rgb(0 0 0 / 15%)">
      <div class="mk-seccion text-center">
        <div class="mk-blocks-titulo">
          <h2 class="text-primary py-2">Descripcion</h2>
          <div
            class="container mt-5 px-4 text-dark text-start"
            style="
              font-family: 'Inter', sans-serif;
              font-weight: 500;
              font-size: 15px;
              line-height: 1.342;
            "
          >
            <p></p>
            <p>
              <%=inmueble.getDescripcion() %>
            </p>
            <p>
              Si estas buscando un hogar que combine lujo, comodidad y una
              ubicacion privilegiada, este espectacular departamento en San
              Isidro es la eleccion perfecta. Con vista al parque Guatemala y en
              una zona segura, este hogar te brindar tranquilidad y estilo de
              vida.
            </p>
            <p>
              La sala comedor cuenta con mamparas de vidrio que permiten la
              entrada abundante de luz natural y conectan con la vista al
              parque. La cocina, con comedor diario y muebles altos y bajos, es
              el lugar ideal para disfrutar de deliciosas comidas en familia.
              Este departamento cuenta con un espacio adicional, el family room,
              que es perfecto para relajarse y pasar tiempo de calidad con tus
              seres queridos.
            </p>
            <p>
              El dormitorio principal es una verdadera joya con su closet y baño
              completo. Ademas, hay tres dormitorios secundarios, todos con
              amplios closets para guardar tus pertenencias. La propiedad
              incluye una lavanderia, cuarto y baño de servicio, lo que añade
              comodidad a tu dia a dia.
            </p>
            <p>
              Este departamento cuenta con un deposito, ideal para almacenar
              objetos de temporada, y dos estacionamientos para tu comodidad.
            </p>
            <p>
              La ubicacion es clave, y este departamento lo tiene todo. Esta a
              solo media cuadra de la Av. Javier Prado Oeste y a cuatro cuadras
              del Lima Golf Club. Ademas, se encuentra cerca de embajadas como
              la de Egipto, Argentina e Indonesia, lo que agrega un elemento
              adicional de seguridad y prestigio a la zona.
            </p>
            <p>
              No pierdas la oportunidad de vivir en este lujoso departamento.
              Contactanos hoy mismo para obtener mas informacion y programar
              una visita!
            </p>
            <p></p>
          </div>
        </div>
        <div class="container p-4">
          <div class="mk-block">
            <ul class="list-unstyled text-start">
              <li class="d-flex align-items-center gap-2">
                <img src="./images/business-outline.png" style="width: 18px" />
                <span><strong>Tipo: </strong> <%=inmueble.getTipo() %></span>
              </li>
              <li class="d-flex align-items-center gap-2">
                <img src="./images/location-outline-4.png" style="width: 18px" />
                <span><strong>Estado: </strong><%=inmueble.getEstado() %></span>
              </li>
            </ul>
          </div>
          <div class="mk-block"></div>
        </div>
      </div>
    </div>
    <div class="p-5" style="box-shadow: 0px 0px 5.30948px rgb(0 0 0 / 15%)">
      <div class="mk-seccion">
        <div class="d-flex justify-content-center mb-5">
          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/dormitorio-icon.png" style="width: 46px" />
              <span>Dormitorios</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span><%=inmueble.getHabitaciones()%></span>
            </div>
          </div>
          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/banos-icon.png" style="width: 46px" />
              <span>Baños</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span><%=inmueble.getBanos() %></span>
            </div>
          </div>
          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/Group-121-2.png" style="width: 38px" />
              <span>Cocina</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span>1</span>
            </div>
          </div>

          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/Group-122-1.png" style="width: 46px" />
              <span>Deposito</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span>1</span>
            </div>
          </div>

          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/lavanderia-icon.png" style="width: 46px" />
              <span>Lavanderia</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span>1</span>
            </div>
          </div>

          <div
            class="bg-white shadow-sm rounded-2 mx-3"
            style="width: 120.17px; height: 158px"
          >
            <div
              class="d-flex flex-column flex-wrap justify-content-evenly align-items-center align-content-around"
              style="font-size: 12px; height: 115px"
            >
              <img src="./images/car-sport-outline-1.png" style="width: 46px" />
              <span>Cochera</span>
            </div>
            <div
              class="border-top text-center py-2 fw-semibold fs-6 text-secondary"
            >
              <span>2</span>
            </div>
          </div>
        </div>

        <!-- INFO INMUEBLES-->

        <!--SECCION RESUMEN-->
        <div
          class="bg-primary text-white rounded-2 d-grid justify-content-center align-content-between p-4 container mb-5"
          style="width: 204px; height: 67px"
        >
          <span>Resumen</span>
        </div>
        <div
          class="container-fluid max-w-100 mx-auto shadow-sm rounded-3 mt-n1 bg-white d-flex justify-content-center"
        >
          <div class="w-100 py-2 px-3">
            <table>
              <tbody>
                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />ID
                    Inmueble
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getIdInmueble() %>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Precio
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getPrecio()%>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Tipo
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getTipo() %>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Modalidad
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      Venta
                    </h2>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div id="top-space-table-mobile" class="w-100 py-2 px-3">
            <table>
              <tbody>
                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Valor de
                    M2
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getPrecio()%>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Antiguedad
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      9
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Estado del
                    Inmueble
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getEstado() %>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Ubicado
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getDireccion() %>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Area Total
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getAreaTotal() %><span>m</span><sup>2</sup>
                    </h2>
                  </td>
                </tr>

                <tr>
                  <td
                    id="bkg-gris"
                    class="fw-semibold fs-6 lh-1.5 text-muted my-1 d-flex align-items-center fw-semibold fs-5 text-secondary my-2"
                  >
                    <img src="./images/checkmark-circle-outline.png" />Area
                    Construida
                  </td>
                  <td id="space-td-mobile">
                    <h2 class="fw-semibold fs-6 lh-1.5 text-end text-muted m-0">
                      <%=inmueble.getAreaConstruida() %><span>m</span><sup>2</sup>
                    </h2>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <br />
    <article class="letter">
      <section class="container d-flex justify-content-center align-items-center vh-100">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.2025205912364!2d-77.03113322370436!3d-12.098283812262562!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c865ea057e4f%3A0x4b6811f4738d98a0!2sTienda%20Paseo%20de%20la%20Republica-Entel!5e0!3m2!1ses-419!2spe!4v1732763828508!5m2!1ses-419!2spe"
          width="600"
          height="450"
          style="border: 0"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </section>
	</article>
    <!-- Pie de pagina -->
    <footer class="containerfooter mt-5">
        <div class="row">
            <div class="col-md-4 text-center">
                <img class="logofooter mb-3" src="./images/logo.svg" alt="logo">
                <h2>JRPE Inmobiliaria</h2>
                <p>Somos una empresa dedicada a ofrecer las mejores propiedades y departamentos, brindando confianza, calidad y atencion personalizada.</p>
            </div>
            <div class="info col-md-4 text-center">
                <h3>Contacto</h3>
                <p><img src="./images/phone.png" class="footer-icon" alt="Telefono">+51 987 654 321</p>
                <p><img src="./images/email.png" class="footer-icon" alt="Email">contacto@propiedades.com</p>
                <p><img src="./images/address.png" class="footer-icon" alt="Direccion">Lima, Peru</p>
            </div>
            <div class="info col-md-4 text-center">
                <h3>Siguenos</h3>
                <a href="#" class="social-link d-block">Facebook</a>
                <a href="#" class="social-link d-block">Instagram</a>
                <a href="#" class="social-link d-block">Twitter</a>
            </div>
        </div>
        <div class="row mt-4">
            <div class="copy col text-center">
                <p>&copy; 2024 Propiedades. Todos los derechos reservados.</p>
            </div>
        </div>
    </footer>
</body>
<script>
    // Cambiar la imagen grande al hacer clic en una miniatura
    function changeImage(thumbnail) {
      const mainImage = document.getElementById("mainImage");
      mainImage.src = thumbnail.src;
    }
</script>
</html>