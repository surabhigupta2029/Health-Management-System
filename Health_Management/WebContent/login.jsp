<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<style>
.inputs {
	text-align: center;
	margin: 7vw; display; block;
	padding-top: 3%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	}
.title h3 {
	text-align: center;
	margin: 5vw; display; block;
	font-family: 'Poppins', sans-serif;
}
</style>
<body>
<div class = "title"><h3>Login Form</h3></div>
 
 <br/>  
 <div class="inputs">
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
</div>
</body>
</html>
