package Entidades;

public class TipoInmueble {

	private Integer idTipoInmueble;
	private String tipo;
	
	public TipoInmueble(Integer idTipoInmueble, String tipo) {
		this.idTipoInmueble = idTipoInmueble;
		this.tipo = tipo;
	}
	
	public TipoInmueble() { }

	
	public Integer getIdTipoInmueble() { return idTipoInmueble; }
	public String getTipo() { return tipo; }
	
}
