package servlets.credits;

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
@WebServlet("/delete-credit")
public class DeleteCreditServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id") != null) {
			DaoCrud.delete("credit_packs", "id", request.getParameter("id"));
		}
		
		
		response.sendRedirect(request.getContextPath() + "/credits");
	}


}