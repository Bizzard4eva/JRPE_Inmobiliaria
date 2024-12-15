package Entidades;

public class EstadoInmueble {

	private Integer idEstadoInmueble;
	private String Estado;
	
	public EstadoInmueble(Integer idEstadoInmueble, String estado) {
		this.idEstadoInmueble = idEstadoInmueble;
		Estado = estado;
	}
	
	public EstadoInmueble() { }

	
	public Integer getIdEstadoInmueble() { return idEstadoInmueble; }
	public String getEstado() { return Estado; }
	
}
