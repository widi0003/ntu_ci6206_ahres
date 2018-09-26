<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="database.User"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file='templates/head.html'%>
	<title>Profile</title>	
</head>
<body>
	<% 
		String email = (String) session.getAttribute("email");
		String username = "Phantomas";
		try {
			User user = new User();
			username = user.getName(email);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}%>
	<% if (email != null) { %>
	<%@include file='templates/header_logged_in.html'%>
	<p>
		Welcome
		<%= username %>!
	</p>
	<% } else {
	response.sendRedirect("login.jsp");
	return;
}
 %>
<%@include file='templates/footer.html'%>
	
</body>
</html>