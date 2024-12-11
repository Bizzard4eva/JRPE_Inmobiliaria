package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Usuario;
import Modelos.UsuarioModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("txtEmail");
		String pass = request.getParameter("txtPassword");
		
		UsuarioModel usuarioModel = new UsuarioModel();
		Usuario usuarioAuthenticated = usuarioModel.authenticateByEmailAndPassword(email, pass);
		
		if(usuarioAuthenticated == null) {
			String mensaje = "Usuario o password incorrecto";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
		switch (usuarioAuthenticated.getRol()) {
			case "Administrador": {
				request.setAttribute("admin", usuarioAuthenticated);
				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			}
			case "Agente": {
				request.setAttribute("usuario", usuarioAuthenticated);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			default:
				request.getRequestDispatcher("Catalog.jsp").forward(request, response);
		}
	
	
		
	}
}
