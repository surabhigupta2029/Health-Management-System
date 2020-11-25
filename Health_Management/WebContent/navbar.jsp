<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	font-family: 'Poppins', sans-serif;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
	background-color: #111;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="login.jsp" class="Lbutton">Login</a></li>
		<li><a href="Register_1.jsp" class="Rbutton">Register</a></li>
		<li><a href="aboutUs.jsp" class="AUbutton">About Us</a></li>
		
		<li style="float:right"><a href="logout.jsp">Logout</a></li>
	</ul>
</body>
</html>