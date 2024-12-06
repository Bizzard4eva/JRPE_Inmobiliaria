package Interfaces;

import java.util.List;

import Entidades.Inmueble;

public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public List<Inmueble> listInmuebleCard(); 
	public boolean createInmueble (Integer id);
	public Inmueble getDistrito(Integer id);
	public boolean updateInmueble(Inmueble inmueble);
	public boolean deleteInmueble(Integer id);
}
