package Interfaces;

import java.util.List;

import Entidades.Usuario;


public interface UsuarioInterface {

	public List<Usuario> listUsuario();
	public Usuario validateUsuario(String email, String password);
	public boolean addUsuario(Usuario usuario);
	public Usuario getUsuario(Integer id);
	public boolean updateUsuario(Usuario usuario);
}
