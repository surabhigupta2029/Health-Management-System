<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Medication Note</title>
</head>
<body>
<form action="MedicationManager" method="post">  
Medication Name:<input type="text" name="medicationName"/><br/><br/>  
Dose (in milligrams):<input type="text" name="dose"/><br/><br/>  
Time:<input type="time" name="timing"/><br/><br/>
Day:<input type="text" name="day"/><br/><br/>
Notes/Special details:<input type="text" name="notes"/><br/><br/>
<input type="submit" value="Submit"/>  
</body>
</html>