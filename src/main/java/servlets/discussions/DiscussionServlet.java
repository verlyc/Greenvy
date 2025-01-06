package servlets.discussions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.Discussion;
import beans.Tool;
import dao.DaoCrud;

@WebServlet(name = "discussionServlet", value = "/discussions")
public class DiscussionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<Discussion> tools = DaoCrud.getTableData("discussions", Discussion.class);
    	request.setAttribute("items", tools);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/discussions/list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}