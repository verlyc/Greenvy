package servlets.parcelles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import beans.Parcelle;
import dao.DaoCrud;

@WebServlet(name = "parcelleServlet", value = "/parcelles")
public class ParcelleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public void init(){
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	List<Parcelle> parcelles = DaoCrud.getTableData("parcelles", Parcelle.class);
    	request.setAttribute("items", parcelles);
    	

        this.getServletContext().getRequestDispatcher("/WEB-INF/pages/parcelles/list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}