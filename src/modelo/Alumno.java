package modelo;

public class Alumno {
	String noControl;
	int semestre;
	Carrera carrera;
	Usuario usuario;
	public String getNoControl() {
		return noControl;
	}
	public void setNoControl(String noControl) {
		this.noControl = noControl;
	}
	public int getSemestre() {
		return semestre;
	}
	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	public Carrera getCarrera() {
		return carrera;
	}
	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
