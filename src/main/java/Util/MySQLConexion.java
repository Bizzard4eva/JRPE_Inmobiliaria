package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {

	public static Connection getConexion() 
	{
		Connection conexion = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String link = "jdbc:mysql://localhost/dbBienesRaices?useSSL=false&useTimezone=true&serverTimezone=UTC";
			String user = "root"; // Editable
			String password = "Sherlock0"; // Editable
			conexion = DriverManager.getConnection(link, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Error: Driver no instalado" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Error: No se pudo conectar con la BD" + e.getMessage());
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		return conexion;
	}
	
}
