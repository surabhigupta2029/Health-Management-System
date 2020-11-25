<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="projectFiles.RegistrationBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.titles h2 {
	text-align: center;
	margin: 0px auto; display; block;
	padding-top: 10%;
	font-family: 'Poppins', sans-serif;
}

.buttonsContainer {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthcare Dashboard</title>

</head>
<jsp:include page="navbar.jsp" />


<body>
	<table style="with: 50%">
		<tr>
			<td>
				<%
					//String username = request.getParameter("username");
				List<RegistrationBean> list = (List<RegistrationBean>) request.getAttribute("list");
				//out.println("Welcome " + username);
				%>


				<div class="titles">
					<c:if test="${ not empty list }">
						<table>
							<c:forEach items="${list}" var="record">
								<tr>
									<td>Welcome: ${list.get(0).firstName }
										${list.get(0).lastName } !</td>
								</tr>
								<tr>

									<td>Email address: ${list.get(0).address }</td>
								</tr>
								<tr>
									<td>Emergency contact: ${list.get(0).contact }</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<h2>Personal Dashboard</h2>
					<h2>Stuff left to do: add doc + pharmacy details, about us
						page, patient's personal information</h2>


					<form action="Login" method="get"></form>
					<div class="buttonsContainer">
						<a href="medicationNote.jsp" class="medButton">Create
							Medication Note</a> <a href="appNote.jsp" class="appButton">Create
							Appointment Note</a>
					</div>

					<%--Retrieves medication notes from MEDTABLE --%>
					<%
						try {
						DBManager medManager = new DBManager();
						Connection con = medManager.getConnection();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("SELECT * FROM MEDTABLE");
						String javaday = "";
					%>
					<div class="buttonsContainer">

						<form action="MedicationManager" method="get">
							<input type="submit" value="Sunday" name="Sunday" /> <input
								type="submit" value="Monday" name="Monday" /> <input
								type="submit" value="Tuesday" name="Tuesday" /> <input
								type="submit" value="Wednesday" name="Wednesday" /> <input
								type="submit" value="Thursday" name="Thursday" /> <input
								type="submit" value="Friday" name="Friday" /> <input
								type="submit" value="Saturday" name="Saturday" />
						</form>
					</div>
					<table border=1 align=center style="text-align: center">
						<thead>
							<tr>
								<th>ID</th>
								<th>MEDICATION NAME</th>
								<th>DOSE (IN mg)</th>
								<th>TIME</th>
								<th>NOTES</th>
							</tr>
						</thead>
						<tbody>
							<%
								TreeMap<Integer, List<String>> std = (TreeMap<Integer, List<String>>) request.getAttribute("data");
							Set<Map.Entry<Integer, List<String>>> s = std.entrySet();
							for (Map.Entry<Integer, List<String>> entry : s) {
								List<String> medlist = entry.getValue();
							%>
							<tr>
								<td><%=entry.getKey()%></td>
								<td><%=medlist.get(1)%></td>
								<td><%=medlist.get(2)%></td>
								<td><%=medlist.get(3)%></td>
								<td><%=medlist.get(4)%></td>
								<td><a href="delete.jsp?id=<%=medlist.get(0)%>"><button
											type="button" class="delete">Delete</button></a></td>
							</tr>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<br>
					<%
						st.close();
					con.close();
					} catch (Exception e) {
					out.print(e.getMessage());
					%><br>
					<%
						}
					%>

					<%--Retrieves appointment notes from APPTABLE --%>


					<div class="medicationNotes"></div>
	</table>
	
</body>
</html>