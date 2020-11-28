package projectFiles;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class login
 */
//@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBManager lManager = new DBManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
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
		//String first_name = request.getParameter("first_name");
		//String last_name = request.getParameter("last_name");
		//String address = request.getParameter("address");
		//String contact = request.getParameter("contact");
		// System.out.println("in login.java");
		List<RegistrationBean> list = new ArrayList<RegistrationBean>();

		//check if they are empty
		if (username.isEmpty() || password.isEmpty()) {
			request.setAttribute("loginAlert", "no");
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			req.include(request, response);
		} else {
			try {
				Connection conn = lManager.getConnection();
				Statement st = conn.createStatement();
				String query = "SELECT * FROM REGISTRATIONTWO WHERE username="+username;
				ResultSet rs = st.executeQuery(query);

				while (rs.next()) {
					String usernameDB = rs.getString("username");
					String passwordDB = rs.getString("password");
					if (usernameDB.equals(username) && password.equals(passwordDB)) {
						request.setAttribute("username", username);
						RegistrationBean userDetail = new RegistrationBean();
						userDetail.setFirstName(rs.getString("first"));
						userDetail.setLastName(rs.getString("last"));
						userDetail.setAddress(rs.getString("emailaddress"));
						userDetail.setContact(rs.getString("contact"));

						list.add(userDetail);
						//System.out.println(list.get(0).getFirstName());
						request.setAttribute("list", list);
						RequestDispatcher req = request.getRequestDispatcher("dashboard.jsp");
						req.forward(request, response);
						break;
					}
				}
				st.close();
				conn.close();
				RequestDispatcher req = request.getRequestDispatcher("login.jsp");
				req.include(request, response);

			} catch (Exception e) {
				System.err.println("Login Got an exception! ");
				System.err.println(e.getMessage());
			}

		}
	}
}
