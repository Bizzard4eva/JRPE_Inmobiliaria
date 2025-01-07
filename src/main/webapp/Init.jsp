<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
<x:url value="InmuebleServlet" var="HomePage"/> 
<x:url value="loadHome" var="load"/> 
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
	<form action="${ HomePage }" method="get" id="autoSubmitForm">
		<input type="hidden" name="action" value="${ load }">	
	</form>
</body>
</html>