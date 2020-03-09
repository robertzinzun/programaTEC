package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datos.UsuarioDAO;
import modelo.Usuario;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(name = "Acceso", urlPatterns = { "/Acceso" })
public class Acceso extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Acceso() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String op=request.getParameter("op");
		UsuarioDAO udao=new UsuarioDAO();
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		HttpSession sesion=request.getSession();
		switch(op){
			case "l":
				String nombre=request.getParameter("email");
				String password=request.getParameter("password");
				Usuario u=udao.validar(nombre, password);
				if(u.getNombre()!=null){
					rd=request.getRequestDispatcher("jsp/comunes/principal.jsp");
					//sesion.setAttribute("conexion", bd);
					sesion.setAttribute("usuario", u);
					sesion.setMaxInactiveInterval(10*60); 
				}
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
