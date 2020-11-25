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

public class MedicationManager extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DBManager medManager = new DBManager();

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
		String day = "";
		if (request.getParameter("Sunday") != null) {
			day = "Sunday";
		} else if (request.getParameter("Monday") != null) {
			day = "Monday";
		} else if (request.getParameter("Tuesday") != null) {
			day = "Tuesday";
		} else if (request.getParameter("Wednesday") != null) {
			day = "Wednesday";
		} else if (request.getParameter("Thursday") != null) {
			day = "Thursday";
		} else if (request.getParameter("Friday") != null) {
			day = "Friday";
		} else if (request.getParameter("Saturday") != null) {
			day = "Saturday";
		}
		try {

			String reqDay = "";
			Connection conn = medManager.getConnection();
			Statement st = conn.createStatement();
			String query = "SELECT * FROM MEDTABLE";
			ResultSet rs = st.executeQuery(query);
			TreeMap<Integer, List<String>> result = new TreeMap<Integer, List<String>>();
			List<String> listArg = new ArrayList<String>();
			int idKey = 1;

			while (rs.next()) {
				reqDay = rs.getString("day");
				if (reqDay.equals(day)) {
					listArg.add(rs.getString("id"));
					listArg.add(rs.getString("medicationName"));
					listArg.add(rs.getString("dose"));
					listArg.add(rs.getString("time"));
					listArg.add(rs.getString("notes"));
					result.put(idKey, listArg);
					idKey++;
				}

			}

			request.setAttribute("data", result);
			RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
			rd.forward(request, response);

			// response.getWriter().append("Served at: ").append(request.getContextPath());

		} catch (Exception e) {

			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	int id = 1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String medicationName = request.getParameter("medicationName");
		String dose = request.getParameter("dose");
		String time = request.getParameter("timing");
		String day = request.getParameter("day");
		String notes = request.getParameter("notes");

		if (medicationName.isEmpty() || dose.isEmpty() || time.isEmpty() || notes.isEmpty() | day.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("medicationNote.jsp");
			req.include(request, response);
		} else {
			Statement stmt = null;
			Connection c = null;
			c = medManager.getConnection();

			try {
				stmt = c.createStatement();
				stmt.executeUpdate("INSERT INTO MEDTABLE (medicationName, dose, time, day, notes) "
						+ "VALUES ('" + medicationName + "'," + dose + "," + time + ",'" + day + "','" + notes + "')");
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
