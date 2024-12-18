package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Usuario;
import Modelos.SessionModel;
import Modelos.UsuarioModel;
import Util.Constants;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionModel session = new SessionModel();
		String action = request.getParameter("action");
		
		if(action.equals("login")) {
			String email = request.getParameter("txtEmail");
			String pass = request.getParameter("txtPassword");
			
			UsuarioModel usuarioModel = new UsuarioModel();
			Usuario usuarioAuthenticated = usuarioModel.validateUsuario(email, pass);
			
			if(usuarioAuthenticated != null) {
				session.saveSessionTimeOut(request, 30);
				session.saveSessionString(request, Constants.NAME, usuarioAuthenticated.getNombre());
				session.saveSessionString(request, Constants.EMAIL, usuarioAuthenticated.getEmail());
				session.saveSessionString(request, Constants.PASSWORD, usuarioAuthenticated.getPassword());
				session.saveSessionString(request, Constants.ROL, usuarioAuthenticated.getRol());
				session.saveSessionString(request, Constants.PHONE, usuarioAuthenticated.getPassword());
				
				switch (usuarioAuthenticated.getRol()) {
					case "Administrador": {
						response.sendRedirect("InmuebleServlet?action=list&redirectTo=Admin");
						break;
					}
					case "Cliente": {
						response.sendRedirect("Home.jsp");
						break;
					}
					default:
						response.sendRedirect("InmuebleServlet?action=list&redirectTo=Admin");
						break;
					}

			} else {
				request.setAttribute("mensaje", "Usuario o password incorrecto");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		} else if(action.equals("logout")) {
			session.invalidateSession(request);
			System.out.println("session "+session.toString());
			response.sendRedirect("Home.jsp");
		}
	}
}
