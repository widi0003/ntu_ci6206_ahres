<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>

<link rel='stylesheet' href="global.css" type='text/css' />
</head>
<style>

</style>
<body>
	<%
		String email = (String) session.getAttribute("email");
	%>
	<%
		if (email != null) {
			response.sendRedirect("profile.jsp");
			return;
		} else {
	%>
	
	<%@include file='templates/header.html'%>
	<h2 id="topheader">Please fill in this form to create an account.</h2>
	<form action="RegisterServlet" method="POST">

		<label>Name : </label> <input class="inputbox" type="text" name="name" size="100" required> <br>
		<label>Email : </label> <input class="inputbox" type="email" name="email" size="100" required> <br>
		<label>Password : </label> <input class="inputbox" type="password" name="password" size="100" required> <br>
		<input type="submit" value="Submit">
		
	</form>
	<%@include file='templates/footer.html'%>
	
	<%
		}
	%>
</body>
</html>