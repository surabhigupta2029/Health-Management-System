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
	String username = "";

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

		String username = request.getParameter("username");

		try {

			String reqDay = "";
			Connection conn = medManager.getConnection();
			Statement st = conn.createStatement();

			// get record for this username only
			String regQuery = "SELECT * FROM REGISTRATIONTWO where username=" + username;
			ResultSet as = st.executeQuery(regQuery);
			List<String> idList = new ArrayList<String>();

			System.out.println("1 iddd while " + username);
			// pick Medication Ids for this username
			while (as.next()) {
				String m = as.getString("M1");
				if (!as.wasNull()) { idList.add(m); }
				m = as.getString("M2");
				if (!as.wasNull()) { idList.add(m); }
				m = as.getString("M3");
				if (!as.wasNull()) { idList.add(m); }
			}

			System.out.println("iddd " + idList);

			//From medtable pick the exact records for this patient
			//check -
			String medQuery = "SELECT * FROM MEDTABLE";
			ResultSet rs = st.executeQuery(medQuery);
			TreeMap<Integer, List<MedicationBean>> result = new TreeMap<Integer, List<MedicationBean>>();
			List<MedicationBean> medList = new ArrayList<MedicationBean>();
			int idKey = 1;

			while (rs.next()) {
				reqDay = rs.getString("day");
				String reqID = rs.getString("id");
				if (reqDay.equals(day)) {
					if (idList.contains(reqID)) {
						MedicationBean medDetails = new MedicationBean();
						medDetails.setID(rs.getString("id"));
						medDetails.setMedicationName(rs.getString("medicationName"));
						medDetails.setDose(rs.getString("dose"));
						medDetails.setTime(rs.getString("time"));
						medDetails.setNotes(rs.getString("notes"));
						medList.add(medDetails);
						result.put(idKey, medList);
						idKey++;
					}
				}

			}

			request.setAttribute("data", result);
			RequestDispatcher rd = request.getRequestDispatcher("medForm.jsp");
			rd.forward(request, response);

			conn.close(); // tbd

			// response.getWriter().append("Served at: ").append(request.getContextPath());

		} catch (Exception e) {

			System.err.println("Med Manager Got an exception! ");
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
		username = request.getParameter("username");

//		if (medicationName.isEmpty() || dose.isEmpty() || time.isEmpty() || notes.isEmpty() | day.isEmpty()) {
//			RequestDispatcher req = request.getRequestDispatcher("medicationNote.jsp");
//			req.include(request, response);
//		} else {
			Statement stmt = null;
			Connection c = null;
			c = medManager.getConnection();

			try {
				//System.out.println("1 Hello it is ");
				stmt = c.createStatement();
				stmt.executeUpdate(
						"INSERT INTO MEDTABLE (medicationName, dose, time, day, notes) " + "VALUES ('" + medicationName
								+ "'," + dose + "," + time + ",'" + day + "','" + notes + "')",
						Statement.RETURN_GENERATED_KEYS);

				// get the ID of the row in medtable where insert took place.
				ResultSet tmpR = stmt.getGeneratedKeys();
				int medId = 0;
				if (tmpR.next()) {
					medId = tmpR.getInt(1);
				}

				// insert this id in REGISTRATIONTWO table
				// String username = (String) request.getAttribute("username");
				//System.out.println("2 hello it is " + username + " " + medId);
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username=" + username;

				ResultSet tmpR2 = stmt.executeQuery(query);

				// find the empty medicine column for this user. there will be only one row for
				// this user.
				String updateString = "";
				if (tmpR2.next()) {
					if (tmpR2.getString("M1") == null) {
						updateString = "M1=" + medId;
					} else if (tmpR2.getString("M2") == null) {
						updateString = "M2=" + medId;
					} else if (tmpR2.getString("M3") == null) {
						updateString = "M3=" + medId;
					}
				}

				// execute update command to insert this medication id in the registrationtwo
				// table.
				stmt.executeUpdate("UPDATE REGISTRATIONTWO SET " + updateString + " WHERE username='" + username + "'");

				/*
				 * int i = 0; while (tmpR.next()) { i += 1; System.out.println("2 Hello it is "
				 * + tmpR.getInt(i)); }
				 */

				// stmt = c.createStatement();
				// ResultSet tmpRs = stmt.executeQuery("SELECT LAST_INSERT_ID() as last_id");
				// System.out.println("3 Hello it is " + tmpRs.getString("last_id"));
				c.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher req = request.getRequestDispatcher("dashboard.jsp");
			req.forward(request, response);
		}
	//}

}
