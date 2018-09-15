<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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
	<form action="LoginServlet" method="GET">
		Email : <input type="text" name="email" size="100"><br>
		Password : <input type="password" name="password" size="100">
		<br> <br> <input type="submit" value="Submit">
	</form>

	<%
		}
	%>
</body>
</html>