<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here:</title>
</head>
<body>
<form action="process.jsp">  
<input type="text" name="uname" value="Enter Name" onclick="this.value=''"/><br/>  
<input type="text" name="uemail"  value="Enter Email ID" onclick="this.value=''"/><br/>  
<input type="password" name="upass"  value="Enter Password" onclick="this.value=''"/><br/>  
<input type="submit" value="register"/>  
</form>  
</body>
</html>