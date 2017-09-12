<!DOCTYPE html>
<html>
<head>
  <title>Sign Up</title>
  <link rel="shortcut icon" href="images/logo.png" />
  <link rel="stylesheet" href="css/form.css">
  <link rel="stylesheet" href="css/button.css">
  <link rel="stylesheet" href="css/index.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="nav-list">
 <a class="home" href="index.jsp"> <img src="images/logo.png" alt="EasyBus" width="72" height="48">
    <span class="name">Easy<br>Bus</span></a>
<span class="nav-center">Sign Up</span>
 <hr class="line">
 </div>

<div class="form1">
    <form method="post" action="SignUp">
	<label><b>UserName</b></label><br>
	<input required class="text" type="text" name="uname" placeholder="Enter UserName" /><br>
	<label><b>Password</b></label><br>
	<input required class="text" type="password" name="password" placeholder="Enter password"/><br>
	<label><b>Name</b></label><br>
	<input required type="text" class="text" name="name" placeholder="Enter Name"/><br>
	<label><b>Email</b></label><br>
	<input required type="email" name="email" class="text" placeholder="Enter Email"><br>
	<button class="btn formBtn" type="submit">Create Account</button><br>
	</form>
</div>
</body>
</html>