package Entidades;

public class Inmueble {

	private Integer id, habitaciones, banos;
	private String titulo, descripcion, tipo, direccion, estado;
	private Double precio, areaTotal, areaConstruida;
	private Usuario usuario;
	private Distrito distrito;
	
	public Inmueble(Integer id, Integer habitaciones, Integer banos, String titulo, String descripcion, String tipo, String direccion, String estado, Double precio, Double areaTotal, Double areaConstruida, Usuario usuario, Distrito distrito) {
		this.id = id;
		this.habitaciones = habitaciones;
		this.banos = banos;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.direccion = direccion;
		this.estado = estado;
		this.precio = precio;
		this.areaTotal = areaTotal;
		this.areaConstruida = areaConstruida;
		this.usuario = usuario;
		this.distrito = distrito;
	}
	
	public Inmueble() { }

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getHabitaciones() {
		return habitaciones;
	}

	public void setHabitaciones(Integer habitaciones) {
		this.habitaciones = habitaciones;
	}

	public Integer getBanos() {
		return banos;
	}

	public void setBanos(Integer banos) {
		this.banos = banos;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Double getAreaTotal() {
		return areaTotal;
	}

	public void setAreaTotal(Double areaTotal) {
		this.areaTotal = areaTotal;
	}

	public Double getAreaConstruida() {
		return areaConstruida;
	}

	public void setAreaConstruida(Double areaConstruida) {
		this.areaConstruida = areaConstruida;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Distrito getDistrito() {
		return distrito;
	}

	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}
	
	
}
