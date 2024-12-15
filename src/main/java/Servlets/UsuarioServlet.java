package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Usuario;
import Modelos.UsuarioModel;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (request.getParameter("action")) {
		case "list": listUsuarios(request, response); break;
		case "validate": loginUsuario(request, response); break;
		case "get": getUsuario(request, response); break;
		case "add": addUsuario(request, response); break;
		case "update": updateUsuario(request, response); break;
		default: request.getRequestDispatcher("Home.jsp").forward(request, response); //TODO
		}
	}

	private void listUsuarios(HttpServletRequest request, HttpServletResponse response) {
		List<Usuario> usuarios = new UsuarioModel().listUsuario();
		
		request.setAttribute("usuarios", usuarios);
		Util.RedirectTo(request, response);
	}
	private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuarioLogeado = new UsuarioModel().validateUsuario(
				request.getParameter("email"), 
				request.getParameter("password"));
		if(usuarioLogeado == null) {
			request.setAttribute("logMessage", "Credenciales incorrectas.");
			Util.RedirectTo(request, response, "Login");
		}
				
	}
	private void getUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = new UsuarioModel().getUsuario(Integer.parseInt(request.getParameter("idUsuario")));
		
		request.setAttribute("usuario", usuario);
		Util.RedirectTo(request, response);
	}
	private void addUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = new Usuario(0,
				request.getParameter("nombre"), 
				request.getParameter("email"), 
				request.getParameter("password"), 
				request.getParameter("telefono"));
		
		if(new UsuarioModel().addUsuario(usuario)) { Util.RedirectTo(request, response); }
	}
	private void updateUsuario(HttpServletRequest request, HttpServletResponse response) {
		Usuario usuario = new Usuario(
				Integer.parseInt(request.getParameter("idUsuario")),
				request.getParameter("nombre"), 
				request.getParameter("email"), 
				request.getParameter("password"), 
				request.getParameter("telefono"));
		
		if(new UsuarioModel().updateUsuario(usuario)) { Util.RedirectTo(request, response); }
	}

}
