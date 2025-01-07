package Util;

import java.util.Arrays;
import java.util.List;

import Entidades.Header;

public class Constants {
  public static final List<Header> ITEMS_HEADER_ADMIN = Arrays.asList(        
		  	new Header("Inicio", "InmuebleServlet?action=loadHome"),
		  	new Header("Inmuebles", "InmuebleServlet?action=loadCatalog"),
	        new Header("Lista Inmuebles", "InmuebleServlet?action=list"),
	        new Header("Lista Usuarios", "UsuarioServlet?action=list"),
	        new Header("Lista Ventas", "VentaServlet?action=list")     
 );
  
  public static final List<Header> ITEMS_HEADER = Arrays.asList(        
		  	new Header("Inicio", "InmuebleServlet?action=loadHome"),
	        new Header("Inmuebles", "InmuebleServlet?action=loadCatalog")
 );
  
  public static final String NAME = "nombre";
  public static final String EMAIL = "email";
  public static final String PASSWORD = "password";
  public static final String ROL = "rol";
  public static final String PHONE = "telefono";
}
