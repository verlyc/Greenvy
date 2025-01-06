package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.Abonnement;
import beans.User;
import dao.DaoCrud;

@WebServlet(name = "gardenerServlet", value = "/gardeners")
public class GardenerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


    	List<User> jardiniers = DaoCrud.getTableData("users", User.class);
    	request.setAttribute("items", jardiniers);
    	
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/gardeners/list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}