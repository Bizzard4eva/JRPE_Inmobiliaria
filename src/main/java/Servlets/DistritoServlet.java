package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Distrito;
import Modelos.DistritoModel;

@WebServlet("/DistritoServlet")
public class DistritoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (request.getParameter("action")) {
		case "list": listDistritos(request, response); break;
		case "get": getDistrito(request, response); break;
		default: request.getRequestDispatcher("Home.jsp").forward(request, response); //TODO
		}
	}

	private void listDistritos(HttpServletRequest request, HttpServletResponse response) {
		List<Distrito> distritos = new DistritoModel().listDistrito();
		
		request.setAttribute("distritos", distritos);
		Util.RedirectTo(request, response);
	}
	private void getDistrito(HttpServletRequest request, HttpServletResponse response) {
		Distrito distrito = new DistritoModel().getDistrito(Integer.parseInt(request.getParameter("idDistrito")));
		
		request.setAttribute("distrito", distrito);
		Util.RedirectTo(request, response);
	}
	
}
