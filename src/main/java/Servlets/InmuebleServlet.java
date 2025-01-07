package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOFactory;
import Entidades.*;
import Modelos.*;


@WebServlet("/InmuebleServlet")
public class InmuebleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		switch (Util.validateParameter(request.getParameter("action"), String.class, "NotFound")) {
		// ESPECIFICOS
		case "loadHome": loadHome(request, response); break;
		case "loadCatalog": loadCatalog(request, response); break;
		case "loadProperty": loadProperty(request, response); break;
		case "listFiltered": listFilteredInmuebles(request, response); break;
		case "NotFound": Util.RedirectTo(request, response, "NotFound"); break;
		// GENERALES
		case "list": listInmuebles(request, response); break;
		case "get": getInmueble(request, response); break;
		case "add": addInmueble(request, response); break;
		case "update": updateInmueble(request, response); break;
		default: Util.RedirectTo(request, response, "NotFound"); break;
		}
	}

	// ESPECIFICOS
	private void loadHome(HttpServletRequest request, HttpServletResponse response) {
		try 
		{
			List<CardInmueble> listCardInmueble = dao.getInmueble().listCardInmueble();
			List<Distrito> listDistrito = dao.getDistrito().listDistrito();
			List<TipoInmueble> listTipoInmueble = dao.getTipoInmueble().listTiposInmueble();

			request.setAttribute("listDistrito", listDistrito);
			request.setAttribute("listTipoInmueble", listTipoInmueble);
			request.setAttribute("listCardInmueble", listCardInmueble);
			Util.RedirectTo(request, response, "Home");
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void loadCatalog(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			List<Distrito> listDistrito = dao.getDistrito().listDistrito();
			List<TipoInmueble> listTipoInmueble =dao.getTipoInmueble().listTiposInmueble();
			
			Integer minPrice = Util.validateParameter(request.getParameter("minPrice"), Integer.class, 60000);
			Integer maxPrice = Util.validateParameter(request.getParameter("maxPrice"), Integer.class, 500000);
			Integer distritoSelected = Util.validateParameter(request.getParameter("distritoSelected"), Integer.class, 1);
			Integer tipoInmuebleSelected = Util.validateParameter(request.getParameter("tipoInmuebleSelected"), Integer.class, 1);
			Integer areaTotal = Util.validateParameter(request.getParameter("areaTotal"), Integer.class, 600);
			
			List<CardInmueble> listCardsFiltered = dao.getInmueble().listFilteredInmueble(minPrice, maxPrice, distritoSelected, tipoInmuebleSelected);
			Integer resultCount = listCardsFiltered.size();
			
			request.setAttribute("listCardsFiltered", listCardsFiltered);
			request.setAttribute("listDistrito", listDistrito);
			request.setAttribute("listTipoInmueble", listTipoInmueble);
			request.setAttribute("distritoSelected", distritoSelected);
			request.setAttribute("tipoInmuebleSelected", tipoInmuebleSelected);
			request.setAttribute("resultCount", resultCount);
			request.setAttribute("minPrice", minPrice);
			request.setAttribute("maxPrice", maxPrice);
			request.setAttribute("areaTotal", areaTotal);
			Util.RedirectTo(request, response, "Catalog");
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void loadProperty(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			Integer idInmueble = Util.validateParameter(request.getParameter("idInmueble"), Integer.class, 1);
			Inmueble inmueble = dao.getInmueble().getInmueble(idInmueble);
			List<String> imagenesInmueble = dao.getInmueble().listImagenesInmueble(idInmueble);
			
			request.setAttribute("inmuebleDetail", inmueble);
			request.setAttribute("imagenesInmueble", imagenesInmueble);
			Util.RedirectTo(request, response);
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void listFilteredInmuebles(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			Integer minPrice = Util.validateParameter(request.getParameter("minPrice"), Integer.class, 60000);
			Integer maxPrice = Util.validateParameter(request.getParameter("maxPrice"), Integer.class, 500000);
			Integer idDistrito = Util.validateParameter(request.getParameter("idDistrito"), Integer.class, 1);
			Integer idTipoInmueble = Util.validateParameter(request.getParameter("idTipoInmueble"), Integer.class, 1);
			List<CardInmueble> inmueblesFiltrados = dao.getInmueble().listFilteredInmueble(
													minPrice, maxPrice, idDistrito, idTipoInmueble);
			request.setAttribute("inmueblesFiltrados", inmueblesFiltrados);
			Util.RedirectTo(request, response);
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	// GENERALES
	private void listInmuebles(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			List<Inmueble> listInmueble = dao.getInmueble().listInmueble();

			request.setAttribute("listInmueble", listInmueble);
			Util.RedirectTo(request, response, "Admin");
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void getInmueble(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			Integer idInmueble = Util.validateParameter(request.getParameter("idInmueble"), Integer.class, 1);
			Inmueble inmueble = dao.getInmueble().getInmueble(idInmueble);

			request.setAttribute("inmuebleDetail", inmueble);
			Util.RedirectTo(request, response);
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void addInmueble(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try
		{
			Inmueble inmueble = new Inmueble(0, request.getParameter("titulo"), request.getParameter("descripcion"),
					Double.parseDouble(request.getParameter("precio")), request.getParameter("tipo"),
					request.getParameter("direccion"), Integer.parseInt(request.getParameter("habitaciones")),
					Integer.parseInt(request.getParameter("banos")), Double.parseDouble(request.getParameter("areaTotal")),
					Double.parseDouble(request.getParameter("areaConstruida")), null,
					new UsuarioModel().getUsuario(Integer.parseInt(request.getParameter("idUsuario"))),
					new DistritoModel().getDistrito(Integer.parseInt(request.getParameter("idDistrito"))));

			if (dao.getInmueble().addInmueble(inmueble)) {
				Util.RedirectTo(request, response);
			}
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

	private void updateInmueble(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try
		{
			Inmueble inmueble = new Inmueble(Integer.parseInt(request.getParameter("idInmueble")),
					request.getParameter("titulo"), request.getParameter("descripcion"),
					Double.parseDouble(request.getParameter("precio")), request.getParameter("tipo"),
					request.getParameter("direccion"), Integer.parseInt(request.getParameter("habitaciones")),
					Integer.parseInt(request.getParameter("banos")), Double.parseDouble(request.getParameter("areaTotal")),
					Double.parseDouble(request.getParameter("areaConstruida")), request.getParameter("estado"),
					new UsuarioModel().getUsuario(Integer.parseInt(request.getParameter("idUsuario"))),
					new DistritoModel().getDistrito(Integer.parseInt(request.getParameter("idDistrito"))));

			if (dao.getInmueble().updateInmueble(inmueble)) {
				Util.RedirectTo(request, response);
			}
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}

}
