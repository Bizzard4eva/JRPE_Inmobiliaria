package Entidades;

public class CardInmueble {

	private Integer idInmueble, habitacionesInmueble, banosInmueble;
	private String rutaImagenInmueble, direccionInmueble;
	private double precioInmueble, areaTotalInmueble, areaConstruidaInmueble;

	public CardInmueble(Integer idInmueble, String rutaImagenInmueble, double precioInmueble, String direccionInmueble, Integer habitacionesInmueble, Integer banosInmueble, double areaTotalInmueble, double areaConstruidaInmueble) {
		this.idInmueble = idInmueble;
		this.habitacionesInmueble = habitacionesInmueble;
		this.banosInmueble = banosInmueble;
		this.rutaImagenInmueble = rutaImagenInmueble;
		this.direccionInmueble = direccionInmueble;
		this.precioInmueble = precioInmueble;
		this.areaTotalInmueble = areaTotalInmueble;
		this.areaConstruidaInmueble = areaConstruidaInmueble;
	}

	public CardInmueble() {
	}

	public Integer getIdInmueble() {
		return idInmueble;
	}

	public Integer getHabitacionesInmueble() {
		return habitacionesInmueble;
	}

	public Integer getBanosInmueble() {
		return banosInmueble;
	}

	public String getRutaImagenInmueble() {
		return rutaImagenInmueble;
	}

	public String getDireccionInmueble() {
		return direccionInmueble;
	}

	public double getPrecioInmueble() {
		return precioInmueble;
	}

	public double getAreaTotalInmueble() {
		return areaTotalInmueble;
	}

	public double getAreaConstruidaInmueble() {
		return areaConstruidaInmueble;
	}
	
	@Override
	public String toString() {
		return "CardInmueble(" + 
				"id=" + idInmueble + 
				"id=" + habitacionesInmueble + 
				"id=" + banosInmueble + 
				"id=" + rutaImagenInmueble + 
				"id=" + direccionInmueble + 
				"id=" + precioInmueble + 
				"id=" + areaTotalInmueble + 
				"id=" + areaConstruidaInmueble + 
				")";
	}

}
