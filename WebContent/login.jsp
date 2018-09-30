<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file='templates/head.html'%>
	<title>Login</title>
</head>

<body>
	<%@include file='templates/navbar.jsp'%>
	
	<%
		if (email_address != null) {
			response.sendRedirect("profile.jsp");
			return;
		} else {
	%>
	
	<div class="container">
		<h2 class="mt-5 formtitle">Login</h2>
		<form action="LoginServlet" method="GET" class="m-auto">
			<div class="form-group">
    		 	<label for="Inputemail_address1">email_address address</label>
				<input type="email_address" name="email_address" class="form-control" id="Inputemail_address1" aria-describedby="email_addressHelp" placeholder="Enter email_address" size="100" required>
    			<small id="email_addressHelp" class="form-text text-muted">We'll never share your email_address with anyone else.</small>
  			</div>
			<div class="form-group">
				<label for="InputPassword1">Password</label>
				<input type="password" name="password" size="100" class="form-control" id="InputPassword1" placeholder="Password" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	
	<%
		}
	%>
	<%@include file='templates/footer.html'%>
</body>
</html>