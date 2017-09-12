<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   String name=(String)session.getAttribute("adminName");
   if(name==null)
   {
	   request.getRequestDispatcher("AdminLogin.jsp").include(request,response);
	   response.setContentType("text/html");
	   response.getWriter().print("<script>window.alert('Admin not logged in');</script>");
   }
   else
   {
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/logo.png">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/main.css">
</head>

<body>
<img class="left" src="images/logo.png" alt="EasyBus" width="72" height="48">
   <h1>Easy Bus</h1>
   <hr>
   
<nav class="nav-list">
   <a href="adminAccount.jsp" class="rest left">Home</a>
   
   <div class="dropdown">
      <button type="button" class="dropbtn"><b>Bus</b></button>
      <div class="content">
          <a href="addBus.jsp">Add</a>
          <a href="searchBus.jsp">Search</a>
          <a href="getBusEditId.jsp">Edit</a>
      </div>
    </div>
    <div class="dropdown">
       <button type="button" class="dropbtn"><b>Sub-Admin</b></button>
       <div class="content">
          <a href="addSub.jsp">Add</a>
          <a href="removeSub.jsp">Remove</a>
      </div>
    </div>
    
    <a href="AdminSignout" class="right rest">Sign Out</a>
    
</nav>
</body>
</html>
<%}%>