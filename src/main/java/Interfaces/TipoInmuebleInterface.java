package Interfaces;

import java.util.List;

import Entidades.TipoInmueble;

public interface TipoInmuebleInterface {
	
	public List<TipoInmueble> listTiposInmueble();
	public TipoInmueble getTipoInmueble(Integer id);
}
