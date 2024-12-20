package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOFactory;
import Entidades.Venta;
import Modelos.VentaModel;

@WebServlet("/VentaServlet")
public class VentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch(Util.validateParameter(request.getParameter("action"), String.class, "NotFound")) {
		case "list": listCardInmueble(request, response); break;
		case "NotFound": Util.RedirectTo(request, response, "NotFound"); break;
		default: Util.RedirectTo(request, response, "NotFound"); break;
		}
	}
	
	private void listCardInmueble(HttpServletRequest request, HttpServletResponse response) {
		List<Venta> ventas = dao.getVenta().listVentas();
		
		request.setAttribute("ventas", ventas);
		Util.RedirectTo(request, response, "AdminVentas");
	}
}
