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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appDay = "";
		if (request.getParameter("Sunday") != null) {
			appDay = "Sunday";
		} else if (request.getParameter("Monday") != null) {
			appDay = "Monday";
		} else if (request.getParameter("Tuesday") != null) {
			appDay = "Tuesday";
		} else if (request.getParameter("Wednesday") != null) {
			appDay = "Wednesday";
		} else if (request.getParameter("Thursday") != null) {
			appDay = "Thursday";
		} else if (request.getParameter("Friday") != null) {
			appDay = "Friday";
		} else if (request.getParameter("Saturday") != null) {
			appDay = "Saturday";
		}
		
		List<AppointmentBean> appList = new ArrayList<AppointmentBean>();

		try {

			String reqDay = "";
			Connection conn = appManager.getConnection();
			Statement st = conn.createStatement();
			String query = "SELECT * FROM APPTABLE";
			ResultSet rs = st.executeQuery(query);
			TreeMap<String, List<AppointmentBean>> appMap = new TreeMap<String, List<AppointmentBean>>();

			while (rs.next()) {
				reqDay = rs.getString("day");
				if (reqDay.equals(appDay)) {
					AppointmentBean appDetail = new AppointmentBean();
					appDetail.setAppName(rs.getString("appName"));
					appDetail.setTiming(rs.getString("timing"));
					appDetail.setNotes(rs.getString("notes"));
					appList.add(appDetail);
					appMap.put(rs.getString("id"), appList);
				}

			}

			request.setAttribute("appData", appMap);
			RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
			rd.forward(request, response);

			// response.getWriter().append("Served at: ").append(request.getContextPath());

		} catch (Exception e) {

			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
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
