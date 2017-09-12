<%@page import="java.util.Iterator"%>
<%@page import="modal.Ticket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="subAdminAccount.jsp" %>
<%if(name!=null){ 
 Object obj=request.getAttribute("list");
    @SuppressWarnings("unchecked")
    List<Ticket> list=(List<Ticket>)obj;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/table.css">
</head>
<body><br>
<table class="tbl"> 
   <tr>
       <th>User</th>
       <th>ID</th>
       <th>Name</th>
       <th>Age</th>
       <th>Seat</th>
   </tr>
   <%Iterator<Ticket> itr=list.iterator();
    while(itr.hasNext()){
    	Ticket t=itr.next();
    	%>
    <tr>
      <td><%=t.getUser().getUserName() %></td>
      <td><%=t.getId() %></td>
      <td><%=t.getName() %></td>
      <td><%=t.getAge() %></td>
      <td><%=t.getSeat() %></td>
      </tr>
  <%} %>
</table>
</body>
</html>
<%}%>