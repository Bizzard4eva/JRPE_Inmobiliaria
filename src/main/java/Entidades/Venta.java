package Entidades;

import java.util.Date;

public class Venta {

	private Integer idVenta;
	private String inmueble, cliente, agente;
	private Double precioFinal;
	private Date fechaVenta;
	

	public Venta(Integer idVenta, String inmueble, String cliente, String agente, Double precioFinal, Date fechaVenta) {
		super();
		this.idVenta = idVenta;
		this.inmueble = inmueble;
		this.cliente = cliente;
		this.agente = agente;
		this.precioFinal = precioFinal;
		this.fechaVenta = fechaVenta;
	}


	public Venta() { }

	
	public Integer getIdVenta() { return idVenta; }
	public String getInmueble() { return inmueble; }
	public String getCliente() { return cliente; }
	public String getAgente() { return agente; }
	public Double getPrecioFinal() { return precioFinal; }
	public Date getFechaVenta() { return fechaVenta; }
	
}
