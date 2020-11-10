package projectFiles;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

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
	String sql = "CREATE TABLE " + dbname + " " +
            "(id INTEGER not NULL, " +
            " first VARCHAR(255), " + 
            " last VARCHAR(255), " + 
            " username VARCHAR(25), " +
            " password VARCHAR(25), " +
            " address INTEGER, " +
            " contact INTEGER, " +
            " PRIMARY KEY ( id ))"; 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");

		regMember member = new regMember(first_name, last_name, username, password, address, contact);
		if (first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || password.isEmpty() || address.isEmpty()
				|| contact.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
			req.include(request, response);
		} else {
			//rManager.createTable(sql, member);
			//String result = rManager.insert(member);

			try {
				rManager.insert(member);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//rManager.print();
			//response.getWriter().print(result);
		}
	}
} // end of class
//  // TODO Auto-generated method stub
//  		String first_name = request.getParameter("first_name");
//  		String last_name = request.getParameter("last_name");
//  		String username = request.getParameter("username");
//  		String password = request.getParameter("password");
//  		String address = request.getParameter("address");
//  		String contact = request.getParameter("contact");
//  		//System.out.println("inn");
//
//  		if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || 
//  				password.isEmpty() || address.isEmpty() || contact.isEmpty())
//  		{
//  			RequestDispatcher req = request.getRequestDispatcher("Register_1.jsp");
//  			req.include(request, response);
//  		}
//  		else
//  		{
//  			String new_name = print_name(first_name);
//  	        response.setContentType("text/html");
//  	        PrintWriter pw=response.getWriter();
//  	        pw.write("<h2> Following data received sucessfully.. <h2> <br>");
//  	        pw.write("<h3> Name: "+ first_name +" </h3>");
//
//  	        pw.write("</h3>");
//  	        request.setAttribute("first_name",  first_name);;
//  			RequestDispatcher req = request.getRequestDispatcher("Register_2.jsp");
//  			req.forward(request, response);
//  		}
//  	} //end of doPost
//       
//       protected String print_name(String em)
//       {
//          
//      	 return "xx"+em;
//       }