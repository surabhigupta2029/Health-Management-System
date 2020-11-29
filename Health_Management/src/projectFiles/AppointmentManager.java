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
	String username = "";

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
		String username = request.getParameter("username");

		List<AppointmentBean> appList = new ArrayList<AppointmentBean>();
		TreeMap<String, List<AppointmentBean>> appMap;
		try {

			String reqDay = "";
			Connection conn = appManager.getConnection();
			Statement st = conn.createStatement();
			
			// get record for this username only
			String appQuery = "SELECT * FROM REGISTRATIONTWO where username=" + username;
			ResultSet as = st.executeQuery(appQuery);
			List<String> idList = new ArrayList<String>();

			// pick Appointment Ids for this username
			while (as.next()) {
				String m = as.getString("A1");
				if (!as.wasNull()) { idList.add(m); }
				m = as.getString("A2");
				if (!as.wasNull()) { idList.add(m); }
				m = as.getString("A3");
				if (!as.wasNull()) { idList.add(m); }
			}

			String query = "SELECT * FROM APPTABLE";
			ResultSet rs = st.executeQuery(query);
			appMap = new TreeMap<String, List<AppointmentBean>>();

			while (rs.next()) {
				reqDay = rs.getString("day");
				String reqID = rs.getString("id");
				if (reqDay.equals(appDay)) {
					if (idList.contains(reqID)) {
					AppointmentBean appDetail = new AppointmentBean();
					appDetail.setAppName(rs.getString("appName"));
					appDetail.setTiming(rs.getString("timing"));
					appDetail.setNotes(rs.getString("notes"));
					appList.add(appDetail);
					appMap.put(rs.getString("id"), appList);
					}
				}

			}

			request.setAttribute("appData", appMap);
			RequestDispatcher rd = request.getRequestDispatcher("appForm.jsp");
			rd.forward(request, response);
			//conn.close(); // tbd

			// response.getWriter().append("Served at: ").append(request.getContextPath());

		} catch (Exception e) {

			System.err.println(" App Manager Got an exception! ");
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
		username = request.getParameter("username");

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
						+ "VALUES ('" + appName + "'," + time + ",'" + day + "','" + notes + "')", Statement.RETURN_GENERATED_KEYS);
				// get the ID of the row in medtable where insert took place.
				ResultSet tmpR = stmt.getGeneratedKeys();
				int appId = 0;
				if (tmpR.next()) {
					appId = tmpR.getInt(1);
				}

				// insert this id in REGISTRATIONTWO table
				// String username = (String) request.getAttribute("username");
				//System.out.println("2 hello it is " + username + " " + appId);
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username=" + username;

				ResultSet tmpR2 = stmt.executeQuery(query);

				// find the empty medicine column for this user. there will be only one row for
				// this user.
				String updateString = "";
				if (tmpR2.next()) {
					if (tmpR2.getString("A1") == null) {
						updateString = "A1=" + appId;
					} else if (tmpR2.getString("A2") == null) {
						updateString = "A2=" + appId;
					} else if (tmpR2.getString("A3") == null) {
						updateString = "A3=" + appId;
					}
				}

				// execute update command to insert this medication id in the registrationtwo
				// table.
				stmt.executeUpdate("UPDATE REGISTRATIONTWO SET " + updateString + " WHERE username='" + username + "'");

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
