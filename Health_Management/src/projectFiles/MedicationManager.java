package projectFiles;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * Class: MedicationManager.java Purpose: Used to manage the medications using
 * doGet() and doPost() HTTP methods to respectively get medications entries and
 * post medication entries from database.
 */

public class MedicationManager extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DBManager medManager = new DBManager();
	String username = "";
	int id = 1;
	int medId = 0;
	String meridian = "";
	String first = "";
	String email = "";
	String contact = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MedicationManager() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      This method will be used to retrieve information from the database
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String day = "";

		// Get parameter for the day button clicked in dashboard
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
		} else if (request.getParameter("Email") != null) {
			day = "Email";
		}

		String username = request.getParameter("username");

		try {

			String reqDay = "";

			// Get record for this username only from the registration table
			String regQuery = "SELECT * FROM REGISTRATIONTWO where username='" + username + "'";
			ResultSet as = medManager.stmt.executeQuery(regQuery);
			List<String> idList = new ArrayList<String>();
			if (as.next()) {
				reqDay = "";
			}

			// Retrieving medication IDs and splitting to create array
			String m = as.getString("M1");
			String[] splitArr = m.split(",");
			idList = Arrays.asList(splitArr);

			// From medtable pick the exact records for this patient
			// check -
			String medQuery = "SELECT * FROM MEDTABLE";
			ResultSet medrs = medManager.stmt.executeQuery(medQuery);
			TreeMap<Integer, List<MedicationBean>> result = new TreeMap<Integer, List<MedicationBean>>();
			List<MedicationBean> medList = new ArrayList<MedicationBean>();
			int idKey = 1;

			// While a record exists, find the medication ntoe details and store in a
			// treeMap
			while (medrs.next()) {
				reqDay = medrs.getString("day");
				String reqID = medrs.getString("id");
				if (reqDay.toLowerCase().equals(day.toLowerCase())) {
					if (idList.contains(reqID)) {
						MedicationBean medDetails = new MedicationBean();
						String medTime = medrs.getString("time");
						medDetails.setID(medrs.getString("id"));
						medDetails.setMedicationName(medrs.getString("medicationName"));
						medDetails.setDose(medrs.getString("dose"));
						medDetails.setMeridian(medrs.getString("meridian"));
						medDetails.setTime(medTime);
						medDetails.setNotes(medrs.getString("notes"));
						medList.add(medDetails);
						result.put(idKey, medList);
						idKey++;
					}
				}

			}

			// Forwarding the treemap and then redirecting back
			request.setAttribute("data", result);
			RequestDispatcher rd = request.getRequestDispatcher("medForm.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			System.err.println("Med Manager Got an exception! ");
			System.err.println(e.getMessage());
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      This method will be used to post data into the database
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String medicationName = request.getParameter("medicationName");
		String dose = request.getParameter("dose");
		String time = request.getParameter("timing");
		String day = request.getParameter("day");
		String notes = request.getParameter("notes");
		username = request.getParameter("username");

		// Splitting time parameter to read hours and minutes
		String[] delimitedStr = time.split(":");
		String hours = delimitedStr[0];
		int hoursInt = Integer.parseInt(hours);
		String minutes = delimitedStr[1];

		// Code to figure out AM or PM time
		if (hoursInt > 12) {
			meridian = "PM";
			hoursInt -= 12;
		} else if (hoursInt < 12) {
			meridian = "AM";
			if (hoursInt == 0) {
				hoursInt = 12;
			}
		} else {
			meridian = "PM";
		}
		hours = hoursInt + "";
		time = hours + minutes;
		if (time.length() == 4) {
			time += "00";
		} else if (time.length() == 3) {
			time = "0" + time + "00";
		}
		// If any of the input field are empty, then refresh the page to refill
		if (medicationName.isEmpty() || dose.isEmpty() || time.isEmpty() || notes.isEmpty() | day.isEmpty()) {
			request.setAttribute("medicationAlert", "no");
			RequestDispatcher req = request.getRequestDispatcher("medicationNote.jsp");
			req.include(request, response);
		} else if (day.matches(".*\\d.*") || !dose.matches(".*\\d.*")
				|| (medicationName.matches(".*\\d.*") && medicationName.length() == 1)) {
			request.setAttribute("medicationAlert", "no");
			RequestDispatcher req = request.getRequestDispatcher("medicationNote.jsp");
			req.include(request, response);
		} else {

			try {
				medManager.stmt.executeUpdate("INSERT INTO MEDTABLE (medicationName, dose, time, day, notes, meridian) "
						+ "VALUES ('" + medicationName + "'," + dose + "," + time + ",'" + day + "','" + notes + "','"
						+ meridian + "')", Statement.RETURN_GENERATED_KEYS);

				ResultSet tmpR = medManager.stmt.getGeneratedKeys();
				medId = 0;
				if (tmpR.next()) {
					// Get the ID of the row in medtable where insert took place.
					medId = tmpR.getInt(1);
				}

				// Using username to select user specific details
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username='" + username + "'";
				ResultSet tmpR2 = medManager.stmt.executeQuery(query);

				String updateString = "";
				if (tmpR2.next()) {
					updateString = "";
				}

				// Retreiving user details for sending to redirected page
				first = tmpR2.getString("first");
				email = tmpR2.getString("emailaddress");
				contact = tmpR2.getString("contact");
				username = tmpR2.getString("username");

				// Creating update string to update in table entry
				updateString = tmpR2.getString("M1") + medId + ",";

				// Execute update command to insert this medication id in the registrationtwo
				// table.
				medManager.stmt.executeUpdate(
						"UPDATE REGISTRATIONTWO SET M1 = '" + updateString + "' WHERE username ='" + username + "'");

				tmpR2.close();
				tmpR.close();
				response.sendRedirect("dashboard.jsp?first=" + first + "&email=" + email + "&contact=" + contact
						+ "&username=" + username);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
