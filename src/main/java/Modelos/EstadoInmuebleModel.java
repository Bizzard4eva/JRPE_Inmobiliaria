package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.EstadoInmueble;
import Interfaces.EstadoInmuebleInterface;
import Util.MySQLConexion;

public class EstadoInmuebleModel implements EstadoInmuebleInterface {

	@Override
	public List<EstadoInmueble> listEstadosInmueble() {
		
		List<EstadoInmueble> listEstadoInmueble = new ArrayList<EstadoInmueble>();
		String sql = "SELECT * FROM EstadosInmueble";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				EstadoInmueble estadoInmueble = new EstadoInmueble(
						result.getInt("idEstadoInmueble"), 
						result.getString("nombreEstado")
						);
				listEstadoInmueble.add(estadoInmueble);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listEstadoInmueble;
	}

	@Override
	public EstadoInmueble getEstadoInmueble(Integer id) {
		
		EstadoInmueble estadoInmueble = null;
		String sql = "SELECT * FROM EstadosInmueble WHERE idEstadoInmueble = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				estadoInmueble = new EstadoInmueble(
						result.getInt("idEstadoInmueble"),
						result.getString("nombreEstado")
						);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());
		}
		
		return estadoInmueble;
	}

}
