<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminAccount.jsp" %>
<%
   if(name!=null)
   {	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/form.css">

<title>Insert title here</title>
</head>
<body>
<br>
<form class="form1" method="post" action="GetEditParam">
           <input class="text" type="text" name="busId" placeholder="Enter Bus ID" required>
           <button class="btn shadowBtn" type="submit">Edit</button>
</form>

</body>
</html>
<%}%>