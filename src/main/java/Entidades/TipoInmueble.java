package Entidades;

public class TipoInmueble {

	private Integer idTipoInmueble;
	private String Tipo;
	
	public TipoInmueble(Integer idTipoInmueble, String tipo) {
		this.idTipoInmueble = idTipoInmueble;
		Tipo = tipo;
	}
	
	public TipoInmueble() { }

	
	public Integer getIdTipoInmueble() { return idTipoInmueble; }
	public String getTipo() { return Tipo; }
	
}
