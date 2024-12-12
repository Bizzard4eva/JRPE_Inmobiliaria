package Entidades;

import java.util.Date;

public class Venta {

	private Integer idVenta, idInmueble, idCliente, idAgente;
	private Double precioFinal;
	private Date fechaVenta;
	
	public Venta(Integer idVenta, Integer idInmueble, Integer idCliente, Integer idAgente, Double precioFinal, Date fechaVenta) {
		this.idVenta = idVenta;
		this.idInmueble = idInmueble;
		this.idCliente = idCliente;
		this.idAgente = idAgente;
		this.precioFinal = precioFinal;
		this.fechaVenta = fechaVenta;
	}
	
	public Venta() { }

	
	public Integer getIdVenta() { return idVenta; }
	public Integer getIdInmueble() { return idInmueble; }
	public Integer getIdCliente() { return idCliente; }
	public Integer getIdAgente() { return idAgente; }
	public Double getPrecioFinal() { return precioFinal; }
	public Date getFechaVenta() { return fechaVenta; }
	
}
