<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Appointment Note</title>
</head>
<body>
<%
		String username = request.getParameter("username");
	%>
<form action="AppointmentManager" method="post">  
Appointment Title:<input type="text" name="appName"/><br/><br/>  
Time:<input type="time" name="timing"/><br/><br/>
Day:<input type="text" name="day"/><br/><br/>
Notes/Special details:<input type="text" name="notes"/><br/><br/>
		<input type="hidden" name="username" value="<%=username%>" /> <br>

<input type="submit" value="Submit"/>  
</body>
</html>