package Entidades;

public class InmagenInmueble {

	private Integer idImagen, idInmueble;
	private String linkImagen;
	
	public InmagenInmueble(Integer idImagen, Integer idInmueble, String linkImagen) {
		this.idImagen = idImagen;
		this.idInmueble = idInmueble;
		this.linkImagen = linkImagen;
	}
	
	public InmagenInmueble() { }

	
	public Integer getIdImagen() { return idImagen; }
	public Integer getIdInmueble() { return idInmueble; }
	public String getLinkImagen() { return linkImagen; }
	
}
