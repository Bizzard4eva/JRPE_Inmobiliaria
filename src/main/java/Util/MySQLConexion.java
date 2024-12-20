package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
	
	private static final String URL = "jdbc:mysql://localhost/dbBienesRaices?useSSL=false&useTimezone=true&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Sherlock0";
	
	public static Connection getConexion() {
		
		Connection conexion = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(URL,USER,PASSWORD);
		} catch (ClassNotFoundException e) {
			System.err.println("Error: Driver de MySQL no econtrado |" + e.getMessage());
		} catch (SQLException e) {
			System.err.println("Error: No se pudo conectar con la base de datos |" + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error desconocido: " + e.getMessage());
		}
		return conexion;
	}
	
}
