<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("idAppt");
String username = request.getParameter("username");

try {
	DBManager medManager = new DBManager();
 	Connection con = medManager.getConnection();
 	Statement st = con.createStatement();
	int i = st.executeUpdate("DELETE FROM APPTABLE WHERE id="+id);
	
	String query = "SELECT * FROM REGISTRATIONTWO WHERE username=" + username;

	ResultSet tmpR2 = st.executeQuery(query);

	// find the empty medicine column for this user. there will be only one row for
	// this user.
	String updateString = "";
	if (tmpR2.next()) {
		if (tmpR2.getString("A1").equals(id)) {
	updateString = "A1 = ";
		} else if (tmpR2.getString("A2").equals(id)) {
	updateString = "A2 = ";
		} else if (tmpR2.getString("A3").equals(id)) {
	updateString = "A3 = ";
		}
	}
	st.executeUpdate("UPDATE REGISTRATIONTWO SET " + updateString +"NULL WHERE username='" + username + "'");

	con.close();
	
	RequestDispatcher rd = request.getRequestDispatcher("appForm.jsp");
	rd.forward(request, response);
	System.out.println("Data Deleted Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>