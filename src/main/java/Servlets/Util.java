package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {
	
	public static <T> T validateParameter(String parameter, Class<T> type, T defaultValue) {
		try
		{
			if(parameter == null || parameter.trim().isEmpty()) {
				return defaultValue;
			}
			if(type == Integer.class) {
				return type.cast(Integer.parseInt(parameter));
			}
			if(type == Double.class) {
				return type.cast(Double.parseDouble(parameter));
			}
			if(type == String.class) {
				return type.cast(parameter);
			}
		} catch (NumberFormatException e) {
			return defaultValue;
		}
		return defaultValue;
	}
	
	public static void RedirectTo(HttpServletRequest request, HttpServletResponse response) {
		String redirectTo = request.getParameter("redirectTo");
		RedirectTo(request, response, redirectTo);
	}
	
	public static void RedirectTo(HttpServletRequest request, HttpServletResponse response, String web) {
		String validated = validateRedirectTo(web);
		try {
			request.getRequestDispatcher(validated).forward(request, response);
		} catch (ServletException e) {
			System.err.println("Error al intentar redirigir la solicitud: " + e.getMessage());
		} catch (IOException e) {
			 System.err.println("Error al intentar despachar el cliente: " + e.getMessage());
		}
	}
	
	private static String validateRedirectTo(String web) {
		List<String> paginasValidas = List.of("Home","Login","Catalog","Property", "Admin", "AdminUsuarios", "AdminVentas", "NotFound");
		if(paginasValidas.contains(web)) 
		{
			return (web + ".jsp");
		}
		return "NotFound.jsp";
	}
	
}
