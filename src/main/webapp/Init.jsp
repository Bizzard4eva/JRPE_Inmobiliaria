<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="InmuebleServlet" method="post">
		<input type="hidden" name="action" value="loadHome">
		<input type="hidden" name="redirectTo" value="Home">	
		<button type="submit" class="btn btn-primary btn-block mb-4">Go Home</button>
	</form>

</body>
</html>