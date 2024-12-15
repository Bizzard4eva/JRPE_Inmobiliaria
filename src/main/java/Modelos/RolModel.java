package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.Rol;
import Interfaces.RolInterface;
import Util.MySQLConexion;

public class RolModel implements RolInterface {

	@Override
	public List<Rol> listRoles() {
		
		List<Rol> listRol = new ArrayList<Rol>();
		String sql = "SELECT * FROM Roles";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Rol rol = new Rol(
					result.getInt("idRol"), 
					result.getString("nombreRol"));
				listRol.add(rol);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listRol;
	}

	@Override
	public Rol getRol(Integer id) {
		
		Rol rol = null;
		String sql = "SELECT * FROM Roles WHERE idRol = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				rol = new Rol(
						result.getInt("idRol"),
						result.getString("nombreRol"));
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());
		}
		
		return rol;
	}

}
