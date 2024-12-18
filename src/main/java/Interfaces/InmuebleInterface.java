package Interfaces;

import Entidades.Inmueble;
import Entidades.CardInmueble;
import java.util.List;


public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public List<CardInmueble> listFilteredInmueble(Integer min, Integer max, Integer idDistrito, Integer idTipoInmueble);
	public List<CardInmueble> listCardInmueble();
	public List<String> listImagenesInmueble(Integer id);
	public Inmueble getInmueble(Integer id);
	public boolean addInmueble(Inmueble inmueble);
	public boolean updateInmueble(Inmueble inmueble);

}
