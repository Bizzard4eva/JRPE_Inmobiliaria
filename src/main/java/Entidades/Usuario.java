package Entidades;

import java.util.Date;

public class Usuario {

	private Integer idUsuario;
	private String nombre, email, password, rol, telefono;
	private Date fechaRegistro;
	
	public Usuario(Integer idUsuario, String nombre, String email, String password, String rol, String telefono, Date fechaRegistro) {
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.email = email;
		this.password = password;
		this.rol = rol;
		this.telefono = telefono;
		this.fechaRegistro = fechaRegistro;
	}
	
	public Usuario(Integer idUsuario, String nombre, String email, String password, String telefono) {
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.email = email;
		this.password = password;
		this.telefono = telefono;
	}
	
	public Usuario() { }

	
	public Integer getIdUsuario() { return idUsuario; }
	public String getNombre() { return nombre; }
	public String getEmail() { return email; }
	public String getPassword() { return password; }
	public String getRol() { return rol; }
	public String getTelefono() { return telefono; }
	public Date getFechaRegistro() { return fechaRegistro; }
	
}
