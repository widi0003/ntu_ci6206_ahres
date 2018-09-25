<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel='stylesheet' href="global.css" type='text/css' />
</head>
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
	<h2 id="topheader">Login</h2>
	<form action="LoginServlet" method="GET">
		<label>Email : </label> <input class="inputbox" type="email" name="email" size="100" required><br>
		<label>Password : </label> <input class="inputbox" type="password" name="password" size="100" required> <br>
		<input type="submit" value="Submit">
	</form>
	<%@include file='templates/footer.html'%>
	
	<%
		}
	%>
</body>
</html>