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
import Entidades.Inmueble;
import Modelos.DistritoModel;
import Modelos.InmuebleModel;
import Modelos.UsuarioModel;


@WebServlet("/InmuebleServlet")
public class InmuebleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (request.getParameter("action")) {
		//ESPECIFICOS
		case "loadHome": loadHome(request, response); break;
		case "loadCatalog": loadCatalog(request, response); break;
		//GENERALES
		case "list": listInmuebles(request, response); break;
		case "listCards": listCardsInmuebles(request, response); break;
		case "listFiltered": listFilteredInmuebles(request, response); break;
		case "listTipo" : listTiposInmueble(request, response); break;
		case "listEstado" : listEstadosInmueble(request, response); break;
		case "get": getInmueble(request, response); break;
		case "add": addInmueble(request, response); break;
		case "update": updateInmueble(request, response); break;
		default: request.getRequestDispatcher("Home.jsp").forward(request, response); //TODO
		}
	}
	//ESPECIFICOS
	private void loadHome(HttpServletRequest request, HttpServletResponse response) {
		// Reemplaza --> CardInmuebleServlet.listCardInmueble()
		List<CardInmueble> listCardInmueble = new InmuebleModel().listCardInmueble();
		List<Distrito> listDistrito = new DistritoModel().listDistrito();
		List<String> tipoInmueble = new InmuebleModel().listTipoInmueble();
		
	    request.setAttribute("listDistrito", listDistrito);
	    request.setAttribute("tipoInmueble", tipoInmueble);
		request.setAttribute("listCardInmueble", listCardInmueble);
		Util.RedirectTo(request, response);
	}
	private void loadCatalog(HttpServletRequest request, HttpServletResponse response) {

		List<Distrito> listDistrito = new DistritoModel().listDistrito();
		List<String> tipoInmueble = new InmuebleModel().listTipoInmueble();
		
		request.setAttribute("precioMin", request.getParameter("minPrice"));
		request.setAttribute("precioMax", request.getParameter("maxPrice"));
		Util.RedirectTo(request, response, "Catalog");
	}
	

	//GENERALES
	private void listInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<Inmueble> inmuebles = new InmuebleModel().listInmueble();
		
		request.setAttribute("inmuebles", inmuebles);
		Util.RedirectTo(request, response);
	}
	private void listFilteredInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<Inmueble> inmueblesFiltrados = new InmuebleModel().listFilteredInmueble(
				Double.parseDouble(request.getParameter("minPrice")), 
				Double.parseDouble(request.getParameter("maxPrice")), 
				Integer.parseInt(request.getParameter("idDistrito")), 
				request.getParameter("tipoInmueble"));
		
		request.setAttribute("inmueblesFiltrados", inmueblesFiltrados);
		Util.RedirectTo(request, response);
	}
	private void listCardsInmuebles(HttpServletRequest request, HttpServletResponse response) {
		List<CardInmueble> inmbuebleCards = new InmuebleModel().listCardInmueble();
		
		request.setAttribute("inmuebleCards", inmbuebleCards);
		Util.RedirectTo(request, response);
	}
	private void listTiposInmueble(HttpServletRequest request, HttpServletResponse response) {
		List<String> tipos = new InmuebleModel().listTipoInmueble();
		
		request.setAttribute("tiposInmueble", tipos);
		Util.RedirectTo(request, response);
	}
	private void listEstadosInmueble(HttpServletRequest request, HttpServletResponse response) {
		List<String> estados = new InmuebleModel().listEstadoInmueble();
		
		request.setAttribute("estadosInmueble", estados);
		Util.RedirectTo(request, response);
	}

	private void getInmueble(HttpServletRequest request, HttpServletResponse response) {
		Inmueble inmueble = new InmuebleModel().getInmueble(
				Integer.parseInt(request.getParameter("idInmueble")));
		
		request.setAttribute("inmuebleDetail", inmueble);
		Util.RedirectTo(request, response);
	}
	private void addInmueble(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Inmueble inmueble = new Inmueble( 0, 
				request.getParameter("titulo"), 
				request.getParameter("descripcion"), 
				Double.parseDouble(request.getParameter("precio")), 
				request.getParameter("tipo"), 
				request.getParameter("direccion"), 
				Integer.parseInt(request.getParameter("habitaciones")), 
				Integer.parseInt(request.getParameter("banos")), 
				Double.parseDouble(request.getParameter("areaTotal")), 
				Double.parseDouble(request.getParameter("areaConstruida")), 
				null,
				new UsuarioModel().getUsuario(Integer.parseInt(request.getParameter("idUsuario"))), 
				new DistritoModel().getDistrito(Integer.parseInt(request.getParameter("idDistrito")))
				);

		if(new InmuebleModel().addInmueble(inmueble)) { Util.RedirectTo(request, response); }
	}
	private void updateInmueble(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Inmueble inmueble = new Inmueble(
				Integer.parseInt(request.getParameter("idInmueble")), 
				request.getParameter("titulo"), 
				request.getParameter("descripcion"), 
				Double.parseDouble(request.getParameter("precio")), 
				request.getParameter("tipo"), 
				request.getParameter("direccion"), 
				Integer.parseInt(request.getParameter("habitaciones")), 
				Integer.parseInt(request.getParameter("banos")), 
				Double.parseDouble(request.getParameter("areaTotal")), 
				Double.parseDouble(request.getParameter("areaConstruida")), 
				request.getParameter("estado"), 
				new UsuarioModel().getUsuario(Integer.parseInt(request.getParameter("idUsuario"))), 
				new DistritoModel().getDistrito(Integer.parseInt(request.getParameter("idDistrito")))
				);
		
		if(new InmuebleModel().updateInmueble(inmueble)) { Util.RedirectTo(request, response); }
	}

}
