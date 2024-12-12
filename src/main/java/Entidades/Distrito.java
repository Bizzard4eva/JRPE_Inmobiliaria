package Entidades;

public class Distrito {

	private Integer idDistrito;
	private String nombre;
	
	public Distrito(Integer idDistrito, String nombre) {
		this.idDistrito = idDistrito;
		this.nombre = nombre;
	}
	
	public Distrito() { }
	
	
	public Integer getIdDistrito() { return idDistrito; }
	public String getNombre() { return nombre; }
	
}
