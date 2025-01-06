package servlets.credits;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.CreditPack;
import beans.Parcelle;
import dao.DaoCrud;

@WebServlet(name = "creditServlet", value = "/credits")
public class CreditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<CreditPack> credits = DaoCrud.getTableData("credit_packs", CreditPack.class);
    	request.setAttribute("items", credits);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/credits/list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}