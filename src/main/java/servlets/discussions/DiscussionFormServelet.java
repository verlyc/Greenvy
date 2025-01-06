package servlets.discussions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.Discussion;
import beans.Parcelle;
import beans.Tool;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class ToolFormServelet
 */
@WebServlet("/discussion-form")
public class DiscussionFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscussionFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("id") != null) {
			Discussion item = DaoCrud.getRecordById("discussions", Discussion.class, Integer.valueOf(request.getParameter("id")));
			request.setAttribute("item", item);
		}
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/discussions/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		Discussion item = new Discussion();
        	item.setName(request.getParameter("name"));
        	item.setAuthor_id(Integer.valueOf(Utils.getCOnnectedUser(request).getId()));
        	item.setDescription(request.getParameter("description"));
			
        	if(request.getParameter("id") != null) {
        		System.out.println("updatind record " + request.getParameter("id"));
        		DaoCrud.update("discussions", item, "id", request.getParameter("id"));
    		}else {
    			System.out.println("creating record " );
    			DaoCrud.save("discussions", item);
    		}
        	
			
			request.setAttribute("success", "Discussion créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/discussions");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/discussions/form.jsp").forward(request, response);

		}
	}

}
