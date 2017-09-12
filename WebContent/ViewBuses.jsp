<%@page import="modal.Bus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Iterator,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buses</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/table.css">
<script src="js/index.js"></script>
</head>
<body>
<%
    String from=request.getParameter("from");
    String to=request.getParameter("to");
    Object obj=request.getAttribute("list");
    @SuppressWarnings("unchecked")
    List<Bus> list=(List<Bus>)obj;
    String name=(String)session.getAttribute("userName");%>
<div class="nav-list" >
 <a class="home" href="index.jsp"> <img src="images/logo.png" alt="EasyBus" width="72" height="48">
    <span class="name">Easy<br>Bus</span></a>
    <a class="nav-content left" href="index.jsp" >Home</a> 
    <span class="nav-content left" onclick="display()">Search</span>
    <a class="nav-content left" href="#c" >Contact Us</a> 
    <a id="sign" class="nav-content right" href="signup.jsp" >SignUp</a>
    <span id="login" class="nav-content right" onclick="document.getElementById('modal').style.display='block'">LogIn</span>
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
	 var name="<%=name%>";
    if(name!="null")
    	{
 	   document.getElementById("sign").style.display="none";
	   document.getElementById("login").style.display="none";
	   document.getElementById("acc").style.display="block";
    	}
 </script>
 
 <div id="sch-form" class="sch-form sch-display">  

      <div class="text"> Online Bus Tickets Booking Made Easy</div>

<form class="form3" method="get" action="Search">
  <label for="date"><b>Date</b></label>
    <input class="inp" type="date" name="date" placeholder="Date of bus" >
    <br><br>
  <label for="from"><b>From</b></label>
    <input class="inp" type="text" name="from" placeholder="From" value="<%if(from!=null) out.println(from);%>">
  &nbsp;&nbsp;&nbsp;<label for="to"><b>To</b></label>
    <input class="inp" type="text" name="to" placeholder="To" value="<%if(to!=null) out.println(to);%>">
    <br><br>
    <button class="btn darkBtn" type="submit">Search</button>
</form>
<br>
</div>
    <br>
     <div class="modal" id="modal">
     <form class="login" method="post" action="Login">
       <label><strong>UserName</strong></label>
       <br>
        <input class="text" type="text" name="uname" placeholder="Enter UserName" required><br>
        <label><b>Password</b></label><br>
        <input class="text" type="password" name="password" placeholder="Enter Password" required><br>
        <button class="btn formBtn" type="submit">Login</button><br><br>
        <button class="btn deleteBtn" onclick="document.getElementById('modal').style.display='none'">Cancel</button>&nbsp;&nbsp;&nbsp;
        <a href="#">Forgot Password</a>
     </form>
     
     <script>
     var modal=document.getElementById('modal');
	   
	   window.onclick = function(event){
		   if(event.target==modal)
		       modal.style.display='none';
		   }
	 </script>
     
  </div> 
    <table class="tbl">
  
    <tr>
       <th>BusID</th>
       <th>Name</th>
       <th>Type</th>
       <th>From</th>
       <th>Departure</th>
       <th>To</th>
       <th>Arrival</th>
       <th>Total Seats</th>
       <th>Description</th>    
   
    </tr>
    <%Iterator<Bus> itr=list.iterator();
    while(itr.hasNext()){
    	Bus b=itr.next();
    	%>
    <tr>
      <td><%=b.getId() %></td>
      <td><%=b.getName() %></td>
      <td><%=b.getType() %></td>
      <td><%=b.getStart() %></td>
      <td><%=b.getDeparture() %></td>
      <td><%=b.getDest() %></td>
      <td><%=b.getArrival() %></td>
      <td><%=b.getNoSeats() %></td>
      <td><%=b.getDescription() %></td>
      <td><form method="post" action="GetBus" onsubmit="return check()">
           <input type="hidden" name="busId" value=<%=b.getId()%>>
           <button class="btn shadowBtn" type="submit">View Seats</button>
            </form></td>
    </tr>
  <%} %>
</table>
    <script>
     function check(){
    	 var nam=<%=name%>;
    	 if(nam==null) 
    	 {
    		 window.alert("User not logged in");
    		 document.getElementById("modal").style.display="block";
    	     return false;
    	 }
     }
    </script>
</body>
</html>