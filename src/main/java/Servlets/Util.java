package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {
	
	public static void RedirectTo(HttpServletRequest request, HttpServletResponse response, String web) {
		String redirectTo = request.getParameter("redirectTo");
		if(redirectTo == null || redirectTo.isEmpty()) redirectTo = web;
		String validated = validateRedirectTo(redirectTo);
		try {
			request.getRequestDispatcher(validated).forward(request, response);
		} catch (ServletException e) {
			System.err.println("Error al intentar redirigir la solicitud: " + e.getMessage());
		} catch (IOException e) {
			 System.err.println("Error al intentar despachar el cliente: " + e.getMessage());
		}
	}
	
	public static void RedirectTo(HttpServletRequest request, HttpServletResponse response) {
		RedirectTo(request, response, "Home");
	}
	
	private static String validateRedirectTo(String web) {
		List<String> paginasValidas = List.of("Home","Login","Catalog","Property"); //TODO
		if(paginasValidas.contains(web)) 
		{
			return (web + ".jsp");
		}
		return "Home.jsp";
	}
	
}
