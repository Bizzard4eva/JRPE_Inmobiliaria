package Util;

import java.util.Arrays;
import java.util.List;

import Entidades.Header;

public class Constants {
  public static final List<Header> ITEMS_HEADER = Arrays.asList(        
		  	new Header("Inicio", "Home.jsp"),
	        new Header("Inmuebles", "InmuebleServlet?action=loadCatalog&redirectTo=Catalog")
   );
  
  public static final List<Header> ITEMS_HEADER_ADMIN = Arrays.asList(        
		  	new Header("Inicio", "Home.jsp"),
	        new Header("Lista Inmuebles", "InmuebleServlet?action=list&redirectTo=Admin"),
	        new Header("Lista Usuarios", "UsuarioServlet?action=list&redirectTo=ListUser"),
	        new Header("Lista Ventas", "UsuarioServlet?action=list&redirectTo=ListUser")
	        
 );
  
  public static final String NAME = "nombre";
  public static final String EMAIL = "email";
  public static final String PASSWORD = "password";
  public static final String ROL = "rol";
  public static final String PHONE = "telefono";
}
