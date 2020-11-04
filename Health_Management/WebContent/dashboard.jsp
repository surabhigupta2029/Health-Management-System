<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.titles h2 {
	text-align: center;
	margin: 0px auto; display; block;
	padding-top: 10%;
	font-family: 'Poppins', sans-serif;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthcare Dashboard</title>
</head>
<jsp:include page="navbar.jsp" />

<body>
	<table style="with: 50%">
		<tr>
			<td>
				<%
					String username = request.getParameter("email");
				%>
				<div class="titles">
					<h2>Welcome</h2>
					<h2>Personal Dashboard</h2>
				</div> <%-- <a>Welcome   <% out.println(username); %> User!!!! You have logged in.</a></td></tr> --%>
	</table>
</body>
</html>