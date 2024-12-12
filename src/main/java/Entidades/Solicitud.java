package Entidades;

import java.util.Date;

public class Solicitud {

	private Integer idSolicitud, idCliente, idInmueble;
	private String mensaje, estado;
	private Date fechaSolicitud;
	public Solicitud(Integer idSolicitud, Integer idCliente, Integer idInmueble, String mensaje, String estado, Date fechaSolicitud) {
		this.idSolicitud = idSolicitud;
		this.idCliente = idCliente;
		this.idInmueble = idInmueble;
		this.mensaje = mensaje;
		this.estado = estado;
		this.fechaSolicitud = fechaSolicitud;
	}
	
	public Solicitud() { }

	
	public Integer getIdSolicitud() { return idSolicitud; }
	public Integer getIdCliente() { return idCliente; }
	public Integer getIdInmueble() { return idInmueble; }
	public String getMensaje() { return mensaje; }
	public String getEstado() { return estado; }
	public Date getFechaSolicitud() { return fechaSolicitud; }
	
}
