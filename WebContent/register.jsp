<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<%@include file='templates/head.html'%>
</head>
<body>
	<%@include file='templates/navbar.jsp'%>
	
	<%
		if (email != null) {
			response.sendRedirect("profile.jsp");
			return;
		} else {
	%>
	
	<h2 class="mt-5 formtitle">Please fill in this form to create an account.</h2>
	<form class=" m-auto" action="RegisterServlet" method="POST">

		<div class="form-group">
    		 	<label for="InputName">Name</label>
				<input type="text" name="name" class="form-control" id="InputName"  placeholder="Enter your name" size="100" required>
  			</div>
		<div class="form-group">
    		 	<label for="InputEmail">Email address</label>
				<input type="email" name="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" placeholder="Enter email" size="100" required>
  			</div>
			<div class="form-group">
				<label for="InputPassword">Password</label>
				<input type="password" name="password" size="100" class="form-control" id="InputPassword" placeholder="Password" required>
			</div>
		<input type="submit" class="btn btn-primary" value="Submit">
		
	</form>
	
	<%@include file='templates/footer.html'%>
	
	<%
		}
	%>
</body>
</html>