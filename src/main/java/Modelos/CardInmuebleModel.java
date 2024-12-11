package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidades.CardInmueble;
import Interfaces.CardInmuebleInterface;
import Util.MySQLConexion;

public class CardInmuebleModel implements CardInmuebleInterface {

	@Override
	public List<CardInmueble> listCardInmueble() {
		List<CardInmueble> listInmuebleCard = new ArrayList<CardInmueble>();

		try 
		(
			Connection conexion = MySQLConexion.getConexion();
			PreparedStatement statement = conexion.prepareCall("{CALL sp_cardInmueble()}");
		) 
		{
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				CardInmueble card = new CardInmueble(
				        rs.getInt("idInmueble"),
				        rs.getString("rutaImagenInmueble"), 
				        rs.getDouble("precioInmueble"),
				        rs.getString("direccionInmueble"), 
				        rs.getInt("habitacionesInmueble"),
				        rs.getInt("banosInmueble"), 
				        rs.getDouble("areaTotalInmueble"),
				        rs.getDouble("areaConstruidaInmueble"));
				System.out.println("PRUEBA" + card.getRutaImagenInmueble());
				listInmuebleCard.add(card);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("error");
		return listInmuebleCard;
	}

}
