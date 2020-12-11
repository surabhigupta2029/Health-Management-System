<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%-- Class: aboutUs.jsp --%>
<%-- Purpose: serves as the about us page providing information about our product and team --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;
body {
  font-family: 'Poppins', sans-serif;
  margin: 0;
}
html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}
.column {
  float: left;
  width: 100%;
  margin-bottom: 16px;
  padding: 0 8px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}
.about-section {
  padding: 50px;
  text-align: center;
  background-color: lightblue;
  color: black;
}
.container {
  padding: 0 16px;
}
.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}
.title {
  color: grey;
}
.button:hover {
  background-color: #555;
}
@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>

<div class="about-section">
  <h1>About Us Page</h1>
  <p></p>
</div>
<h2 style="text-align:center">Our Product</h2>
<div class="row">
  <div class="column">
      <div class="card">
      <div class="container">
        <h2>Care4Today</h2>
         <p class="title">Online healthcare management website</p>
        <p>Care4Today is a tracker for a patient's medication prescriptions and upcoming appointments. By effectively track and manage their needs, this application will help save time and avoid confusion. Currently, this application will be tailored towards the older demographic but in the future we hope to extend this to include functionality that is compatible with patient's of all ages.</p>
     </div>
    </div>
  </div>   

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
      <div class="card">
      <div class="container">
        <h2>Jiaxi Lai</h2>
        <p class="title">Computer Engineering major</p>
        <p>Why do they want to work on this project?</p>
        <p>She believe that it helps people with their health care. Sometimes people always forget their medications and doctor appointments. It will be easier if people have a tool to keep everything updated and organized. </p>
      </div>
    </div>
  </div>
  
  
<div class="column">
    <div class="card">
      <div class="container">
        <h2>Alan Nguyen</h2>
        <p class="title">Software engineering major</p>
         <p>Why do they want to work on this project?</p>
        <p>He wants to be able to help his parents by making the process of taking their medication easier. By making this app he hopes that it will be easier for them to keep track of which medication they still need to take and that it will help them to not forget. </p>
      </div>
    </div>
  </div>

<div class="column">
    <div class="card">
      <div class="container">
        <h2>Surabhi Gupta</h2>
        <p class="title">Software engineering major</p>
         <p>Why do they want to work on this project?</p>
        <p>She believes there are not enough resources for older people to keep track of their healthcare needs. This app will remind them, and also be a beneficial tool for the family members and caretakers to utilize.</p>
      </div>
    </div>
  </div>
  
  <div class="column">
      <div class="card">
      <div class="container">
        <h2>Paul Soriano</h2>
        <p class="title">Software engineering major</p>
         <p>Why do they want to work on this project?</p>
        <p>He sees his grandparents take medication everyday. Sometimes, they ask him to look up what medication they can take for their pains. He hopes to develop this app so he can help his grandparents. Knowing Java and Python, Paul hopes to provide a more efficient way to write code for the project. </p>
      </div>
    </div>
  </div>
  
</body>
</html>