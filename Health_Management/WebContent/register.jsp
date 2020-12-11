<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%-- Class: register.jsp --%>
<%-- Purpose: Input page for user to register for a new account. This jsp page will call on a java servlet page called regCheck.java --%>
<%-- Throws alerts if data entered is invalid or null --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	text-align: center;
	margin: 7vw;
	display: block;
	padding: 5%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	border: 5px solid #FAF0E6;
}

.title h1 {
	text-align: center;
	margin: 1vw; display; block;
	font-family: 'Poppins', sans-serif;
}

.table {
	margin: 0 auto;
}

input.submitButton {
	font-family: 'Poppins', sans-serif;
}

input.submitButton:link, input.submitButton:visited {
	background-color: white;
	color: black;
	border: 2px solid blue;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

input.submitButton:hover, input.submitButton:active {
	background-color: #008B8B;
	color: white;
}

input[type='submit'] {
	font-family: 'Poppins', sans-serif;
	font-size: 13px;
	border-radius: 5px;
	padding: 1%;
}

.background {
	height: 100% !important;
	background: url(img/blueBackground.jpg);
	background-size: 100% 100%;
	background-size: cover;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<body>

	<%
		//Getting attribute alertMesage to display if entries are empty/invalid.
	String msg = (String) request.getAttribute("alertMessage");
	%>

	<div class="background">
		<br />
		<div class="inputs" style="text-align: center">
			<img src="img/Logo.png" name="pic" height="200" width="200" />
			<div class="title">
				<h1>Patient Registeration Form</h1>
			</div>
			<form method="post" action="regCheck">
				<table class="table" style="width: 75%">
					<tr>
						<td>First Name</td>
						<td><input type="text" name="first_name" required /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="last_name" required /></td>
					</tr>
					<tr>
						<td>UserName</td>
						<td><input type="text" name="username" required /></td>
						<td><h2>Must be at least 5 characters long</h2></td>

					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required /></td>
						<td><h2>Must be at least 5 characters long</h2></td>

					</tr>
					<tr>
						<td>Email Address</td>
						<td><input type="text" name="address" required /></td>
						<td><h2>Must include the @ symbol</h2></td>

					</tr>
					<tr>
						<td>Emergency Contact</td>
						<td><input type="text" name="contact"
							placeholder="For ex: 1103499987" required /></td>
						<td><h2>Enter a numerical value of exact length 10</h2></td>

					</tr>
				</table>
				<input class="submitButton" type="submit" value="Submit"
					name="submit" />

				<%
					if (msg == ("no")) {
				%>
				<script type="text/javascript">
					alert("Please retry! Invalid and/or empty data fields");
				</script>
				<%
					} else if (msg == ("exists")) {
				%>
				<script type="text/javascript">
					alert("Please use another username as the one you entered is taken!");
				</script>
				<%
					} else if (msg == ("len")) {
				%>
				<script type="text/javascript">
					alert("Please have at least 5 characters for the username and password!");
				</script>
				<%
					} else if (msg == ("contact")) {
				%>
				<script type="text/javascript">
					alert("Please have exactly 10 numbers in your emergency contact!");
				</script>
				<%
					} else if (msg == ("email")) {
				%>
				<script type="text/javascript">
					alert("Please include the '@' sign in the email address'!");
				</script>
				<%
					}
				%>

			</form>
		</div>
		<br />

	</div>
</body>
</html>