package servlets.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import beans.User;
import dao.DaoCrud;
import helper.Utils;

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/auth/register.jsp").forward(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    	
    	try {
    		User user = new User();
        	user.setName(request.getParameter("name"));
        	user.setUsername(request.getParameter("username"));
        	user.setRole("gardener");
        	user.setExperience(request.getParameter("experience"));
        	user.setCultures(request.getParameter("cultures"));
			user.setPassword(Utils.hashPassword(request.getParameter("password")));
			
			DaoCrud.save("users", user);
			request.setAttribute("success", "Inscription effectuée avec succès.");
			request.getRequestDispatcher("/WEB-INF/auth/login.jsp").forward(request, response);
		} catch (NoSuchAlgorithmException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/auth/register.jsp").forward(request, response);

		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/auth/register.jsp").forward(request, response);

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/auth/register.jsp").forward(request, response);

		}
    	
    	
    }

    
    public void destroy() {
    }
}