package servlets.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.Abonnement;
import beans.CreditPack;
import beans.Parcelle;
import beans.Tool;
import beans.UserAbonnement;
import beans.UserTool;
import dao.DaoCrud;
import helper.Utils;

/**
 * Servlet implementation class AbonnementFormServelet
 */
@WebServlet("/rent-tool")
public class RentToolFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Tool> tools = DaoCrud.getTableData("tools", Tool.class);
		request.setAttribute("tools", tools);

		this.getServletContext().getRequestDispatcher("/WEB-INF/pages/dashboard/rent-form.jsp").forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			UserTool item = new UserTool();
			item.setTool_id(Integer.valueOf(request.getParameter("tool")));
			item.setMonths(Integer.valueOf(request.getParameter("months")));
			item.setUser_id(Utils.getCOnnectedUser(request).getId());
			DaoCrud.save("user_tools", item);

			Tool tool = DaoCrud.getRecordById("tools", Tool.class, Integer.valueOf(request.getParameter("tool")));
			tool.setIsAvailable(false);
			DaoCrud.update("tools", tool, "id", tool.getId());

			request.setAttribute("success", "Abonnement créée avec succès.");

			response.sendRedirect(request.getContextPath() + "/dashboard");
			// this.getServletContext().getRequestDispatcher("/WEB-INF/pages/abonnements/list.jsp").forward(request,
			// response);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.printStackTrace();
			request.setAttribute("error", "Oups! Une erreur est survenue");
			List<Tool> tools = DaoCrud.getTableData("tools", Tool.class);
			request.setAttribute("tools", tools);


			this.getServletContext().getRequestDispatcher("/WEB-INF/pages/dashboard/rent-form.jsp")
					.forward(request, response);

		}
	}

}
