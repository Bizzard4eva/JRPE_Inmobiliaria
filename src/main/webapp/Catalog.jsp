<%@page import="Entidades.Distrito"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Catalogo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<section class="container">
	<div class="row">
		<div class="col-md-3">
			<div class="filters shadow p-3 mb-5 bg-body rounded">
				
				
				<form action="" method="">
				    <!-- Combo Box para Distritos -->
				    <div class="mb-3">
				        <label for="distrito" class="form-label">Distrito</label>
				        <select name="distrito" id="distrito" class="form-select">
				            <option value="" selected>Todos</option>
				            <% 
				                // Obtenemos la lista de distritos desde el request
				                List<Distrito> distritos = (List<Distrito>) request.getAttribute("data");
				                if (distritos != null) {
				                    for (Distrito distrito : distritos) {
				            %>
				            <option value="<%= distrito.getId() %>">
				                <%= distrito.getNombre() %>
				            </option>
				            <%      
				                    }
				                }
				            %>
				        </select>
				    </div>
				</form>
				
				
			</div>
		</div>
	</div>
</section>

</body>
</html>