  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<body>
<h3>Login Form</h3>  
 <br/>  
<form action="Login" method="post">  
Username:<input type="text" name="username"/><br/><br/>  
Password:<input type="password" name="password"/><br/><br/>  
<input type="submit" value="Submit"/>  

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