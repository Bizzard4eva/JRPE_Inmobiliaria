package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import Entidades.Inmueble;
import Interfaces.InmuebleInterface;
import Util.MySQLConexion;

public class InmuebleModel implements InmuebleInterface {

	@Override
	public List<Inmueble> listInmueble() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean createInmueble(Integer id) {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public Inmueble getDistrito(Integer id) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public boolean updateInmueble(Inmueble inmueble) {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public boolean deleteInmueble(Integer id) {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public List<Inmueble> listInmuebleCard() {
		// TODO Auto-generated method stub
		List<Inmueble> listInmuebleCard = new ArrayList<Inmueble>();
		
		try {
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement("SELECT * FROM ");
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
