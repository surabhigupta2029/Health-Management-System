<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.inputs {
	text-align: center;
	margin: 7vw; display; block;
	padding-top: 3%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	display: block;
	width: 985px; margin: 0 auto;
	}
.title h1 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
}
.table {
	margin: 0 auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<body>

	<%
		session.setMaxInactiveInterval(2);
	String msg = (String) request.getAttribute("alertMessage");
	%>


	<div class="title"><h1>Patient Register Form</h1></div>
	<div class="inputs" style = "text-align: center">
	<form method="post" action="regCheck">
		<table class="table" >
			<tr>
				<td>First Name</td>
				<td><input type="text" name="first_name" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="last_name" /></td>
			</tr>
			<tr>
				<td>UserName</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr>
				<td>Emergency Contact</td>
				<td><input type="text" name="contact" /></td>
			</tr>
		</table>
		<input type="submit" value="Submit" name="submit" />

		<%
			if (request.getAttribute("alertMessage") == ("no")) {
		%>
		<script type="text/javascript">
			alert("Please retry! Invalid and/or empty data fields");
		</script>
		<%
			}
		%>

	</form>
	</div>
</body>
</html>



