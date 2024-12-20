<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>URL Invalido</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container text-center py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h1 class="display-1 fw-bold text-danger">Page Not Found[404]</h1>
                <p class="lead text-secondary">Lo sentimos, no pudimos encontrar la página que buscabas.</p>
                <p class="text-secondary">Es posible que la URL sea incorrecta o que la página haya sido eliminada.</p>
                <form action="Home.jsp" method="get">
	                <input type="hidden" name="action" value="loadHome">
					<input type="hidden" name="redirectTo" value="Home">	
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-house-fill"></i> Volver al Home
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>