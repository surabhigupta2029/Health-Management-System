<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="projectFiles.RegistrationBean"%>
<%@page import="projectFiles.AppointmentBean"%>
<%@page import="projectFiles.MedicationBean"%>
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
	background-color: lightblue;
}
.dash h2 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
}
.buttonsContainer1 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
}
.buttonsContainer2 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
	background-color: lightgreen;
}
.buttonsContainer3 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
	background-color: darkorchid;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthcare Dashboard</title>

</head>
<jsp:include page="navbar.jsp" />


<body>
	<%
		String username = request.getParameter("username");
	List<RegistrationBean> list = (List<RegistrationBean>) request.getAttribute("list");

	out.println("Welcome " + username);
	%>



	<div class="titles">
		<c:if test="${ not empty list }">
			<table>
				<c:forEach items="${list}" var="record">
					<tr>
						<td>Welcome: ${list.get(0).firstName } ${list.get(0).lastName }
							!</td>
					</tr>
					<tr>

						<td>Email address: ${list.get(0).address }</td>
					</tr>
					<tr>
						<td>Emergency contact: ${list.get(0).contact }</td>
					</tr>
					<tr><td>Doctor's Name: Dr. Smith</td></tr>
					<tr><td>Phone Number: 123-456-7890</td></tr>
					<tr><td>E-mail: dr_smith@gmail.com</td></tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<div class="dash">
		<h2>Personal Dashboard</h2>
	</div>
	<form action="Login" method="get"></form>
	<div class="buttonsContainer1">
		<a href="medicationNote.jsp?username=<%=username%>" class="medButton">Create
			Medication Note</a> <br> <a href="appNote.jsp" class="appButton">Create
			Appointment Note</a>
	</div>
	<table style="with: 50%">

		<%--Retrieves medication notes from MEDTABLE --%>
		<%
			try {
			DBManager medManager = new DBManager();
			Connection con = medManager.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM MEDTABLE");
			String javaday = "";
		%>
		<div class="buttonsContainer2">
			<h2>Medications</h2>
			<form action="MedicationManager?username=" +<%=username%>
				method="get">
				<input type="hidden" name="username" value=<%=username%> /> <input
					type="submit" value="Sunday" name="Sunday" /> <input type="submit"
					value="Monday" name="Monday" /> <input type="submit"
					value="Tuesday" name="Tuesday" /> <input type="submit"
					value="Wednesday" name="Wednesday" /> <input type="submit"
					value="Thursday" name="Thursday" /> <input type="submit"
					value="Friday" name="Friday" /> <input type="submit"
					value="Saturday" name="Saturday" />
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
					int iterator = 0;
				int displayKey = 1;
				TreeMap<Integer, List<MedicationBean>> std = (TreeMap<Integer, List<MedicationBean>>) request.getAttribute("data");
				Set<Map.Entry<Integer, List<MedicationBean>>> s = std.entrySet();
				for (Map.Entry<Integer, List<MedicationBean>> entry : s) {
					List<MedicationBean> medlist = entry.getValue();
					String deleteID = medlist.get(iterator).getID();
				%>
				<tr>
					<td><%=displayKey%></td>
					<td><%=medlist.get(iterator).getMedicationName()%></td>
					<td><%=medlist.get(iterator).getDose()%></td>
					<td><%=medlist.get(iterator).getTime()%></td>
					<td><%=medlist.get(iterator).getNotes()%></td>
					<td><a href="deleteMedication.jsp?id=<%=deleteID%>"><button
								type="button" class="delete">Delete</button></a></td>
				</tr>
				<%
					displayKey++;
				iterator++;
				}
				%>
			</tbody>
		</table>
		<%
		st.close();
		con.close();
		} catch (Exception e) {
		System.out.print(e.getMessage());
		}
		%>

		<%--Retrieves appointment notes from APPTABLE --%>
		<%
			try {
			DBManager medManager = new DBManager();
			Connection appCon = medManager.getConnection();
			Statement appSt = appCon.createStatement();
			ResultSet rs = appSt.executeQuery("SELECT * FROM APPTABLE");
			String javaday = "";
		%>
		<div class="buttonsContainer3">
			<h2>Appointments</h2>
			<form action="AppointmentManager" method="get">
				<input type="submit" value="Sunday" name="Sunday" /> <input
					type="submit" value="Monday" name="Monday" /> <input type="submit"
					value="Tuesday" name="Tuesday" /> <input type="submit"
					value="Wednesday" name="Wednesday" /> <input type="submit"
					value="Thursday" name="Thursday" /> <input type="submit"
					value="Friday" name="Friday" /> <input type="submit"
					value="Saturday" name="Saturday" />
			</form>
		</div>
		<table border=1 align=center style="text-align: center">
			<thead>
				<tr>
					<th>ID</th>
					<th>APPOINTMENT NAME</th>
					<th>TIME</th>
					<th>NOTES</th>
				</tr>
			</thead>
			<tbody>
				<%
					TreeMap<String, List<AppointmentBean>> appMap = (TreeMap<String, List<AppointmentBean>>) request
						.getAttribute("appData");
				Set<Map.Entry<String, List<AppointmentBean>>> s = appMap.entrySet();
				int iterator = 0;
				int displayKey = 1;
				for (Map.Entry<String, List<AppointmentBean>> entry : s) {
					List<AppointmentBean> applist = entry.getValue();
				%>
				<tr>
					<td><%=displayKey%></td>
					<td><%=applist.get(iterator).getAppName()%></td>
					<td><%=applist.get(iterator).getTiming()%></td>
					<td><%=applist.get(iterator).getNotes()%></td>
					<td><a href="deleteAppointment.jsp?idAppt=<%=entry.getKey()%>"><button
								type="button" class="delete">Delete</button></a></td>
				</tr>
				<%
					displayKey++;
				iterator++;
				}
				%>
			</tbody>
		</table>
		<%
		appSt.close();
		appCon.close();
		} catch (Exception e) {
		System.out.print(e.getMessage());
		}
		%>

	</table>
	<div class="medicationNotes"></div>

</body>
</html>

