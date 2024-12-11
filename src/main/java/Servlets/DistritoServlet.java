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
		String type = request.getParameter("type");
		
		switch (type) {
		case "list": listDistrito(request, response); break;
		case "info": getDistrito(request, response); break;
		default:
			request.getRequestDispatcher("Catalog.jsp").forward(request, response);
		}
	}

	private void getDistrito(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		
	}

	private void listDistrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DistritoModel model = new DistritoModel();
		List<Distrito> data = model.listDistrito();
		request.setAttribute("data", data);
		request.getRequestDispatcher("Catalog.jsp").forward(request, response);
	}

}
