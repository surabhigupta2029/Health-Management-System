package projectFiles;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class AppointmentManager extends HttpServlet {

	/**
	 * Class: AppointmentManager.java Purpose: Used to manage the appointments using
	 * doGet() and doPost() HTTP methods to respectively get appointment entries and
	 * post appointment entries from database.
	 */

	private static final long serialVersionUID = 1L;
	DBManager appManager = new DBManager();
	String username = "";
	TreeMap<Integer, String> appTimeTypeMap = new TreeMap<Integer, String>();
	int id = 1;
	int appId = 0;
	String meridian = "";
	String first = "";
	String email = "";
	String contact = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppointmentManager() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      This method will be used to retrieve information from the database
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appDay = "";

		// Get parameter for the day button clicked in dashboard
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
		} else if (request.getParameter("Email") != null) {
			appDay = "Email";
		}
		String username = request.getParameter("username");

		List<AppointmentBean> appList = new ArrayList<AppointmentBean>();
		TreeMap<String, List<AppointmentBean>> appMap;
		try {

			String reqDay = "";

			// Get record for this username only
			String appQuery = "SELECT * FROM REGISTRATIONTWO where username= '" + username + "'";
			ResultSet as = appManager.stmt.executeQuery(appQuery);
			List<String> idList = new ArrayList<String>();
			if (as.next()) {
				reqDay = "";
			}
			String destEmail = as.getString("emailaddress");

			// Retrieving appointment IDs and splitting to create array
			String a = as.getString("A1");
			String[] splitArr = a.split(",");
			idList = Arrays.asList(splitArr);

			// From apptable pick the exact records for this patient
			// check -
			String query = "SELECT * FROM APPTABLE";
			ResultSet rs = appManager.stmt.executeQuery(query);
			appMap = new TreeMap<String, List<AppointmentBean>>();

			// While a record exists, find the medication ntoe details and store in a
			// treeMap
			while (rs.next()) {
				reqDay = rs.getString("day");
				String reqID = rs.getString("id");
				if (reqDay.toLowerCase().equals(appDay.toLowerCase())) {
					if (idList.contains(reqID)) {
						AppointmentBean appDetail = new AppointmentBean();
						appDetail.setAppName(rs.getString("appName"));
						appDetail.setTiming(rs.getString("timing"));
						appDetail.setNotes(rs.getString("notes"));
						appDetail.setMeridian(rs.getString("meridian"));
						appList.add(appDetail);
						appMap.put(rs.getString("id"), appList);
					}
				}
				request.setAttribute("emailAlert", "no");

			}

			// If user input is "Email", then start process of creating email
			if (appDay.equals("Email")) {
				int idx = 0;
				TreeMap<Integer, List<AppointmentBean>> emailMap = new TreeMap<Integer, List<AppointmentBean>>();
				List<AppointmentBean> emailList = new ArrayList<AppointmentBean>();
				ResultSet e = appManager.stmt.executeQuery(query);
				while (e.next()) {
					reqDay = e.getString("day");
					String reqID = e.getString("id");
					if (idList.contains(reqID)) {
						AppointmentBean appDetails = new AppointmentBean();
						String medTime = e.getString("timing");
						appDetails.setAppName(e.getString("appName"));
						appDetails.setMeridian(e.getString("meridian"));
						appDetails.setTiming(e.getString("timing"));
						appDetails.setNotes(e.getString("notes"));
						appDetails.setDay(reqDay);
						emailList.add(appDetails);
						emailMap.put(Integer.parseInt(reqID), emailList);
					}
				}
				// Creating the string to pass in email body
				String pass = "";
				for (Map.Entry<Integer, List<AppointmentBean>> entry : emailMap.entrySet()) {
					pass += ("\n ------------------------------------- \n" + "Day: "
							+ entry.getValue().get(idx).getDay() + "\n" + "Appointment: "
							+ entry.getValue().get(idx).getAppName() + "\n" + "Time:  "
							+ entry.getValue().get(idx).getTiming() + entry.getValue().get(idx).getMeridian() + "\n"
							+ "Notes: " + entry.getValue().get(idx).getNotes());
					idx++;
				}
				// Recipient's email ID needs to be mentioned.
				String to = destEmail;

				// Assuming you are sending email from localhost
				String host = "smtp.gmail.com";

				// Get system properties object
				Properties properties = System.getProperties();

				// Setup mail server
				properties.setProperty("mail.transport.protocol", "smtp");
				properties.put("mail.smtp.host", host);
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.smtp.port", "587");
				properties.put("mail.smtp.starttls.enable", "true");

				// Get the default Session object.
				Session mailSession = Session.getDefaultInstance(properties, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("contactcare4today@gmail.com", "risvbrmjmvhmqybb");
					}
				});

				try {
					// Create a default MimeMessage object.
					MimeMessage message = new MimeMessage(mailSession);

					// Set From: header field of the header.
					message.setFrom(new InternetAddress("contactcare4today@gmail.com"));

					// Set To: header field of the header.
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					
					// Set Subject: header field
					message.setSubject("Care4Today: Appointments List!");

					// Now set the actual message
					message.setText("Hello! Care4Today has sent you your latest appointments list:" + pass
							+ "\n\n\nHope you have a great day!\nThe Care4Today Team");

					// Send message
					Transport.send(message);
					request.setAttribute("emailAlert", "yes");
				} catch (MessagingException mex) {
					mex.printStackTrace();
				}
			}
			// Forwarding the treemap and then redirecting back
			request.setAttribute("appData", appMap);
			RequestDispatcher rd = request.getRequestDispatcher("appDisplay.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			System.err.println(" App Manager Got an exception! ");
			System.err.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      This method will be used to post data into the database
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appName = request.getParameter("appName");
		String time = request.getParameter("timing");
		String day = request.getParameter("day");
		String notes = request.getParameter("notes");
		username = request.getParameter("username");

		// Splitting time parameter to read hours and minutes
		String[] delimitedStr = time.split(":");
		String hours = delimitedStr[0];
		int hoursInt = Integer.parseInt(hours);
		String minutes = delimitedStr[1];
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

		// If any of the input field are empty, then refresh the page to refill
		if (appName.isEmpty() || time.isEmpty() || notes.isEmpty() || day.isEmpty() || day.matches(".*\\d.*")) {
			request.setAttribute("appointmentAlert", "no");
			RequestDispatcher req = request.getRequestDispatcher("appNote.jsp");
			req.include(request, response);
		} else {

			try {
				appManager.stmt.executeUpdate(
						"INSERT INTO APPTABLE (appName, timing, day, notes, meridian) " + "VALUES ('" + appName + "',"
								+ time + ",'" + day + "','" + notes + "','" + meridian + "')",
						Statement.RETURN_GENERATED_KEYS);
				ResultSet tmpR = appManager.stmt.getGeneratedKeys();
				if (tmpR.next()) {
					// Get the ID of the row in apptable where insert took place.
					appId = tmpR.getInt(1);
				}

				// Using username to select user specific details
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username ='" + username + "'";

				ResultSet tmpR2 = appManager.stmt.executeQuery(query);

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
				updateString = tmpR2.getString("A1") + appId + ",";

				// Execute update command to insert this medication id in the registrationtwo
				// table.
				appManager.stmt.executeUpdate(
						"UPDATE REGISTRATIONTWO SET A1 = '" + updateString + "'  WHERE username ='" + username + "'");

				tmpR2.close();
				tmpR.close();
				request.setAttribute("appTimeTypeMap", appTimeTypeMap);
				response.sendRedirect("dashboard.jsp?first=" + first + "&email=" + email + "&contact=" + contact
						+ "&username=" + username);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
