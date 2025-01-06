package servlets.discussions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.Discussion;
import beans.Message;
import beans.Parcelle;
import beans.Tool;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class ToolFormServelet
 */
@WebServlet("/message-form")
public class MessageFormServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageFormServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("discussion_id") != null) {
			Discussion item = DaoCrud.getRecordById("discussions", Discussion.class, Integer.valueOf(request.getParameter("discussion_id")));
			request.setAttribute("discussion", item);
		}
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/discussions/message-form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	try {
    		Message item = new Message();
        	item.setMessage(request.getParameter("message"));
        	item.setAuthor_id(Integer.valueOf(Utils.getCOnnectedUser(request).getId()));
        	item.setDiscussion_id(Integer.valueOf(request.getParameter("discussion")));
        	
			
        	DaoCrud.save("messages", item);
			
			request.setAttribute("success", "Message créée avec succès.");
			
			response.sendRedirect(request.getContextPath() + "/message-form?discussion_id=" + request.getParameter("discussion"));
			//this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/list.jsp").forward(request, response);
    	}catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/discussions/message-form.jsp").forward(request, response);

		}
	}

}
