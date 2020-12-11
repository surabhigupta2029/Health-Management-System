
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- Class: login.jsp --%>
<%-- Purpose: This is the patient login page where they can log in using their username and password,  --%>
<%--created at the time of registration. If there is empty and or invalid input, an alert shows up.  --%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.inputs {
	text-align: center;
	margin: 7vw;
	display: block;
	padding: 5%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	border: 5px solid #FAF0E6;
}

.title {
	text-align: center;
	margin: 5vw;
	display: block;
	font-family: 'Poppins', sans-serif;
}

td {
	text-align: center;
	display: incline-block;
	font-family: 'Poppins', sans-serif;
	font-size: 1vw;
}

h1 {
	text-align: center;
	display: incline-block;
	font-family: 'Poppins', sans-serif;
	font-size: 2vw;
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
<body>
	<%
		//Getting attributes for email and contact
	String email = (String) request.getAttribute("email");
	String contact = request.getParameter("contact");
	%>
	<div class="background">
		<br />
		<div class="inputs">
			<img src="img/Logo.png" name="pic" height="200" width="200" />

			<form action="Login" method="post">
				<h1>Patient Login Page</h1>

				<table style="width: 35%; margin-left: 35%; margin-top: 5%;">

					<tr>
						<td>Username</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
				</table>
				<br />
				<%-- Passing hidden values that user does not have to fill out, but are needed by the system --%>
				<input type="hidden" name="email" value="<%=email%>" /> <input
					type="hidden" name="contact" value="<%=contact%>" /> <input
					class="submitButton" type="submit" value="Submit" />

				<%
					//If there is an error in the input, alert pops up
				if (request.getAttribute("loginAlert") == ("no")) {
				%>
				<script type="text/javascript">
					alert("Please retry! Username and Passwrods do Not Match.");
				</script>
				<%
					}
				else if(request.getAttribute("loginAlert") == ("exists")){
					%>
					<script type="text/javascript">
						alert("Please register as the credentials entered do not exist in our system!");
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