package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entidades.Venta;
import Interfaces.VentaInterface;
import Util.MySQLConexion;

public class VentaModel implements VentaInterface {

	@Override
	public List<Venta> listVentas() {
		List<Venta> listVenta = new ArrayList<Venta>();
		String sql = "SELECT * FROM ventas";
		
		try
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareStatement(sql);
		) 
		{
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				Venta venta = new Venta(
						result.getInt("idVenta"), 
						new UsuarioModel().getUsuario(result.getInt("idInmueble")).getNombre(),
						new UsuarioModel().getUsuario(result.getInt("idCliente")).getNombre(),
						new UsuarioModel().getUsuario(result.getInt("idAgente")).getNombre(),
						result.getDouble("precioFinalVenta"),
						result.getDate("fechaVenta")
						);
				listVenta.add(venta);
			}
		} catch (SQLException e) {	
			System.err.println("Error SQL: " + e.getMessage() + " - Código de error: " + e.getErrorCode());
		} catch (NullPointerException e) {
			System.err.println("Referencia a un objeto nulo: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error inesperado: " + e.getMessage());			
		}
		
		return listVenta;
	}

}
