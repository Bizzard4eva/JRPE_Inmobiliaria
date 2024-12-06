<<<<<<< HEAD
package Interfaces;

import java.util.List;

import Entidades.Inmueble;

public interface InmuebleInterface {
	
	public List<Inmueble> listInmueble();
	public Inmueble getInmueble(Integer id);
	public boolean addInmueble(Inmueble inmueble);
	public boolean updateInmueble(Inmueble inmueble);
	public boolean deleteInmueble(Integer id);
	
}
=======
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
>>>>>>> dacfba6afa2e7430d59a366136bdd16354cf472c
