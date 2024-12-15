package Interfaces;

import Entidades.Inmueble;
import Entidades.CardInmueble;
import java.util.List;


public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public List<Inmueble> listFilteredInmueble(Double min, Double max, Integer idDistrito, String tipoInmueble);
	public List<CardInmueble> listCardInmueble();
	public List<String> listTipoInmueble();
	public List<String> listEstadoInmueble();
	public Inmueble getInmueble(Integer id);
	public boolean addInmueble(Inmueble inmueble);
	public boolean updateInmueble(Inmueble inmueble);

}
