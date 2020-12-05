package projectFiles;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class: regCheck.java Purpose: To check the registration details. Has a
 * doPost() method to post user's details if they are valid and not empty.
 */

public class regCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBManager rManager = new DBManager();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Retrieve input from the page
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");

		// Check if any field is empty. Raise Alert, and then refresh.
		if (first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || password.isEmpty() || address.isEmpty()
				|| contact.isEmpty()) {
			request.setAttribute("alertMessage", "no");
			RequestDispatcher req = request.getRequestDispatcher("register.jsp");
			req.include(request, response);
		} else {

			// Check for if username entered already exists
			boolean isPresent = false;
			String existsQuery = "SELECT EXISTS(SELECT 1 FROM REGISTRATIONTWO WHERE username = '" + username + "')";
			try {
				ResultSet resultSet = rManager.stmt.executeQuery(existsQuery);
				if (resultSet.next()) {
					// If getInt() == 1, there is an exact record already existing
					if (resultSet.getInt(1) == 1) {
						isPresent = true;
						request.setAttribute("alertMessage", "no");
						resultSet.close();
						RequestDispatcher req = request.getRequestDispatcher("register.jsp");
						req.forward(request, response);

					} else {
						isPresent = false;
					}
				}
			} catch (SQLException e1) {
				request.setAttribute("alertMessage", "no");
				RequestDispatcher req = request.getRequestDispatcher("register.jsp");
				req.forward(request, response);
				e1.printStackTrace();
			}

			// Check if information entered is of valid type
			boolean isValid = false;
			if (address.contains("@")) {
				if (contact.length() == 10) {
					if (username.length() >= 5 && password.length() >= 5) {
						isValid = true;
					} else {
						request.setAttribute("alertMessage", "no");
						RequestDispatcher req = request.getRequestDispatcher("register.jsp");
						req.forward(request, response);
					}
				} else {
					request.setAttribute("alertMessage", "no");
					RequestDispatcher req = request.getRequestDispatcher("register.jsp");
					req.forward(request, response);
				}

			} else {
				isValid = false;
				request.setAttribute("alertMessage", "no");
				RequestDispatcher req = request.getRequestDispatcher("register.jsp");
				req.forward(request, response);

			}

			if (isPresent == true && isValid == false) {
				RequestDispatcher req = request.getRequestDispatcher("register.jsp");
				req.forward(request, response);
			}

			// Only if details entered are not existing and of valid type, proceed to insert
			// in database
			if (isPresent == false && isValid == true) {
				try {
					rManager.stmt.executeUpdate(
							"INSERT INTO REGISTRATIONTWO (first, last, emailaddress, username, password, contact) "
									+ "VALUES ('" + first_name + "', '" + last_name + "','" + address + "','" + username
									+ "','" + password + "'," + contact + ")");

					// After successful Registration, user is redirected to dashboard.
					response.sendRedirect("dashboard.jsp?first=" + first_name + "&email=" + address + "&contact="
							+ contact + "&username=" + username);

				} catch (SQLException e) {
					request.setAttribute("alertMessage", "no");
					RequestDispatcher req = request.getRequestDispatcher("register.jsp");
					e.printStackTrace();
				}

			}
		}
	}
} // end of class
