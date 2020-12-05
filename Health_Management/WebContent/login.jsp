
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

<body>
	<%
		//Getting attributes for email and contact
	String email = (String) request.getAttribute("email");
	String contact = request.getParameter("contact");
	%>
	<h3>Login</h3>
	<br />
	<form action="Login" method="post">
		<table style="with: 50%">

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

		<%-- Passing hidden values that user does not have to fill out, but are needed by the system --%>
		<input type="hidden" name="email" value="<%=email%>" /> <input
			type="hidden" name="contact" value="<%=contact%>" /> <input
			type="submit" value="Submit" />

		<%
			//If there is an error in the input, alert pops up
		if (request.getAttribute("loginAlert") == ("no")) {
		%>
		<script type="text/javascript">
			alert("Please retry! Username and Passwrods do Not Match.");
		</script>
		<%
			}
		%>
	</form>
</body>
</html>