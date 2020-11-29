<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="projectFiles.DBManager"%>
<%@page import="projectFiles.RegistrationBean"%>
<%@page import="projectFiles.AppointmentBean"%>
<%@page import="projectFiles.MedicationBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

.userInfo-container h2 {
	text-align: center;
	margin: 0px auto; display; block;
	padding-top: 10%;
	font-family: 'Poppins', sans-serif;
}

.buttonsContainer {
	position: aboslute;
	text-align: center; display; block;
	margin: auto;
	vertical-align: middle;
	font-family: 'Poppins', sans-serif;
}

.note-titles {
	position: aboslute; text-align : center; display; block;
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

.td-titles {
	text-align: center;
	vertical-align: middle; display; block;
	font-family: 'Poppins', sans-serif;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthcare Dashboard</title>

</head>
<jsp:include page="navbar.jsp" />
<script>
	function foo() {
		alert("Submit button clicked!");
	}
</script>

<body>
	<%
		String username = request.getParameter("username");
	List<RegistrationBean> list = (List<RegistrationBean>) request.getAttribute("list");
	%>
	<div class="userInfo-container">
		<c:if test="${ not empty list }">
			<table style="width: 100%">
				<c:forEach items="${list}" var="record">
					<tr class="td-titles">
						<td style="font-size: 5vh; text-align: center;">${list.get(0).firstName }
							${list.get(0).lastName }'s Personal Dashboard</td>
					</tr>
					<tr>
						<td>Personal Details:</td>
					</tr>
					<tr>
						<td>Email address: ${list.get(0).address }</td>
					</tr>
					<tr>
						<td>Emergency contact: ${list.get(0).contact }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h2>Stuff left to do: add doc + pharmacy details, about us page,
			patient's personal information</h2>

	</div>
	<div class="buttonsContainer">
		<table style="width: 100%">
			<tr>
				<td><a href="medicationNote.jsp?username=<%=username%>"
					class="medButton">Create Medication Note</a></td>
				<td><br> <a href="appNote.jsp?username=<%=username%>"
					class="appButton">Create Appointment Note</a></td>
			</tr>
		</table>
	</div>

	<div class="note-titles">
		<table style="width: 75%; margin-left:15vw;">
			<tr>
				<td style="margin-left: 20px;"><h2>Medications Notes</h2></td>
				<td style="margin-right: 20px;"><h2>Appointments Notes</h2></td>
			</tr>
		</table>
	</div>

	<table style="width: 100%">
		<tr>
			<td class="td-titles">
				<%--Retrieves medication notes from MEDTABLE --%> <iframe
					className="iframe-styles" align="right"
					src="medForm.jsp?username=<%=username%>" width="550vw"
					height="300vw"></iframe>
			</td>
			<td class="td-titles">
				<%--Retrieves appointment notes from APPTABLE --%> <iframe
					src="appForm.jsp?username=<%=username%>" align="left" width="550vw"
					height="300vw"></iframe>
			</td>
		</tr>
	</table>
	<div class="medicationNotes"></div>
</body>
</html>