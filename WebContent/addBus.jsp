<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminAccount.jsp" %>
<%
   if(name!=null)
   {
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add New Bus</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
</head>
<body>
<br>
<form method="post" action="AddBus" class="form1">
<b>ID</b><br>
<input class="text" type="text" name="id" placeholder="Enter ID" required><br>
<b>Name</b><br>
<input class="text" type="text" name="name" placeholder="Enter Name" required><br>
<b>Type</b><br>
<input class="radio" type="radio" name="type" value="Express" required>Express
<input class="radio" type="radio" name="type" value="Deluxe AC" required>Deluxe AC
<input class="radio" type="radio" name="type" value="Deluxe Non AC" required>Deluxe Non AC
<br><br>
<b>Departure Place</b><br>
<input class="text" type="text" name="start" placeholder="Enter From" required><br>
<b>Destination</b><br>
<input class="text" type="text" name="dest" placeholder="Enter Destination" required><br>
<b>Departure DateTime </b><br>
<input class="text" type="datetime-local" name="departure" placeholder="Enter Departure" required><br>
<b>Arrival DateTime</b><br>
<input class="text" type="datetime-local" name="arrival" placeholder="Enter Arrival" required><br>
<b>No of Seats</b><br>
<input class="text" type="text" name="seats" placeholder="Enter Seats" required><br>
<b>Description(pickup and dropOff)</b>
<input class="text" type="text" name="desc" placeholder="Enter Description" required><br>
<button type="submit" class="btn formBtn">Add</button>
</form>
</body>
</html>
<%}%>