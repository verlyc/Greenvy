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
import beans.Tool;
import dao.DaoCrud;

/**
 * Servlet implementation class AbonnementFormServelet
 */
@WebServlet("/abonnement-form")
public class AbonnementFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbonnementFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id") != null) {
			Abonnement item = DaoCrud.getRecordById("abonnements", Abonnement.class, Integer.valueOf(request.getParameter("id")));
			request.setAttribute("item", item);
		}

    	List<Parcelle> parcelles = DaoCrud.getTableData("parcelles", Parcelle.class);
    	request.setAttribute("parcelles", parcelles);
    	List<Tool> tools = DaoCrud.getTableData("tools", Tool.class);
    	request.setAttribute("tools", tools);
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		Abonnement item = new Abonnement();
        	item.setName(request.getParameter("name"));
        	item.setPrice(Integer.valueOf(request.getParameter("price")));
        	item.setCondition(request.getParameter("access_condition"));
        	item.setParcelle_id(Integer.valueOf(request.getParameter("parcelle_id")));
        	item.setTool_id(Integer.valueOf(request.getParameter("tool_id")));
        	item.setDescription(request.getParameter("description"));
        	item.setType(request.getParameter("type"));
			
        	if(request.getParameter("id") != null) {
        		System.out.println("updatind record " + request.getParameter("id"));
        		DaoCrud.update("abonnements", item, "id", request.getParameter("id"));
    		}else {
    			System.out.println("creating record " );
    			DaoCrud.save("abonnements", item);
    		}
        	
			
			request.setAttribute("success", "Abonnement créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/abonnements");
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
