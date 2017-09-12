<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%String name=(String)session.getAttribute("adminName");
if(name!=null)
{
   response.sendRedirect("adminAccount.jsp");
}
else{
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/logo.png">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/button.css">
</head>

<body>
  <img class="left" src="images/logo.png" alt="EasyBus" width="72" height="48">
   <h1>Easy Bus</h1>
   <hr>
   <br>
   <h3 style="margin:auto; width:200px;font-family:Consolas;">Admin Login</h3>
   <br>
   <form class="form1" method="post" action="AdminLoginCheck" >
      <label><b>UserName</b></label><br>
      <input class="text" type="text" name="userName" placeholder="Enter UserName" required><br>
      <label><b>Password</b></label><br>
      <input class="text" type="password" name="password" placeholder="Enter Password" required><br>
      <button class="btn formBtn" type="submit">Login</button>
   </form>
</body>
</html>
<%}%>