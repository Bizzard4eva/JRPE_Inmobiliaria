package Interfaces;

import Entidades.Inmueble;
import Entidades.CardInmueble;
import java.util.List;


public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public List<CardInmueble> listFilteredInmueble(Double min, Double max, Integer idDistrito, Integer idTipoInmueble);
	public List<CardInmueble> listCardInmueble();
	public Inmueble getInmueble(Integer id);
	public boolean addInmueble(Inmueble inmueble);
	public boolean updateInmueble(Inmueble inmueble);

}
