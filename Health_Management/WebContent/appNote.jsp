<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Appointment Note</title>
</head>
<style>
.inputs {
	text-align: justify;
	margin: auto; display; block;
	padding-top: 3%;
	font-family: 'Poppins', sans-serif;
	background-color: lightblue;
	}
</style>
<body>
<div class="inputs">
<form action="AppointmentManager" method="post">  
Appointment Title:<input type="text" name="appName"/><br/><br/>  
Time:<input type="time" name="timing"/><br/><br/>
Day:<input type="text" name="day"/><br/><br/>
Notes/Special details:<input type="text" name="notes"/><br/><br/>
<input type="submit" value="Submit"/> 
</form> 
</div>
</body>
</html>
