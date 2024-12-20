package Dao;

import Interfaces.*;
import Modelos.*;


public class MySqlDaoFactory extends DAOFactory {

	@Override
	public DistritoInterface getDistrito() {
		return new DistritoModel();
	}

	@Override
	public EstadoInmuebleInterface getEstadoInmueble() {
		return new EstadoInmuebleModel();
	}

	@Override
	public InmuebleInterface getInmueble() {
		return new InmuebleModel();
	}

	@Override
	public RolInterface getRol() {
		return new RolModel();
	}

	@Override
	public TipoInmuebleInterface getTipoInmueble() {
		return new TipoInmuebleModel();
	}

	@Override
	public UsuarioInterface getUsuario() {
		return new UsuarioModel();
	}

	@Override
	public VentaInterface getVenta() {
		return new VentaModel();
	}
	
	@Override
	public SessionInterface getSession() {
		return new SessionModel();
	}

}
