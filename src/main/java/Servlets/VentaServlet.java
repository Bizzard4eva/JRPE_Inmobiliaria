package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Usuario;
import Entidades.Venta;
import Modelos.UsuarioModel;
import Modelos.VentaModel;

/**
 * Servlet implementation class VentaServlet
 */
@WebServlet("/VentaServlet")
public class VentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("action");
		
		switch(type) {
		case "list": listCardInmueble(request, response); break;
		default:
			request.getRequestDispatcher("Home.jsp").forward(request, response);
		}
	}
	
	private void listCardInmueble(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Venta> ventas = new VentaModel().listVentas();
		
		request.setAttribute("ventas", ventas);
		Util.RedirectTo(request, response, "AdminVentas");
	}
}
