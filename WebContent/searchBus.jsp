<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminAccount.jsp" %>
<%
   if(name!=null)
   {
	   String from=request.getParameter("from");
	   String to=request.getParameter("to");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add New Bus</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/logo.png">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
</head>
<body>
<br>

<form class="form2" method="get" action="SearchBus">
  <label for="date"><b>On</b></label>
    <input type="date" name="date" placeholder="Date of bus" required>
  <label for="from"><b>From</b></label>
    <input type="text" name="from" placeholder="From" value="<%if(from!=null) out.println(from);%>" required>
  <label for="to"><b>To</b></label>
    <input type="text" name="to" placeholder="To" value="<%if(to!=null) out.println(to);%>" required>
    <button class="btn formBtn" type="submit">Search</button>    
</form>

</body>
</html>

<%}%>