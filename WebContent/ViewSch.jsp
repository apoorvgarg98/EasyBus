<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="utility.HibernateUtil"%>
<%@page import="adminBusinessService.BusCRUD"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.Ticket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
String name=(String)session.getAttribute("userName");
if(name==null)
{
	   request.getRequestDispatcher("index.jsp").include(request,response);
	   response.setContentType("text/html");
	   response.getWriter().print("<script>window.alert('User not logged in');</script>");
}
else
{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Easy Bus</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/table.css">
</head>
<body>
<div class="nav-list">
 <a class="home" href="index.jsp"> <img src="images/logo.png" alt="EasyBus" width="72" height="48">
    <span class="name">Easy<br>Bus</span></a>
    <a class="nav-content left" href="index.jsp" >Home</a> 
    <span id="acc" class="dropdown">
       <button class="dropbtn"><%out.println(name); %>&#x25BC;</button>
       <span class="content">
       <a href="ViewSch.jsp">Schedule</a>
       <a href="LogOut">SignOut</a>
       </span>
       </span>
    <hr class="line">
 </div>
 <script>
    document.getElementById("acc").style.display="block";
 </script>
 <br>
 <table class="tbl"> 
   <tr>
       <th>Bus Name</th>
       <th>Departure DateTime</th>
       <th>ID</th>
       <th>Name</th>
       <th>Age</th>
       <th>Seat</th>
   </tr>
  
   <%
   Session ses=HibernateUtil.getSession();
   Query q=ses.createQuery("from Ticket where userid=:id");
	q.setParameter("id",name);
	@SuppressWarnings("unchecked")
   List<Ticket> list=q.list();
	Iterator<Ticket> itr=list.iterator();
    while(itr.hasNext()){
    	Ticket t=itr.next();
    	%>
    <tr>
      <td><%=t.getBus().getName()%></td>
      <td><%=t.getBus().getDeparture() %></td>
      <td><%=t.getId() %></td>
      <td><%=t.getName() %></td>
      <td><%=t.getAge() %></td>
      <td><%=t.getSeat() %></td>
      <td><form method="post" action="CancelTicket">
       <input type="hidden" name="id" value="<%=t.getId()%>">
       <button type="submit" class="btn deleteBtn">Cancel</button>
      </form></td>
      </tr>
  <%} 
   HibernateUtil.closeSession(ses);
  %>
</table>

</body>
</html>
<%}%>