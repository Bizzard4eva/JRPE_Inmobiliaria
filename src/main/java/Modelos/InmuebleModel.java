package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.CardInmueble;
import Entidades.Inmueble;
import Interfaces.InmuebleInterface;
import Util.MySQLConexion;

public class InmuebleModel implements InmuebleInterface {

	@Override
	public List<Inmueble> listInmueble() {
		
		List<Inmueble> listInmueble = new ArrayList<Inmueble>();
		String sql = "SELECT * FROM Inmuebles";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Inmueble inmueble = new Inmueble(
						result.getInt("idInmueble"), 
						result.getString("tituloInmueble"),
						result.getString("descripcionInmueble"), 
						result.getDouble("precioInmueble"), 
						result.getString("tipoInmueble"), 
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"), 
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"), 
						result.getDouble("areaConstruidaInmueble"), 
						result.getString("estadoInmueble"), 
						new UsuarioModel().getUsuario(result.getInt("idAgente")), 
						new DistritoModel().getDistrito(result.getInt("idDistrito"))
						);
				listInmueble.add(inmueble);
				
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listInmueble;
	}
	
	@Override
	public List<Inmueble> listFilteredInmueble(Double min, Double max, Integer idDistrito, String tipoInmueble) {
		
		List<Inmueble> listInmueble = new ArrayList<Inmueble>();
		String sql =  "SELECT * FROM Inmuebles WHERE (precioInmueble BETWEEN ? AND ?) "
					+ "AND (idDistrito = ?) AND (tipoInmueble = ?)";
		
		try
		(	
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setDouble(1, min);
			statement.setDouble(2, max);
			statement.setInt(3, idDistrito);
			statement.setString(4, tipoInmueble);
			
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Inmueble inmueble = new Inmueble(
						result.getInt("idInmueble"), 
						result.getString("tituloInmueble"),
						result.getString("descripcionInmueble"), 
						result.getDouble("precioInmueble"), 
						result.getString("tipoInmueble"), 
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"), 
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"), 
						result.getDouble("areaConstruida"), 
						result.getString("areaConstruidaInmueble"), 
						new UsuarioModel().getUsuario(result.getInt("idAgente")), 
						new DistritoModel().getDistrito(result.getInt("idDistrito"))
						);
				listInmueble.add(inmueble);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listInmueble;
	}
	
	@Override
	public List<CardInmueble> listCardInmueble() {
		
		List<CardInmueble> listInmuebleCard = new ArrayList<CardInmueble>();
		String sql = "{CALL sp_cardInmueble()}";
		
		try 
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareCall(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				CardInmueble card = new CardInmueble(
						result.getInt("idInmueble"),
						result.getString("rutaImagenInmueble"), 
						result.getDouble("precioInmueble"),
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"),
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"),
						result.getDouble("areaConstruidaInmueble"));
				listInmuebleCard.add(card);
			}

		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		System.out.println(listInmuebleCard.toString());
		return listInmuebleCard;
	}
	
	public List<String> listTipoInmueble() {
		
		List<String> tiposInmueble = new ArrayList<>();
		String sql = "SELECT DISTINCT tipoInmueble FROM Inmuebles";

		try 
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				tiposInmueble.add(result.getString("tipoInmueble"));
			}
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}

		return tiposInmueble;
	}

	@Override
	public Inmueble getInmueble(Integer id) {
		
		Inmueble inmueble = null;
		String sql = "SELECT * FROM Inmuebles WHERE idInmueble = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				 inmueble = new Inmueble(
						result.getInt("idInmueble"), 
						result.getString("tituloInmueble"),
						result.getString("descripcionInmueble"), 
						result.getDouble("precioInmueble"), 
						result.getString("tipoInmueble"), 
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"), 
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"), 
						result.getDouble("areaConstruidaInmueble"), 
						result.getString("estadoInmueble"), 
						new UsuarioModel().getUsuario(result.getInt("idAgente")), 
						new DistritoModel().getDistrito(result.getInt("idDistrito"))
						);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return inmueble;
	}

	@Override
	public boolean addInmueble(Inmueble inmueble) {
		
		String sql =  "INSERT INTO Inmuebles (tituloInmueble, descripcionInmueble, "
					+ "precioInmueble, tipoInmueble, direccionInmueble, habitacionesInmueble, "
					+ "banosInmueble, areaTotalInmueble, areaConstruidaInmueble, "
					+ "idAgente, idDistrito) VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?,?)";
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, inmueble.getTitulo());
			statement.setString(2, inmueble.getDescripcion());
			statement.setDouble(3, inmueble.getPrecio());
			statement.setString(4, inmueble.getTipo()); // Casa o Departamento
			statement.setString(5, inmueble.getDireccion());
			statement.setInt(6, inmueble.getHabitaciones());
			statement.setInt(7, inmueble.getBanos());
			statement.setDouble(8, inmueble.getAreaTotal());
			statement.setDouble(9, inmueble.getAreaConstruida());
			statement.setInt(10, inmueble.getUsuario().getIdUsuario());
			statement.setInt(11, inmueble.getDistrito().getIdDistrito());
			
			return statement.executeUpdate() > 0;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return false;
	}

	@Override
	public boolean updateInmueble(Inmueble inmueble) {
		
		String sql =  "UPDATE Inmuebles SET tituloInmueble = ?, descripcionInmueble = ?, "
					+ "precioInmueble = ?, tipoInmueble = ?, direccionInmueble = ?, "
					+ "habitacionesInmueble = ?, banosInmueble = ?, areaTotalInmueble = ?, "
					+ "areaConstruidaInmueble = ?, idAgente = ?, idDistrito = ?";
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, inmueble.getTitulo());
			statement.setString(2, inmueble.getDescripcion());
			statement.setDouble(3, inmueble.getPrecio());
			statement.setString(4, inmueble.getTipo()); // Casa o Departamento
			statement.setString(5, inmueble.getDireccion());
			statement.setInt(6, inmueble.getHabitaciones());
			statement.setInt(7, inmueble.getBanos());
			statement.setDouble(8, inmueble.getAreaTotal());
			statement.setDouble(9, inmueble.getAreaConstruida());
			statement.setInt(10, inmueble.getUsuario().getIdUsuario());
			statement.setInt(11, inmueble.getDistrito().getIdDistrito());
			
			return statement.executeUpdate() > 0;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return false;
	}
	
}
