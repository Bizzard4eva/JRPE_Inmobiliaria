package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.TipoInmueble;
import Interfaces.TipoInmuebleInterface;
import Util.MySQLConexion;

public class TipoInmuebleModel implements TipoInmuebleInterface {

	@Override
	public List<TipoInmueble> listTiposInmueble() {
		
		List<TipoInmueble> listTipoInmueble = new ArrayList<TipoInmueble>();
		String sql = "SELECT * FROM TiposInmueble";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				TipoInmueble tipoInmueble = new TipoInmueble(
						result.getInt("idTipoInmueble"), 
						result.getString("nombreTipo")
						);
				listTipoInmueble.add(tipoInmueble);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listTipoInmueble;
	}

	@Override
	public TipoInmueble getTipoInmueble(Integer id) {
		
		TipoInmueble tipoInmueble = null;
		String sql = "SELECT * FROM TiposInmueble WHERE idTipoInmueble = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				tipoInmueble = new TipoInmueble(
						result.getInt("idTipoInmueble"),
						result.getString("nombreTipo")
						);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());
		}
		
		return tipoInmueble;
	}

}
