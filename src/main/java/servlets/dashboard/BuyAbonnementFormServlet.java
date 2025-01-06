package servlets.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.Abonnement;
import beans.CreditPack;
import beans.Parcelle;
import beans.Tool;
import beans.UserAbonnement;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class AbonnementFormServelet
 */
@WebServlet("/buy-abonnement")
public class BuyAbonnementFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<Abonnement> abonnements = DaoCrud.getTableData("abonnements", Abonnement.class);
    	request.setAttribute("abonnements", abonnements);
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/dashboard/abonnement-form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		UserAbonnement item = new UserAbonnement();
        	item.setAbonnement_id(Integer.valueOf(request.getParameter("abonnement")));
        	item.setMonths(Integer.valueOf(request.getParameter("months")));
        	item.setUser_id(Utils.getCOnnectedUser(request).getId());
        	DaoCrud.save("user_abonnements", item);
        	Abonnement abonnement = DaoCrud.getRecordById("abonnements", Abonnement.class, Integer.valueOf(request.getParameter("abonnement")));
        	if( abonnement.getType().equals("location")) {
          		Parcelle parcelle = abonnement.getParcelle();
        		parcelle.setIsAvailable(false);
        		DaoCrud.update("parcelles", parcelle, "id", parcelle.getId());
        	}
        				
			request.setAttribute("success", "Abonnement créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/dashboard");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			List<Abonnement> abonnements = DaoCrud.getTableData("abonnements", Abonnement.class);
	    	request.setAttribute("abonnements", abonnements);
	    	
	        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/dashboard/abonnement-form.jsp").forward(request, response);

		}
	}

}
