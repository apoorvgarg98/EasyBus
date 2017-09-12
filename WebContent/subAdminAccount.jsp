<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   String name=(String)session.getAttribute("subAdminName");
   if(name==null)
   {
	   request.getRequestDispatcher("SubAdminLogin.jsp").include(request,response);
	   response.setContentType("text/html");
	   response.getWriter().print("<script>window.alert('SubAdmin not logged in');</script>");
   }
   else  
   {
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Sub Admin Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/logo.png">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
</head>

<body>
<img class="left" src="images/logo.png" alt="EasyBus" width="72" height="48">
   <h1>Easy Bus</h1>
   <hr>

<nav class="nav-list">
    <span class="wel">Welcome <%out.print(name); %></span>
    <a href="SubAdminSignOut" class="right rest">Sign Out</a>    
</nav>
<br>
<%String i=request.getParameter("id"); %>
<form class="form1" method="get" action="GetList">
   <b>Bus Id</b>
   <input class="text" type="text" name="id" placeholder="Enter Bus ID" required value="<%if(i!=null) out.println(i);%>">
   <button type="submit" class="btn formBtn">Get List</button>
</form>

</body>
</html>
<%}%>