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
		Connection con = medManager.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM MEDTABLE");
		String javaday = "";
	%>
	<div class="buttonsContainer">

		<form action="MedicationManager?username=" +<%=username%> method="get">
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
			TreeMap<Integer, List<MedicationBean>> medMap = (TreeMap<Integer, List<MedicationBean>>) request.getAttribute("data");
			Set<Map.Entry<Integer, List<MedicationBean>>> s = medMap.entrySet();
			if (medMap.isEmpty()) {
			%>
			<script type="text/javascript">
				alert("No entries for this day yet!");
			</script>
			<%
				}
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
				<td><a
					href="deleteMedication.jsp?id=<%=deleteID%>&username=<%=username%>"><button
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

</body>
</html>