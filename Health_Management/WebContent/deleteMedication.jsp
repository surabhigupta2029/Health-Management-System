<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="java.sql.*"%>

<%-- Class: deleteMedication.jsp --%>
<%-- Purpose: Used to delete selected medication entries using a unique ID corresponding to logged in user --%>

<%
	String id = request.getParameter("id");
String username = request.getParameter("username");
String updateString = "";

try {
	DBManager medManager = new DBManager();
	//Connection con = medManager.getConnection();
	Statement st = medManager.stmt;

	//Delete entry from MEDTABLE
	st.executeUpdate("DELETE FROM MEDTABLE WHERE id=" + id);

	//Query to delete from the registration DB which holds ids specific to logged in user
	String query = "SELECT * FROM REGISTRATIONTWO WHERE username='" + username + "'";
	ResultSet tmpR2 = st.executeQuery(query);

	// Find the empty medicine column for this user. There will be only one row for
	// this user.
	int present = 0;
	if (tmpR2.next()) {
		present = 1;
	}

	//Parsing through the data entry, splitting based on ","
	String dbStr = tmpR2.getString("M1");
	String[] medList = dbStr.split(",");

	String[] updatedList = new String[medList.length];

	//Creating the updatedString to feed into database
	for (int i = 0; i < medList.length; i++) {
		if (!(medList[i].equals(id))) {
	updateString += "" + medList[i] + ",";
		}
	}

	st.executeUpdate("UPDATE REGISTRATIONTWO SET M1 = '" + updateString + "' WHERE username='" + username + "'");

	RequestDispatcher rd = request.getRequestDispatcher("medForm.jsp");
	rd.forward(request, response);
	tmpR2.close();
	//st.close();
	//con.close();

} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>