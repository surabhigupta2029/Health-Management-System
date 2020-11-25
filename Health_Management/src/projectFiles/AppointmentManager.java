package projectFiles;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

public class AppointmentManager extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	DBManager appManager = new DBManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppointmentManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response, String day)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appName = request.getParameter("appName");
		String time = request.getParameter("timing");
		String day = request.getParameter("day");
		String notes = request.getParameter("notes");
		
		if (appName.isEmpty() || time.isEmpty() || notes.isEmpty() | day.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("appNote.jsp");
			req.include(request, response);
		}
		else {
			Statement stmt = null;
			Connection c = null;
			c = appManager.getConnection();

			try {
				stmt = c.createStatement();
				stmt.executeUpdate("INSERT INTO APPTABLE (appName, timing, day, notes) "
						+ "VALUES ('" + appName + "'," + time + ",'" + day + "','" + notes + "')");
				c.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher req = request.getRequestDispatcher("dashboard.jsp");
			req.forward(request, response);
		}

	}
}
