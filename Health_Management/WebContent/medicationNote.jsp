<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Medication Note</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
	out.println("Welcome " + username);
	%>
	<form action="MedicationManager" method="post">
		<table style="with: 50%">
			<tr>
				<td>Medication Name</td>
				<td><input type="text" name="medicationName" required /></td>
			</tr>
			<tr>
				<td>Dose (in milligrams)</td>
				<td><input type="text" name="dose" required /></td>
			</tr>
			<tr>
				<td>Time</td>
				<td><input type="time" name="timing"
					required /></td>
			</tr>
			<tr>
				<td>Day</td>
				<td><input type="text" name="day" required /></td>
			</tr>
			<tr>
				<td>Notes/Special details</td>
				<td><input type="text" name="notes" required/></td>
			</tr>


		</table>
		<input type="hidden" name="username" value="<%=username%>" /> <br>
		 <input type="submit" value="Submit" name="submit" />

	</form>
</body>
</html>