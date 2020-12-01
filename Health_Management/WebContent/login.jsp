
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>

<body>
	<%
		String email = (String) request.getAttribute("email");
	String contact = request.getParameter("contact");
	System.out.println("emaill: " + email);
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

		<input type="hidden" name="email" value="<%=email%>" /> <input
			type="hidden" name="contact" value="<%=contact%>" /> <input
			type="submit" value="Submit" />

		<%
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