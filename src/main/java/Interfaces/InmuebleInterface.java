package Interfaces;

import java.util.List;

import Entidades.Inmueble;

public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public List<Inmueble> listInmuebleCard();
	public Inmueble getInmueble(Integer id);
	public boolean addInmueble(Inmueble inmueble);
	public boolean updateInmueble(Inmueble inmueble);
	public boolean deleteInmueble(Integer id);

}
