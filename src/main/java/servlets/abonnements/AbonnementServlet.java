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
import dao.DaoCrud;

@WebServlet(name = "abonnementServlet", value = "/abonnements")
public class AbonnementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<Abonnement> abonnements = DaoCrud.getTableData("abonnements", Abonnement.class);
    	request.setAttribute("items", abonnements);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}