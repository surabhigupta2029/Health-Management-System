package projectFiles;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MedicationManager extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	     * @see HttpServlet#HttpServlet()
	     */
	    public MedicationManager() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String medicationName = request.getParameter("medicationName");
		String dose = request.getParameter("dose");
		String time = request.getParameter("timing");


		if (medicationName.isEmpty() || dose.isEmpty()|| time.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("medicationNote.jsp");
			req.include(request, response);
		} else {
			RequestDispatcher req = request.getRequestDispatcher("dashboard.jsp");
			req.forward(request, response);
		}
	}

}
