package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOFactory;
import Entidades.Distrito;

@WebServlet("/DistritoServlet")
public class DistritoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		switch (Util.validateParameter(request.getParameter("action"), String.class, "NotFound")) {
		case "list": listDistritos(request, response); break;
		case "get": getDistrito(request, response); break;
		case "NotFound": Util.RedirectTo(request, response, "NotFound"); break;
		default: Util.RedirectTo(request, response, "NotFound"); break;
		}
	}

	private void listDistritos(HttpServletRequest request, HttpServletResponse response) {
		List<Distrito> distritos = dao.getDistrito().listDistrito();
		
		request.setAttribute("distritos", distritos);
		Util.RedirectTo(request, response);
	}
	private void getDistrito(HttpServletRequest request, HttpServletResponse response) {
		Distrito distrito = dao.getDistrito().getDistrito(Integer.parseInt(request.getParameter("idDistrito")));
		
		request.setAttribute("distrito", distrito);
		Util.RedirectTo(request, response);
	}
	
}
