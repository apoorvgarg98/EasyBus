<%@page import="modal.Bus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminAccount.jsp" %>
<%
   if(name!=null)
   {
	   Bus b=(Bus)request.getAttribute("bus");
	   if(b!=null)
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
<div class="form1">
<form method="post" action="SaveEditBus">
<input type="hidden" name="oid" value="<%=b.getId()%>">
<b>ID</b><br>
<input class="text" type="text" name="id" value="<%=b.getId()%>" required><br>
<b>Name</b><br>
<input class="text" type="text" name="name" value="<%=b.getName()%>"  required><br>
<b>Type</b><br>
<input class="radio" type="radio" name="type" value="Express" required>Express
<input class="radio" type="radio" name="type" value="Deluxe AC" required>Deluxe AC
<input class="radio" type="radio" name="type" value="Deluxe Non AC" required>Deluxe Non AC
<br><br>
<b>Departure Place</b><br>
<input class="text" type="text" name="start" value="<%=b.getStart()%>" required><br>
<b>Destination</b><br>
<input class="text" type="text" name="dest"  value="<%=b.getDest()%>" required><br>
<b>Departure DateTime</b><br>
<input class="text" type="datetime-local" name="departure" value="<%=b.getDeparture()%>" required><br>
<b>Arrival DateTime</b><br>
<input class="text" type="datetime-local" name="arrival" value="<%=b.getArrival()%>" required><br>
<b>No of Seats</b><br>
<input class="text" type="text" name="seats" value="<%=b.getNoSeats()%>" required><br>
<b>Description(pickup and dropOff)</b>
<input class="text" type="text" name="desc" value="<%=b.getDescription()%>" required><br>
<button type="submit" class="btn formBtn">Update</button>
</form>
<br>
<form method="post" action="DeleteBus">
<input type="hidden" name="id" value=<%=b.getId() %>>
<button type="submit" class="btn deleteBtn">Delete</button>
</form>
</div>
</body>
</html>
<%}}%>