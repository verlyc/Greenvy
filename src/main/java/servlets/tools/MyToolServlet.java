package servlets.tools;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.Tool;
import beans.User;
import beans.UserTool;
import dao.DaoCrud;
import helper.Utils;

@WebServlet(name = "mytoolServlet", value = "/my-tools")
public class MyToolServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<UserTool> tools = DaoCrud.getTableDataWithCondition("user_tools", UserTool.class, "user_id=" + Utils.getCOnnectedUser(request).getId());
    	request.setAttribute("items", tools);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/tools/my-list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}