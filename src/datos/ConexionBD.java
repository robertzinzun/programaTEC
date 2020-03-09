package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	private String url="jdbc:mysql://localhost:3306/programatec?characterEncoding=utf8";
	private String user="concurso";
	private String password="Pr0gr4maT3c";
	static ConexionBD conexion=null;
	private Connection cn=null;
	private ConexionBD(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection(url,user,password);
		}
		catch(SQLException e){
			System.out.println("Error al conectar con la BD:"+e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("No se encuentra registrado el Driver de MySQL:"+e.getMessage());
		}
	}
	public static ConexionBD getInstance(){
		if(conexion==null){
			conexion=new ConexionBD();
		}
		return conexion;
	}
	public Connection getCn(){
		return cn;
	}
	public void cerrar(){
		try{
			cn.close();
			conexion=null;
		}
		catch(SQLException e){
			System.out.println("Error al cerrar la conexion con la BD:"+e.getMessage());
		}
	}
}
