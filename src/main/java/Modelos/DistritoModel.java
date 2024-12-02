package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidades.Distrito;
import Interfaces.DistritoInterface;
import Util.MySQLConexion;

public class DistritoModel implements DistritoInterface {

	@Override
	public List<Distrito> listDistrito() {
		
		List<Distrito> listDistrito = new ArrayList<Distrito>();
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Distritos");
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Distrito distrito = new Distrito(
						result.getInt("idDistrito"), 
						result.getString("nombreDistrito")
						);
				listDistrito.add(distrito);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listDistrito;
	}

	@Override
	public Distrito getDistrito(Integer id) {
		
		Distrito distrito = null;
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Distritos WHERE idDistrito = ?");
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				distrito = new Distrito(
						result.getInt("idDistrito"),
						result.getString("nombreDistrito"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return distrito;
	}

}
