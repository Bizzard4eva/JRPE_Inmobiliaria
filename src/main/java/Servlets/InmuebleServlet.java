package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.CardInmueble;
import Entidades.Inmueble;
import Modelos.InmuebleModel;

@WebServlet("/InmuebleServlet")
public class InmuebleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (request.getParameter("action")) {
		case "list": listInmuebles(request, response); break;
		case "listCards": listCardsInmuebles(request, response); break;
		case "listFiltered": listFilteredInmuebles(request, response); break;
		case "get": getInmueble(request, response); break;
//		case "add": addInmueble(request, response); break;
//		case "update": updateInmueble(request, response); break;
		default: request.getRequestDispatcher("Home.jsp").forward(request, response); //TODO
		}
	}

	private void listInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<Inmueble> inmuebles = new InmuebleModel().listInmueble();
		
		request.setAttribute("inmuebles", inmuebles);
		RedirectTo(request, response);
	}
	private void listFilteredInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<Inmueble> inmueblesFiltrados = new InmuebleModel().listFilteredInmueble(
				Double.parseDouble(request.getParameter("minPrice")), 
				Double.parseDouble(request.getParameter("maxPrice")), 
				Integer.parseInt(request.getParameter("idDistrito")), 
				request.getParameter("tipoInmueble"));
		
		request.setAttribute("inmueblesFiltrados", inmueblesFiltrados);
		RedirectTo(request, response);
	}
	private void listCardsInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<CardInmueble> inmbuebleCards = new InmuebleModel().listCardInmueble();
		
		request.setAttribute("inmuebleCards", inmbuebleCards);
		RedirectTo(request, response);
	}
	private void getInmueble(HttpServletRequest request, HttpServletResponse response) {
		Inmueble inmueble = new InmuebleModel().getInmueble(
				Integer.parseInt(request.getParameter("idInmueble")));
		
		request.setAttribute("inmuebleDetail", inmueble);
		RedirectTo(request, response);
	}
	
	
	private String validateRedirectTo(String web) {
		List<String> paginasValidas = List.of("Home","Login","Catalog","Property"); //TODO
		if(web != null && paginasValidas.contains(web)) 
		{
			return (web + ".jsp");
		}
		return "Home.jsp";
	}
	private void RedirectTo(HttpServletRequest request, HttpServletResponse response) {
		String redirectTo = request.getParameter("redirectTo");
		String validated = validateRedirectTo(redirectTo);
		try {
			request.getRequestDispatcher(validated).forward(request, response);
		} catch (ServletException e) {
			System.err.println("Error al intentar redirigir la solicitud: " + e.getMessage());
		} catch (IOException e) {
			 System.err.println("Error al intentar despachar el cliente: " + e.getMessage());
		}
	}

}
