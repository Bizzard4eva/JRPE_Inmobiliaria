package Entidades;

public class Inmueble {

	private Integer idInmueble, habitaciones, banos;
	private String titulo, descripcion, tipo, direccion, estado;
	private Double precio, areaTotal, areaConstruida;
	private Usuario usuario;
	private Distrito distrito;
	
	public Inmueble(Integer idInmueble, String titulo, String descripcion, Double precio, String tipo, String direccion, Integer habitaciones, Integer banos, Double areaTotal, Double areaConstruida, String estado, Usuario usuario, Distrito distrito ) {
		this.idInmueble = idInmueble;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.precio = precio;
		this.tipo = tipo;
		this.direccion = direccion;
		this.habitaciones = habitaciones;
		this.banos = banos;
		this.areaTotal = areaTotal;
		this.areaConstruida = areaConstruida;
		this.estado = estado;
		this.usuario = usuario;
		this.distrito = distrito;
	}
	
	
	public Inmueble() { }

	
	public Integer getIdInmueble() { return idInmueble; }
	public Integer getHabitaciones() { return habitaciones; }
	public Integer getBanos() { return banos; }
	public String getTitulo() { return titulo; }
	public String getDescripcion() { return descripcion; }
	public String getTipo() { return tipo; }
	public String getDireccion() { return direccion; }
	public String getEstado() { return estado; }
	public Double getPrecio() { return precio; }
	public Double getAreaTotal() { return areaTotal; }
	public Double getAreaConstruida() { return areaConstruida; }
	public Usuario getUsuario() { return usuario; }
	public Distrito getDistrito() { return distrito; }
	
}
