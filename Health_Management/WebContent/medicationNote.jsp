<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Medication Note</title>
</head>
<style>
.inputs {
	text-align: justify;
	margin: auto; display; block;
	padding-top: 3%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	}
</style>
<body>
<%
		String username = request.getParameter("username");
	out.println("Welcome " + username);
	%>
	<div class="inputs">
	<form action="MedicationManager" method="post">
		Medication Name:<input type="text" name="medicationName" /><br />
		Dose (in milligrams):<input type="text" name="dose" /><br /> Time:<input
			type="time" name="timing" /><br /> Day:<input type="text"
			name="day" /><br /> Notes/Special details:<input type="text"
			name="notes" /><br /> <input type="hidden" name="username"
			value="<%=username%>" /><br /> <input type="submit" value="Submit" />
	</form>
	</div>
</body>
</html>
