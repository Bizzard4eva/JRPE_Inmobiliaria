package Interfaces;

import java.util.List;

import Entidades.Usuario;


public interface UsuarioInterface {

	public List<Usuario> listUsuario();
	public Usuario getUsuario(Integer id);
	public boolean addUsuario(Usuario usuario);
	public boolean updateUsuario(Usuario usuario);
}
