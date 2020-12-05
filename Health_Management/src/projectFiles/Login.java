package projectFiles;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.*;
import java.util.*;

/**
 * Class: Login.java
 * Purpose: Performs doGet() and doPost() methods specifically for login page. 
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBManager lManager = new DBManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		System.out.println(username);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		List<RegistrationBean> list = new ArrayList<RegistrationBean>();

		//Check if they are empty, and alert accordingly
		if (username.isEmpty() || password.isEmpty()) {
			request.setAttribute("loginAlert", "no");
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			req.include(request, response);
		} else {
			try {
				
				//Compare input username and password to the records existing in database
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username='"+username+"'";
				ResultSet rs = lManager.stmt.executeQuery(query);

				while (rs.next()) {
					String usernameDB = rs.getString("username");
					String passwordDB = rs.getString("password");
					//If they are existing, then retreive user details
					if (usernameDB.equals(username) && password.equals(passwordDB)) {
						request.setAttribute("username", username);
						RegistrationBean userDetail = new RegistrationBean();
						userDetail.setFirstName(rs.getString("first"));
						userDetail.setLastName(rs.getString("last"));
						userDetail.setAddress(rs.getString("emailaddress"));
						userDetail.setContact(rs.getString("contact"));

						list.add(userDetail);
						request.setAttribute("list", list);
						request.setAttribute("email", address);
						response.sendRedirect("dashboard.jsp?username=" + username+"&email="+rs.getString("emailaddress")+"&contact="+rs.getString("contact")+"&first="+rs.getString("first"));
						break;
					}
				}
				rs.close();
				RequestDispatcher req = request.getRequestDispatcher("login.jsp");
				req.include(request, response);

			} catch (Exception e) {
				System.err.println("Login Got an exception! ");
				System.err.println(e.getMessage());
			}

		}
	}
}
