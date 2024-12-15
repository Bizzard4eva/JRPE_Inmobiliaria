package Interfaces;

import java.util.List;

import Entidades.EstadoInmueble;

public interface EstadoInmuebleInterface {

	public List<EstadoInmueble> listEstadosInmueble();
	public EstadoInmueble getEstadoInmueble(Integer id);
}
