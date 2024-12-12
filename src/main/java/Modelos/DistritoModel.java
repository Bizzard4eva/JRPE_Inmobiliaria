package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.Distrito;
import Interfaces.DistritoInterface;
import Util.MySQLConexion;

public class DistritoModel implements DistritoInterface {

	@Override
	public List<Distrito> listDistrito() {
		
		List<Distrito> listDistrito = new ArrayList<Distrito>();
		String sql = "SELECT * FROM Distritos";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
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
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listDistrito;
	}

	@Override
	public Distrito getDistrito(Integer id) {
		
		Distrito distrito = null;
		String sql = "SELECT * FROM Distritos WHERE idDistrito = ?";
				
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				distrito = new Distrito(
						result.getInt("idDistrito"),
						result.getString("nombreDistrito"));
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());
		}
		
		return distrito;
	}

}
