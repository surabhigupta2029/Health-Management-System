<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- Class: medicationNote.jsp --%>
<%-- Purpose: Input page for patient to enter a single medication entry. --%>

<!DOCTYPE html>
<html>
<head>
<style>
h2 {
	font-style: italic;
	font-size: 15px;
	color: grey;
}

::placeholder {
	color: grey;
	font-style: italic;
}
</style>
<meta charset="ISO-8859-1">
<title>Create Medication Note</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
	%>
	<form action="MedicationManager" method="post">
		<table style="width: 100%">
			<tr>
				<td>Medication Name</td>
				<td><input type="text" name="medicationName" required /></td>
			</tr>
			<tr>
				<td>Dose (in milligrams)</td>
				<td><input type="text" name="dose" placeholder="For ex: 325" required /> mg </td>
				<td><h2>Enter a numerical value.</h2></td>
			</tr>
			<tr>
				<td>Time</td>
				<td><input type="time" name="timing" id="timeInput" required /></td>
								<td><h2>Click the clock icon or use keyboard to enter time. Format is hours : minutes AM/PM</h2></td>
				
			</tr>
			<tr>
				<td>Day</td>
				<td><input type="text" name="day"  placeholder="For ex: Monday" required /></td>
				<td><h2>Please enter as "Monday" or "Sunday". No numerical
						values.</h2></td>
			</tr>
			<tr>
				<td>Notes/Special details</td>
				<td><input type="text" name="notes" required /></td>
			</tr>


		</table>
		<input type="hidden" name="username" value="<%=username%>" /> <br>
		<input type="submit" value="Submit" name="submit" />
		<%
			//If there is an error in the input, alert pops up
		if (request.getAttribute("medicationAlert") == ("no")) {
		%>
		<script type="text/javascript">
			alert("Please retry! Invalid and/or empty input fields.");
		</script>
		<%
			}
		%>
	</form>
</body>
</html>