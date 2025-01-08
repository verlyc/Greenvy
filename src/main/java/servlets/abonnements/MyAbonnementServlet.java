package servlets.abonnements;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.Abonnement;
import beans.Parcelle;
import beans.UserAbonnement;
import dao.DaoCrud;
import helper.Utils;

@WebServlet(name = "MyabonnementServlet", value = "/my-abonnements")
public class MyAbonnementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<UserAbonnement> abonnements = DaoCrud.getTableDataWithCondition("user_abonnements", UserAbonnement.class, "user_id=" + Utils.getCOnnectedUser(request).getId());
    	request.setAttribute("items", abonnements);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/my-list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}