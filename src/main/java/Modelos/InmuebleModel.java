package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public Inmueble getInmueble(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addInmueble(Inmueble inmueble) {
		// TODO Auto-generated method stub
		return false;
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

	public List<String> listTipoInmueble() {
		
		List<String> tiposInmueble = new ArrayList<>();
		String sql = "SELECT DISTINCT tipoInmueble FROM Inmuebles";

		try (Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();) 
		{
			while (rs.next()) {
				tiposInmueble.add(rs.getString("tipoInmueble"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tiposInmueble;
	}
}
