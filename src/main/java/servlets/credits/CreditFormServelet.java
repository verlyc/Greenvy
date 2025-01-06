package servlets.credits;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import beans.CreditPack;
import beans.User;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class CreditPackFormServelet
 */
@WebServlet("/credit-form")
public class CreditFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id") != null) {
			CreditPack item = DaoCrud.getRecordById("credit_packs", CreditPack.class, Integer.valueOf(request.getParameter("id")));
			request.setAttribute("item", item);
		}
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/credits/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		CreditPack item = new CreditPack();
        	item.setName(request.getParameter("name"));
        	item.setCredits(Integer.valueOf(request.getParameter("credits")));
        	item.setPrice(Double.valueOf(request.getParameter("price")));
			
        	if(request.getParameter("id") != null) {
        		System.out.println("updatind record " + request.getParameter("id"));
        		DaoCrud.update("credit_packs", item, "id", request.getParameter("id"));
    		}else {
    			System.out.println("creating record " );
    			DaoCrud.save("credit_packs", item);
    		}
        	
			
			request.setAttribute("success", "CreditPack créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/credits");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/credits/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/credits/form.jsp").forward(request, response);

		}
	}

}
