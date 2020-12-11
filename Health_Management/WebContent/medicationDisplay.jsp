<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="projectFiles.RegistrationBean"%>
<%@page import="projectFiles.AppointmentBean"%>
<%@page import="projectFiles.MedicationBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%-- Class: medicationDisplay.jsp --%>
<%-- Purpose: This class is used to display the user medication entries based on the day button they click.  --%>
<%-- Also includes the "delete" button next to each entry.  --%>

<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;
.buttonsContainer {
	text-align: center; display; block;
	margin: auto;
	vertical-align: middle;
	font-family: 'Poppins', sans-serif;
}

input[type='submit'] {
	font-family: 'Poppins', sans-serif;
	font-size: 11px;
	font-weight: bold;
	border-radius: 7px;
	size:50;
    width: 20px;  height: 20px;
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

tr.medFormtd:nth-child(even) {
	background-color: #B7CBC0;
}

.medFormtd {
	padding: 10px !important;
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
		//Getting parameter username
	String username = request.getParameter("username");

	//Getting attribute of type treemap which holds the selected medication entries
	TreeMap<Integer, List<MedicationBean>> medMap = (TreeMap<Integer, List<MedicationBean>>) request.getAttribute("data");

	try {
	%>
	<div class="buttonsContainer">
		<%-- Buttons for each day of the week. Clicking a button sends a request to the respective java servlet file --%>

		<form action="MedicationManager?username=" +<%=username%> method="get">
			<input type="hidden" name="username" value=<%=username%> /> <input
				type="submit" value="Sunday" name="Sunday" id="dayStyles" /> <input
				type="submit" value="Monday" name="Monday" id="dayStyles" /> <input
				type="submit" value="Tuesday" name="Tuesday" id="dayStyles" /> <input
				type="submit" value="Wednesday" name="Wednesday" id="dayStyles" />
			<input type="submit" value="Thursday" name="Thursday" id="dayStyles" />
			<input type="submit" value="Friday" name="Friday" id="dayStyles" />
			<input type="submit" value="Saturday" name="Saturday" id="dayStyles" />
						<input type="submit" value="Email" name="Email" id="dayStyles" />
			

		</form>
	</div>
	<div style="margin-top: 5%"></div>

	<%-- Displays the medication entries in table format --%>
	<table class="tdStyles" align=center
		style="text-align: center; border-collapse: collapse;">
		<thead>
			<tr>
				<th>ID</th>
				<th>MEDICATION NAME</th>
				<th>DOSE (IN mg)</th>
				<th>TIME</th>
				<th>NOTES</th>
				<th></th>

			</tr>
		</thead>
		<tbody>
			<%
				int iterator = 0;
			int displayKey = 1;
			Set<Map.Entry<Integer, List<MedicationBean>>> s = medMap.entrySet();

			//If the treemap is emtpy (meaning there are no entries yet), display alert
			if (medMap.isEmpty() && request.getAttribute("emailAlert").equals("no")) {
			%>
			<script type="text/javascript">
				alert("No medication entries for this day yet!");
			</script>
			<%
				}
			else if(request.getAttribute("emailAlert").equals("yes")){
				%>
				<script type="text/javascript">
					alert("Email sent!");
				</script>
				<%
			}

			//If there is information in treemap, display it as follows
			for (Map.Entry<Integer, List<MedicationBean>> entry : s) {
			List<MedicationBean> medlist = entry.getValue();
			String deleteID = medlist.get(iterator).getID();
			%>
			<tr class="medFormtd">
				<td><%=displayKey%></td>
				<td><%=medlist.get(iterator).getMedicationName()%></td>
				<td><%=medlist.get(iterator).getDose()%></td>
				<td><%=medlist.get(iterator).getTime()%> <%=medlist.get(iterator).getMeridian()%></td>
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
		} catch (Exception e) {
	System.out.print(e.getMessage());
	}
	%>

</body>
</html>