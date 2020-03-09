package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.Usuario;

public class UsuarioDAO {
	public Usuario validar(String nombre,String password){
		String sql="select idUsuario,nombrecompleto,sexo,telefono,email,estatus,tipo,password from usuarios where estatus='A' and email=? and password=?";
		Usuario u=new Usuario();
		try{
			PreparedStatement ps=ConexionBD.getInstance().getCn().prepareStatement(sql);
			ps.setString(1, nombre);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				u.setId(rs.getInt("idUsuario"));
				u.setNombre(rs.getString("nombrecompleto"));
				u.setSexo(rs.getString("sexo"));
				u.setTelefono(rs.getString("telefono"));
				u.setEmail(rs.getString("email"));
				u.setEstatus(rs.getString("estatus"));
				u.setTipo(rs.getString("tipo"));
				u.setPassword(rs.getString("password"));
			}
			ps.close();
			rs.close();
			ConexionBD.getInstance().cerrar();
		}
		catch(SQLException e){
			System.out.println("Error al ejecutar la consulta:"+e.getMessage());
		}
		return u;
	}
}
