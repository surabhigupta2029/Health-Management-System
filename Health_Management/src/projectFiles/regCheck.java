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

public class regCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBManager rManager = new DBManager();
	String dbname = "REGISTRATION";
	/*String sql = "CREATE TABLE " + dbname + " " +
            "(id INTEGER not NULL, " +
            " first VARCHAR(255), " + 
            " last VARCHAR(255), " + 
            " username VARCHAR(25), " +
            " password VARCHAR(25), " +
            " address INTEGER, " +
            " contact INTEGER, " +
            " PRIMARY KEY ( id ))"; 
   */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");

		regMember member = new regMember(first_name, last_name, username, password, address, contact);
		//check if any field is empty. Raise Alert.
		if (first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || password.isEmpty() || address.isEmpty()
				|| contact.isEmpty()) {
			request.setAttribute("alertMessage", "no");
			RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
			req.include(request, response);
		} else {
			//rManager.createTable(sql, member);
			//String result = rManager.insert(member);
			Statement stmt = null;
			Connection c = null;
			c = rManager.getConnection();

			boolean ispresent = false;
			String existsQuery = "SELECT EXISTS(SELECT 1 FROM REGISTRATIONTWO WHERE username = '" + username + "')";
			try {
				stmt = c.createStatement();
		        ResultSet resultSet = stmt.executeQuery(existsQuery);
		        if(resultSet.next()){
		        	System.out.println("Exists = " + resultSet.getInt(1));
		            ispresent = true;
		        }else{
		        	ispresent = false;
		        	request.setAttribute("alertMessage", "no");
					RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
		        }
			} catch (SQLException e1) {
				request.setAttribute("alertMessage", "no");
				RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				stmt = c.createStatement();
				stmt.executeUpdate("INSERT INTO REGISTRATIONTWO (first, last, emailaddress, username, password, contact) "
						+ "VALUES ('" + first_name + "', '" + last_name + "','" + address + "','" + username + "','" + password + "'," + contact + ")");
				c.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				request.setAttribute("alertMessage", "no");
				RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
				e.printStackTrace();
			}
			//After successful Registration, User needs to login. Go to login page.
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			req.forward(request, response);
//			try {
//				rManager.insert(member);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			//rManager.print();
			//response.getWriter().print(result);
		}
	}
} // end of class
