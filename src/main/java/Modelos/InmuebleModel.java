package Modelos;

import java.sql.CallableStatement;
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
	public List<Inmueble> listInmueble() throws NullPointerException {
		
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
						new TipoInmuebleModel().getTipoInmueble(result.getInt("idTipoInmueble")).getTipo(), 
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"), 
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"), 
						result.getDouble("areaConstruidaInmueble"), 
						new EstadoInmuebleModel().getEstadoInmueble(result.getInt("idEstadoInmueble")).getEstado(), 
						new UsuarioModel().getUsuario(result.getInt("idAgente")), 
						new DistritoModel().getDistrito(result.getInt("idDistrito"))
						);
				listInmueble.add(inmueble);
			}
			return listInmueble;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo listar los Inmuebles -");
	}
	
	@Override
	public List<CardInmueble> listFilteredInmueble(Integer min, Integer max, Integer idDistrito, Integer idTipoInmueble) throws NullPointerException {
		
		List<CardInmueble> listInmueble = new ArrayList<CardInmueble>();
		String sql = "{ CALL sp_filteredInmueble(?, ?, ?, ?) }";
		
		try
		(	
			Connection conexion = MySQLConexion.getConexion();
			CallableStatement statement = conexion.prepareCall(sql);
		)
		{
			statement.setInt(1, min);
			statement.setInt(2, max);
			statement.setInt(3, idDistrito);
			statement.setInt(4, idTipoInmueble);

			ResultSet result = statement.executeQuery();
			while(result.next()) {
				CardInmueble inmueble = new CardInmueble(
						result.getInt("idInmueble"),
						result.getString("rutaImagenInmueble"), 
						result.getDouble("precioInmueble"),
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"),
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"),
						result.getDouble("areaConstruidaInmueble")
						);
				listInmueble.add(inmueble);
			}
			return listInmueble;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo listar los Inmuebles Filtrados -");
	}
	
	@Override
	public List<CardInmueble> listCardInmueble() throws NullPointerException {
		
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
						result.getDouble("areaConstruidaInmueble")
						);
				listInmuebleCard.add(card);
			}
			return listInmuebleCard;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo listar las Cartas de Inmuebles -");
	}
	
	@Override
	public List<String> listImagenesInmueble(Integer id) throws NullPointerException {
		
		List<String> listImagenes = new ArrayList<String>();
		String sql = "SELECT rutaImagenInmueble FROM ImagenesInmuebles WHERE idInmueble = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				listImagenes.add(result.getString("rutaImagenInmueble"));
			}
			return listImagenes;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo listar los link/imagenes -");
	}
	
	@Override
	public Inmueble getInmueble(Integer id) throws NullPointerException {
		
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
						new TipoInmuebleModel().getTipoInmueble(result.getInt("idTipoInmueble")).getTipo(), 
						result.getString("direccionInmueble"), 
						result.getInt("habitacionesInmueble"), 
						result.getInt("banosInmueble"), 
						result.getDouble("areaTotalInmueble"), 
						result.getDouble("areaConstruidaInmueble"), 
						new EstadoInmuebleModel().getEstadoInmueble(result.getInt("idEstadoInmueble")).getEstado(), 
						new UsuarioModel().getUsuario(result.getInt("idAgente")), 
						new DistritoModel().getDistrito(result.getInt("idDistrito"))
						);
			}
			return inmueble;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo retornar el Inmueble -");
	}

	@Override
	public boolean addInmueble(Inmueble inmueble) {
		
		
		String sql =  "INSERT INTO Inmuebles (tituloInmueble, descripcionInmueble, "
					+ "precioInmueble, idTipoInmueble, direccionInmueble, habitacionesInmueble, "
					+ "banosInmueble, areaTotalInmueble, areaConstruidaInmueble, "
					+ "idAgente, idDistrito) VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?,?)";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			Integer idTipoInmueble = getIdTipoInmueble(inmueble.getTipo()); 
			
			statement.setString(1, inmueble.getTitulo());
			statement.setString(2, inmueble.getDescripcion());
			statement.setDouble(3, inmueble.getPrecio());
			statement.setInt(4, idTipoInmueble); 
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
					+ "precioInmueble = ?, idTipoInmueble = ?, direccionInmueble = ?, "
					+ "habitacionesInmueble = ?, banosInmueble = ?, areaTotalInmueble = ?, "
					+ "areaConstruidaInmueble = ?, idAgente = ?, idDistrito = ?, "
					+ "idEstadoInmueble = ?";
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			Integer idTipoInmueble = getIdTipoInmueble(inmueble.getTipo());
			Integer idEstadoInmueble = getIdEstadoInmueble(inmueble.getEstado());
			
			statement.setString(1, inmueble.getTitulo());
			statement.setString(2, inmueble.getDescripcion());
			statement.setDouble(3, inmueble.getPrecio());
			statement.setInt(4, idTipoInmueble);
			statement.setString(5, inmueble.getDireccion());
			statement.setInt(6, inmueble.getHabitaciones());
			statement.setInt(7, inmueble.getBanos());
			statement.setDouble(8, inmueble.getAreaTotal());
			statement.setDouble(9, inmueble.getAreaConstruida());
			statement.setInt(10, inmueble.getUsuario().getIdUsuario());
			statement.setInt(11, inmueble.getDistrito().getIdDistrito());
			statement.setInt(12, idEstadoInmueble);
			
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

	
	public Integer getIdTipoInmueble(String tipoInmueble) throws NullPointerException {
		Integer id = -1;
		String sql = "SELECT idTipoInmueble FROM TiposInmueble WHERE nombreTipoInmueble = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, tipoInmueble);
			
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				id = result.getInt("idTipoInmueble");
			}
			return id;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		throw new NullPointerException("- No se pudo conseguir el IdTipoInmueble -");
	}
	
	public Integer getIdEstadoInmueble(String estadoInmueble) throws NullPointerException {
		Integer id = -1;
		String sql = "SELECT idEstadoInmueble FROM EstadosInmueble WHERE nombreEstado = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, estadoInmueble);
			
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				id = result.getInt("idEstadoInmueble");
			}
			return id;
			
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
	
		throw new NullPointerException("- No se pudo conseguir el IdEstadoInmueble -");
	}
	
}
