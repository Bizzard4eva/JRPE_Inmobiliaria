package Dao;

import Interfaces.*;

public abstract class DAOFactory {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;
	public static final int ORACLE = 3;
	
	public abstract DistritoInterface getDistrito();
	public abstract EstadoInmuebleInterface getEstadoInmueble();
	public abstract InmuebleInterface getInmueble();
	public abstract RolInterface getRol();
	public abstract SessionInterface getSession();
	public abstract TipoInmuebleInterface getTipoInmueble();
	public abstract UsuarioInterface getUsuario();
	public abstract VentaInterface getVenta();
	
	public static DAOFactory getDaoFactory(int type) {
		
		switch (type) {
		case MYSQL: return new MySqlDaoFactory();
		case SQLSERVER: return null;
		case ORACLE: return null;
		default: return null;
		
		}
	}
	
}
