<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>EasyBus</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
<script src="js/index.js"></script>
</head>

<body>

<%String name=(String)session.getAttribute("userName");%>
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
  

 <div id="sch-form" class="sch-form">  

      <div class="text"> Online Bus Tickets Booking Made Easy</div>

<form class="form3" method="get" action="Search">
  <label for="date"><b>Date</b></label>
    <input class="inp" type="date" name="date" placeholder="Date of bus" required>
    <br><br>
  <label for="from"><b>From</b></label>
    <input class="inp" type="text" name="from" placeholder="From" required>
  &nbsp;&nbsp;&nbsp;<label for="to"><b>To</b></label>
    <input class="inp" type="text" name="to" placeholder="To" required>
    <br><br>
    <button class="btn darkBtn" type="submit">Search</button>
    
</form>
<br>
</div>
<br>
<div class="slideshow-container">
   <div class="mySlides fade">
      <div class="numbertext">1/4</div>
	  <img class="pic" src="images/1.png" style="width:100%">
   </div>
   <div class="mySlides fade">
      <div class="numbertext">2/4</div>
	  <img class="pic" src="images/2.png" style="width:100%">
   </div>
   <div class="mySlides fade">
      <div class="numbertext">3/4</div>
	  <img class="pic" src="images/3.png" style="width:100%">
   </div>
   <div class="mySlides fade">
      <div class="numbertext">4/4</div>
	  <img class="pic" src="images/4.png" style="width:100%">
   </div>
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>   
</div>

  <div class="modal" id="modal">
     <form class="login" method="post" action="Login">
       <label><strong>UserName</strong></label>
       <br>
        <input class="text" type="text" name="uname" placeholder="Enter UserName" required><br>
        <label><b>Password</b></label><br>
        <input class="text" type="password" name="password" placeholder="Enter Password" required><br>
        <button class="btn formBtn" type="submit">Login</button><br><br>
        <button class="btn deleteBtn" onclick="document.getElementById('modal').style.display='none'">Cancel</button>&nbsp;&nbsp;&nbsp;

     </form>
     
     <script>
     var index=0;
     showslides();
  
     var modal=document.getElementById('modal');
	   
	   window.onclick = function(event){
		   if(event.target==modal)
		       modal.style.display='none';
		   }
	 </script>
     
  </div> 
<div id="c" class="contact">
<hr class="line">
   <h3>Contact Us</h3>
   Apoorv Garg<br>
   apoorvgarg98@gmail.com<br>
   9811519971
</div>
</body>
</html>