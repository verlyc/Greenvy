package servlets.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import dao.DaoLogin;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init() {}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/auth/login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    	DaoLogin daoLogin = new DaoLogin();
    	
    	try {
    		if(daoLogin.makeLogin(request, response)) {
    			response.sendRedirect(request.getContextPath() + "/dashboard");
    		}else {
    			request.setAttribute("error", "Information de connexion invalide");
    	        this.getServletContext().getRequestDispatcher("/WEB-INF/auth/login.jsp").forward(request, response);
    		}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
    	
    	
    }

    
    public void destroy() {
    }
}