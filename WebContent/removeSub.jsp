<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminAccount.jsp" %>
<%if(name!=null)
   {%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
<title>Insert title here</title>
</head>
<body>
<br>
<form class="form1" method="post" action="RemoveSub" >
      <label><b>UserName</b></label><br>
      <input class="text" type="text" name="userName" placeholder="Enter UserName" required><br>
      <button class="btn formBtn" type="submit">Remove</button>
   </form>
</body>
</html>
<%}%>