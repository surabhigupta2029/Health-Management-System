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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("username");

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
				<td><%=applist.get(iterator).getTiming()%></td>
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