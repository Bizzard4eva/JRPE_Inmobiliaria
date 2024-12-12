package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.Usuario;
import Interfaces.UsuarioInterface;
import Util.MySQLConexion;

public class UsuarioModel implements UsuarioInterface {

	@Override
	public List<Usuario> listUsuario() {
		
		List<Usuario> listUsuario = new ArrayList<Usuario>();
		String sql = "SELECT * FROM Usuarios";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Usuario usuario = new Usuario(
						result.getInt("idUsuario"),
						result.getString("nombreUsuario"),
						result.getString("emailUsuario"),
						result.getString("passwordUsuario"),
						result.getString("rolUsuario"),
						result.getString("telefonoUsuario"),
						result.getDate("fechaCreacionUsuario"));
				listUsuario.add(usuario);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listUsuario;
	}

	@Override
	public Usuario getUsuario(Integer id) {
		
		Usuario usuario = null;
		String sql = "SELECT * FROM Usuarios WHERE idUsuario = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				usuario = new Usuario(
						result.getInt("idUsuario"),
						result.getString("nombreUsuario"),
						result.getString("emailUsuario"),
						result.getString("passwordUsuario"),
						result.getString("rolUsuario"),
						result.getString("telefonoUsuario"),
						result.getDate("fechaCreacionUsuario")
						);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return usuario;
	}

	@Override
	public boolean addUsuario(Usuario usuario) {
		
		String sql =  "INSERT INTO Usuarios (nombreUsuario, emailUsuario, "
					+ "passwordUsuario, telefonoUsuario, rolUsuario) "
					+ "VALUES (?, ?, ?, ?, ?)";
				
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getEmail());
			statement.setString(3, usuario.getPassword());
			statement.setString(4, usuario.getTelefono());
			statement.setString(5, "Cliente"); // La web solo permitira agregar Clientes.
		//  statement.setString(5, usuario.getRol());
			
			return statement.executeUpdate() > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateUsuario(Usuario usuario) {
		
		String sql =  "UPDATE Usuarios SET nombreUsuario = ?, "
					+ "emailUsuario = ?, passwordUsuario = ?, "
					+ "telefonoUsuario = ? WHERE idUsuario = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion(); 
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getEmail());
			statement.setString(3, usuario.getPassword());
			statement.setString(4, usuario.getTelefono());
			statement.setInt(5, usuario.getIdUsuario());
			
			return statement.executeUpdate() > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public Usuario validateUsuario(String email, String password) {
		
		Usuario usuario = null;
		String sql =  "SELECT * FROM Usuarios WHERE emailUsuario = ? "
					+ "and passwordUsuario = ?";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		)
		{
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				usuario = new Usuario(
						result.getInt("idUsuario"),
						result.getString("nombreUsuario"),
						result.getString("emailUsuario"),
						result.getString("passwordUsuario"),
						result.getString("rolUsuario"),
						result.getString("telefonoUsuario"),
						result.getDate("fechaCreacionUsuario")
				);	
			}
		} catch (SQLException  e) {
			 System.out.println("Error en la consulta SQL" + e);
			 throw new RuntimeException("Error al autenticar usuario");
		}
		
		return usuario;
	}


}
