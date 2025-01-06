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
import beans.User;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class AbonnementFormServelet
 */
@WebServlet("/buy-credits")
public class BuyCreditFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<CreditPack> packs = DaoCrud.getTableData("credit_packs", CreditPack.class);
    	request.setAttribute("packs", packs);
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/dashboard/credit-form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		User user = Utils.getCOnnectedUser(request);
    		CreditPack pack = DaoCrud.getRecordById("credit_packs", CreditPack.class, Integer.valueOf(request.getParameter("pack")));
        	user.setCredit_balance( user.getCredit_balance() + pack.getCredits());
    		DaoCrud.update("users", user, "id", user.getId());
		
			request.setAttribute("success", "Abonnement créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/dashboard");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/form.jsp").forward(request, response);

		}
	}

}
