<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- Class: appNote.jsp --%>
<%-- Purpose: Input page for patient to enter a single appointment entry. --%>
<%-- Takes in information like appointment name, time, day etc. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Appointment Note</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

h2 {
	font-style: italic;
	font-size: 15px;
	color: grey;
}

::placeholder {
	color: grey;
	font-style: italic;
}

.inputs {
		text-align: justify;
	margin: 7vw;
	display: block;
	padding: 5%;
	font-family: 'Poppins', sans-serif;
	background-color: #90EE90;
}

input[type='submit'] {
	font-family: 'Poppins', sans-serif;
	font-size: 13px;
	border-radius: 5px;
	padding: 1%;
}

input.submitButton {
	font-family: 'Poppins', sans-serif;
}

input.submitButton:link, input.submitButton:visited {
	background-color: white;
	color: black;
	border: 2px solid green;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

input.submitButton:hover, input.submitButton:active {
	background-color: #008B8B;
	color: white;
}

.title h1 {
	text-align: center;
	margin: 1vw; display; block;
	font-family: 'Poppins', sans-serif;
}
</style>
</head>
<body>
	<%
		String username = request.getParameter("username");
	%>
	<div class="inputs">
		<div class="title">
			<h1>Create Appointment Note</h1>
		</div>
		<form action="AppointmentManager" method="post">
			<table style="width: 110%">
				<tr>
					<td>Appointment Title</td>
					<td><input type="text" name="appName" required /></td>
				</tr>
				<tr>
					<td>Time</td>
					<td><input type="time" name="timing" required /></td>
					<td><h2>Click the clock icon or use keyboard to enter
							time. Format is hours : minutes AM/PM</h2></td>
				</tr>
				<tr>
					<td>Day</td>
					<td><input type="text" name="day" placeholder="For ex: Monday"
						required /></td>
					<td><h2>Please enter as "Monday" or "Sunday". No
							numerical values.</h2></td>
				</tr>
				<tr>
					<td>Notes/Special details</td>
					<td><input type="text" name="notes" required /></td>
				</tr>
			</table>

			<input type="hidden" name="username" value="<%=username%>" /> <br>

			<input class="submitButton" type="submit" value="Submit" />

			<%
				//If there is an error in the input, alert pops up
			if (request.getAttribute("appointmentAlert") == ("no")) {
			%>
			<script type="text/javascript">
				alert("Please retry! Invalid and/or empty input fields.");
			</script>
			<%
				}
			%>
		</form>
	</div>
</body>
</html>