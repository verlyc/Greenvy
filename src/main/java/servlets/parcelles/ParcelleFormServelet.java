package servlets.parcelles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import beans.Parcelle;
import beans.User;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class ParcelleFormServelet
 */
@WebServlet("/parcelle-form")
public class ParcelleFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParcelleFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id") != null) {
			Parcelle item = DaoCrud.getRecordById("parcelles", Parcelle.class, Integer.valueOf(request.getParameter("id")));
			request.setAttribute("item", item);
		}
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/parcelles/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		Parcelle item = new Parcelle();
        	item.setName(request.getParameter("name"));
        	item.setSurface(Double.valueOf(request.getParameter("surface")));
        	item.setAddress(request.getParameter("address"));
			
        	if(request.getParameter("id") != null) {
        		System.out.println("updatind record " + request.getParameter("id"));
        		DaoCrud.update("parcelles", item, "id", request.getParameter("id"));
    		}else {
    			System.out.println("creating record " );
    			DaoCrud.save("parcelles", item);
    		}
        	
			
			request.setAttribute("success", "Parcelle créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/parcelles");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/parcelles/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/parcelles/form.jsp").forward(request, response);

		}
	}

}
