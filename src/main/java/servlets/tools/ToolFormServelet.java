package servlets.tools;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import beans.Tool;
import dao.DaoCrud;

/**
 * Servlet implementation class ToolFormServelet
 */
@WebServlet("/tool-form")
public class ToolFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToolFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id") != null) {
			Tool item = DaoCrud.getRecordById("tools", Tool.class, Integer.valueOf(request.getParameter("id")));
			request.setAttribute("item", item);
		}
		
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		Tool item = new Tool();
        	item.setName(request.getParameter("name"));
        	item.setCredits(Integer.valueOf(request.getParameter("credits")));
        	item.setDescription(request.getParameter("description"));
			
        	if(request.getParameter("id") != null) {
        		System.out.println("updatind record " + request.getParameter("id"));
        		DaoCrud.update("tools", item, "id", request.getParameter("id"));
    		}else {
    			System.out.println("creating record " );
    			DaoCrud.save("tools", item);
    		}
        	
			
			request.setAttribute("success", "Tool créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/tools");
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/form.jsp").forward(request, response);

		}
	}

}
