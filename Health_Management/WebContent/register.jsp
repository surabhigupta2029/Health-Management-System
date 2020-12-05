<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%-- Class: register.jsp --%>
<%-- Purpose: Input page for user to register for a new account. This jsp page will call on a java servlet page called regCheck.java --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<body>

	<%
		//Getting attribute alertMesage to display if entries are empty/invalid.
	String msg = (String) request.getAttribute("alertMessage");
	%>

	<h1>Patient Registeration Form</h1>
	<form method="post" action="regCheck">
		<table style="width: 75%">
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
				<td><h2>Must be atleast 5 characters long</h2></td>

			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" required /></td>
				<td><h2>Must be atleast 5 characters long</h2></td>

			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" name="address" required /></td>
				<td><h2>Must include the @ symbol</h2></td>

			</tr>
			<tr>
				<td>Emergency Contact</td>
				<td><input type="text" name="contact"
					placeholder="For ex: 8103499987" required /></td>
				<td><h2>Enter a numerical value of exact length 10</h2></td>

			</tr>
		</table>
		<input type="submit" value="Submit" name="submit" />

		<%
			if (msg == ("no")) {
		%>
		<script type="text/javascript">
			alert("Please retry! Invalid and/or empty data fields");
		</script>
		<%
			}
		%>

	</form>
</body>
</html>