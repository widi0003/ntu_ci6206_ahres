<%@ page import="database.Menu" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file='templates/head.html'%>
<title>Menu</title>
</head>

<body>
	<%@include file='templates/navbar.jsp'%>
	
	<% 
	Menu menu = new Menu();
	%>

	<%@include file='templates/footer.html'%>
</body>
</html>