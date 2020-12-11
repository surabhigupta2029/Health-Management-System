<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="projectFiles.RegistrationBean"%>
<%@page import="projectFiles.AppointmentBean"%>
<%@page import="projectFiles.MedicationBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<%-- Class: dashboard.jsp --%>
<%-- Purpose: This is the patient's personal dashboard, where he/she can add medication and appointment notes.  --%>
<%-- These notes will be displayed and can also be deleted on the same page. Moreover, the dashboard displays the  --%>
<%-- logged in patient's personal details. --%>


<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.userInfo-container {
	text-align: center;
	margin: 0px auto; display; block;
	padding-top: 3%;
	font-family: 'Poppins', sans-serif;
}

img {
	margin-left: auto;
	margin-right: auto;
	display: block;
}

h3 {
	text-align: center;
	margin: 0px auto;
	display: block;
	font-family: 'Poppins', sans-serif;
}

h2 {
	text-align: center;
	margin: 0px auto; display; block;
	font-family: 'Poppins', sans-serif;
}

.buttonsContainer {
	text-align: center; display; block;
	margin: auto;
	vertical-align: middle;
	font-family: 'Poppins', sans-serif;
}

.note-titles th {
	text-align: center;
	display: block;
	vertical-align: middle;
	font-family: 'Poppins', sans-serif;
	font-weight: bold;
}

.iframes-container {
	text-align: center;
	display: inline-block;
}

.iframe-styles {
	display: inline-block;
}

iframe {
	max-width: 100vw;
	max-height: 56.25vw; /* 315/560 = .5625 */
}

.centerText {
	text-align: center;
}

.td-titles {
	text-align: center;
	vertical-align: middle; display; block;
	font-family: 'Poppins', sans-serif;
	font-weight: bold;
	padding-top: 5%;
	padding-bottom: 5%;
}

.bar {
	position: relative;
	top: 40;
	left: 100;
	right: 20;
	width: 100%;
	height: 10px;
	width: 100%;
	color: orange;
}

.medTitle {
	background-color: lightblue;
}

.appTitle {
	background-color: lightgreen;
}

.bottom-margins {
	margin-top: 10%;
}

a.medButton {
	padding: 3%;
	margin: 5%;
}

a.appButton {
	padding: 3%;
	margin: 5%;
}

a.medButton:link, a.medButton:visited {
	background-color: white;
	color: black;
	border: 2px solid blue;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

a.medButton:hover, a.medButton:active {
	background-color: blue;
	color: white;
}

a.appButton:link, a.appButton:visited {
	background-color: white;
	color: black;
	border: 2px solid green;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

a.appButton:hover, a.appButton:active {
	background-color: green;
	color: white;
}

table.details {
	background-color: #d6f5f5;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthcare Dashboard</title>

</head>
<jsp:include page="navbar.jsp" />
<body>
	<%
		List<RegistrationBean> list;

	//Getting the parameters being passed to dashboard
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String first = request.getParameter("first");

	//Getting attributes (treemaps) to later display
	list = (List<RegistrationBean>) request.getAttribute("list");
	%>

	<%--User's personal information and doctor information --%>
	<div class="userInfo-container">
		<img src="img/Logo.png" name="pic" height="200" width="200" />
		<div>
			<h2 style="font-size: 4vh; font-size: bold; text-align: center;">
				Welcome
				<%=first%>!
			</h2>
		</div>
		<br />
		<c:if test="${ not empty list }">
			<table class="details" style="width: 100%">
				<c:forEach items="${list}" var="record">
					<tr class="td-titles">

					</tr>
					<tr>
						<td>Personal Details</td>
						<td>Doctor's Name: Dr. Smith</td>
					</tr>
					<tr>
						<td>Email address: <%=email%></td>
						<td>Phone Number: 123-456-7890</td>
					</tr>
					<tr>
						<td>Emergency contact: <%=contact%></td>
						<td>E-mail: dr_smith@gmail.com</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

	</div>

	<br />
	<br />

	<%--All medication and appointment information --%>
	<%--Contains the buttons to create notes and even displays them --%>

	<div class="holder">
		<table style="width: 100%">
			<tr>
				<td class="medTitle">
					<h2 style="padding-top: 10%;">Medication Notes</h2>
					<h3>
						<a class="medButton"
							href="medicationNote.jsp?username=<%=username%>">Create
							Medication Note </a>
					</h3>
				</td>
				<td class="appTitle">
					<h2 style="padding-top: 10%;">Appointment Notes</h2>
					<h3>
						<a class="appButton" href="appNote.jsp?username=<%=username%>">Create
							Appointment Note</a>
					</h3>
				</td>
			</tr>
			<tr>
				<td class="td-titles" style="background-color: #D6F8E0;">
					<%
						
					%> <iframe align="center" frameBorder="0"
						src="medicationDisplay.jsp?username=<%=username%>" width="650"
						height="300"></iframe>
				</td>
				<td class="td-titles" style="background-color: #C8F69B;">
					<%
						
					%><iframe src="appDisplay.jsp?username=<%=username%>"
						align="center" frameBorder="0" width="650" height="300">
					</iframe>
				</td>
			</tr>
		</table>
	</div>
	<div class="bottom-margins"></div>
	<div class="medicationNotes"></div>
</body>
</html>