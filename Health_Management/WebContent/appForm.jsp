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
.buttonsContainer {
	text-align: center; display; block;
	margin: auto;
	vertical-align: middle;
	font-family: 'Poppins', sans-serif;
}

input[type='submit'] {
	font-family: 'Poppins', sans-serif;
	font-size: 13px;
	border-radius: 5px;
}

#dayStyles {
	width: 80px;
	height: 30px;
	background-color: white;
	color: black;
}

#dayStyles:hover {
	background-color: D2D8B6;
	color: black;
}

.tdStyles {
	font-family: 'Poppins', sans-serif;
	font-weight: medium;
	font-size: medium;
	border-spacing: 5px;
}

table {
	border: 1px solid black;
	border-radius: 5px;
	border-weight: 1px;
	  border-collapse: collapse;
	
}

tr:nth-child(even) {
	background-color: #B7CBC0;
}

td {
	padding: 10px !important;
}

tr th {
	font-family: 'Poppins', sans-serif;
	padding: 10px !important;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
	TreeMap<Integer, String> appTimeTypeMap = (TreeMap<Integer, String>) session.getAttribute("appTimeTypeMap");
	TreeMap<String, List<AppointmentBean>> appMap = (TreeMap<String, List<AppointmentBean>>) request
			.getAttribute("appData");
	//System.out.println(appTimeTypeMap + " appform");
	try {
		DBManager medManager = new DBManager();
		Connection appCon = medManager.getConnection();
		Statement appSt = appCon.createStatement();
		ResultSet rs = appSt.executeQuery("SELECT * FROM APPTABLE");
		String javaday = "";
	%>
	<div class="buttonsContainer">

		<form action="AppointmentManager?username="
			+<%=username%>" method="get">
			<input type="hidden" name="username" value=<%=username%> /> <input
				type="submit" value="Sunday" name="Sunday" id="dayStyles" /> <input
				type="submit" value="Monday" name="Monday" id="dayStyles" /> <input
				type="submit" value="Tuesday" name="Tuesday" id="dayStyles" /> <input
				type="submit" value="Wednesday" name="Wednesday" id="dayStyles" />
			<input type="submit" value="Thursday" name="Thursday" id="dayStyles" />
			<input type="submit" value="Friday" name="Friday" id="dayStyles" />
			<input type="submit" value="Saturday" name="Saturday" id="dayStyles" />
		</form>
	</div>
	<div style="margin-top: 5%"></div>
	<table class="tdStyles" align=center style="text-align: center">
		<thead>
			<tr>
				<th>ID</th>
				<th>APPOINTMENT NAME</th>
				<th>TIME</th>
				<th>NOTES</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				Set<Map.Entry<String, List<AppointmentBean>>> s = appMap.entrySet();
			int iterator = 0;
			int displayKey = 1;
			if (appMap.isEmpty()) {
			%>
			<script type="text/javascript">
				alert("No entries for this day yet!");
			</script>
			<%
				}
			for (Map.Entry<String, List<AppointmentBean>> entry : s) {
			List<AppointmentBean> applist = entry.getValue();
			%>
			<tr>
				<td><%=displayKey%></td>
				<td><%=applist.get(iterator).getAppName()%></td>
				<td><%=applist.get(iterator).getTiming()%> <%=applist.get(iterator).getMeridian()%></td>
				<td><%=applist.get(iterator).getNotes()%></td>
				<td><a
					href="deleteAppointment.jsp?idAppt=<%=entry.getKey()%>&username=<%=username%>"><button
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
</body>
</html>