package Entidades;

public class Rol {

	private Integer idRol;
	private String nombre;
	
	public Rol(Integer idRol, String nombre) {
		this.idRol = idRol;
		this.nombre = nombre;
	}
	
	public Rol() { }
	
	
	public Integer getIdRol() { return idRol; }
	public String getNombre() { return nombre; }
}
