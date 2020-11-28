<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("idAppt");
try {
	DBManager medManager = new DBManager();
 	Connection con = medManager.getConnection();
 	Statement st = con.createStatement();
	int i = st.executeUpdate("DELETE FROM APPTABLE WHERE id="+id);
	RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
	rd.forward(request, response);
	System.out.println("Data Deleted Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>