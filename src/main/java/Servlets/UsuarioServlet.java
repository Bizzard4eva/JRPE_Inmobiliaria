package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOFactory;
import Entidades.Usuario;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (Util.validateParameter(request.getParameter("action"), String.class, "NotFound")) {
		case "list": listUsuarios(request, response); break;
		case "validate": loginUsuario(request, response); break;
		case "get": getUsuario(request, response); break;
		case "add": addUsuario(request, response); break;
		case "update": updateUsuario(request, response); break;
		case "NotFound": Util.RedirectTo(request, response, "NotFound"); break;
		default: Util.RedirectTo(request, response, "NotFound"); break;
		}
	}

	private void listUsuarios(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			List<Usuario> usuarios = dao.getUsuario().listUsuario();

			request.setAttribute("usuarios", usuarios);
			Util.RedirectTo(request, response, "AdminUsuarios");
		} catch (Exception e) {
			Util.RedirectTo(request, response, "NotFound");
		}
	}
	private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuarioLogeado = dao.getUsuario().validateUsuario(
				request.getParameter("email"), 
				request.getParameter("password"));
		if(usuarioLogeado == null) {
			request.setAttribute("logMessage", "Credenciales incorrectas.");
			Util.RedirectTo(request, response, "Login");
		}
				
	}
	private void getUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = dao.getUsuario().getUsuario(Integer.parseInt(request.getParameter("idUsuario")));
		
		request.setAttribute("usuario", usuario);
		Util.RedirectTo(request, response);
	}
	private void addUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = new Usuario(0,
				request.getParameter("txtName"), 
				request.getParameter("txtEmail"), 
				request.getParameter("txtPassword"), 
				request.getParameter("txtTel"));
		
		if(dao.getUsuario().addUsuario(usuario)) { Util.RedirectTo(request, response); }
	}
	private void updateUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = new Usuario(
				Integer.parseInt(request.getParameter("idUsuario")),
				request.getParameter("nombre"), 
				request.getParameter("email"), 
				request.getParameter("password"), 
				request.getParameter("telefono"));
		
		if(dao.getUsuario().updateUsuario(usuario)) { Util.RedirectTo(request, response); }
	}

}
