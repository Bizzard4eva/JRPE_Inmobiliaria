package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.CardInmueble;
import Entidades.Distrito;
import Modelos.DistritoModel;
import Modelos.InmuebleModel;

@WebServlet("/CardInmuebleServlet")
public class CardInmuebleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		switch(type) {
		case "list": listCardInmueble(request, response); break;
		case "detail": detalleCard(request, response); break;
		case "search": searchInmueble(request, response); break;
		default:
			request.getRequestDispatcher("Home.jsp").forward(request, response);
		}
	}

	private void searchInmueble(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		List<Distrito> listDistrito = new DistritoModel().listDistrito();
		List<String> tipoInmueble = new InmuebleModel().listTipoInmueble();
		String precioMin = request.getParameter("min");
		String precioMax = request.getParameter("max");
		
		request.setAttribute("precioMin", precioMin);
		request.setAttribute("precioMax", precioMax);
	    request.setAttribute("listDistrito", listDistrito);
	    request.setAttribute("tipoInmueble", tipoInmueble);
	    
	    request.getRequestDispatcher("Catalog.jsp").forward(request, response);
	}

	private void detalleCard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Integer idInmueble = Integer.parseInt(request.getParameter("id"));
		 
		 request.setAttribute("idInmueble", idInmueble);
         request.getRequestDispatcher("Property.jsp").forward(request, response);
	}

	private void listCardInmueble(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CardInmueble> listCardInmueble = new InmuebleModel().listCardInmueble();
		List<Distrito> listDistrito = new DistritoModel().listDistrito();
		List<String> tipoInmueble = new InmuebleModel().listTipoInmueble();
		
	    request.setAttribute("listDistrito", listDistrito);
	    request.setAttribute("tipoInmueble", tipoInmueble);
		request.setAttribute("listCardInmueble", listCardInmueble);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
	}

}
