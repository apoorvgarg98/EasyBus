<%@page import="java.util.List"%>
<%@page import="modal.Bus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
String name=(String)session.getAttribute("userName");
if(name==null)
{
	   request.getRequestDispatcher("index.jsp").include(request,response);
	   response.setContentType("text/html");
	   response.getWriter().print("<script>window.alert('User not logged in');</script>");
}
else
{ %>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Easy Bus</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/ViewSeats.css">
<link rel="stylesheet" href="css/table.css">
<script src="js/index.js"></script>
<script src="js/ViewSeats.js"></script>
</head>
<body>
<div class="nav-list">
 <a class="home" href="index.jsp"> <img src="images/logo.png" alt="EasyBus" width="72" height="48">
    <span class="name">Easy<br>Bus</span></a>
    <a class="nav-content left" href="index.jsp" >Home</a> 
    <span class="nav-content left" onclick="display()">Search</span>
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
	         document.getElementById("acc").style.display="block";
    	}
 </script>
 
 <div id="sch-form" class="sch-form">  

      <div class="text"> Online Bus Tickets Booking Made Easy</div>

<form class="form3" method="get" action="Search">
  <label for="date"><b>Date</b></label>
    <input class="inp" type="date" name="date" placeholder="Date of bus" >
    <br><br>
  <label for="from"><b>From</b></label>
    <input class="inp" type="text" name="from" placeholder="From">
  &nbsp;&nbsp;&nbsp;<label for="to"><b>To</b></label>
    <input class="inp" type="text" name="to" placeholder="To">
    <br><br>
    <button class="btn darkBtn" type="submit">Search</button>
</form>
<br>
</div>
    <br>
   <% Bus b=(Bus)request.getAttribute("bus");
	  @SuppressWarnings("unchecked")  
	  List<Integer> dis=(List<Integer>)request.getAttribute("dis");       %>
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
	     </tr>
	  </table>
	  <br>
	 
  <form method="post" id="checkbox" action="BookTicket">
  <input type="hidden" name="busid" value="<%=b.getId()%>">
      <div class="container">
      <div id="box" class="box">
		<script>
		var noSeats=0;
		var n=<%=b.getNoSeats()%>;
		box(n);
		  </script>  
      
      </div>
       <script>
         var arr=[];
         var k=<%=dis.size()%>;
         <% for (int i=0; i<dis.size(); i++) { %>
         arr[<%= i %>] = "<%= dis.get(i) %>"; 
         <% } %>
             
        for(var y=0;y<k;y++)
	    	{ 
        	    var x=arr[y];
	    	    var str="seat";
			    if(x<10)
			       str+="0"+x;
			    else
			       str+=x;
			    var ele=document.getElementById(str);
			    ele.classList.remove('seats');
			    ele.classList.add('disable');
			    ele.style.pointerEvents = 'none';
	      	}
	  </script>
	  
      <div id="btn-div"> 
      <br>
      &nbsp;&nbsp;&nbsp;
      </div>
      </div>
      <div id="pass-form" class="pass-form">
           <div id="pass-detail" class="pass-detail">
            
           
           </div>
    <script>
         var mod=document.getElementById('pass-form');
	     window.onclick = function(event){
		      if(event.target==mod)
			  {
		       mod.style.display='none';
			   var x=document.getElementById("pass-detail");
			   while(x.hasChildNodes())
			   {
				   x.removeChild(x.firstChild);
			   }
			  }
		   }
</script>
	   
     
    </div>
  </form>
</body>
</html>
<%} %>
