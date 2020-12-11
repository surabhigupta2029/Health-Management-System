<%@page import="java.sql.Connection"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- Class: loginAndReg.jsp --%>
<%-- Purpose: The initial page the user sees, where they can either login or register --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.button-container {
	margin: 0;
	position: relative;
	margin-top: 10%;
	margin-bottom: 10%;
	left: 50%;
	display: inline-block;
	text-align: center;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

a.Lbutton {
	font-family: 'Poppins', sans-serif;
	-webkit-appearance: button;
	-moz-appearance: button;
	appearance: button;
	background-color: white;
	border-radius: 8px;
	border: 2px solid #f44336;
	color: black;
	padding: 25px 40px;
	margin-right: 110px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

a.Lbutton:hover {
	font-family: 'Poppins', sans-serif;
	background-color: #f44336;
	color: white;
}

a.Rbutton {
	font-family: 'Poppins', sans-serif;
	-webkit-appearance: button;
	-moz-appearance: button;
	appearance: button;
	background-color: white;
	border-radius: 8px;
	border: 2px solid #008CBA;
	color: black;
	padding: 25px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	position: relative;
}

a.Rbutton:hover {
	font-family: 'Poppins', sans-serif;
	background-color: #008CBA;
	color: white;
}

.title {
	font-family: 'Poppins', sans-serif;
	text-align: center;
	margin: 0px auto;
	display: block;
	padding-top: 5%;
	position: relative;
}

img {
	margin-left: auto;
	margin-right: auto;
	display: block;
}

.entryBackground {
	background: url(img/whiteBackground1.jpg);
	background-size: 100% 100%;
	background-size: cover;
	height: 100%;
     margin:0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entry Page</title>
<body>
	<div class="entryBackground">
		<br />
		<div>
			<img src="img/Logo.png" name="pic" height="200" width="200" />

			<h1 class="title">Please choose one of the following</h1>
			<div class="button-container">
				<ul>
					<a href="login.jsp" class="Lbutton">Login</a>
					<a href="register.jsp" class="Rbutton">Register</a>
				</ul>
			</div>
			<div style="padding-bottom: 5vw;"></div>

		</div>
	</div>
</body>
</html>