<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Init</title>
<script>
	window.onload = function() { document.getElementById("autoSubmitForm").submit(); }
</script>
</head>
<body>
	<form action="InmuebleServlet" method="post" id="autoSubmitForm">
		<input type="hidden" name="action" value="loadHome">
		<input type="hidden" name="redirectTo" value="Home">	
	</form>
</body>
</html>