<%@ page import="java.util.Iterator,database.Menu,database.MenuDetails"%>

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
	<h1>Our Menu:</h1>
	<div class="card-columns">
		<%
			Menu menu = new Menu();
			Iterator menuIter = menu.getMenu().iterator();
			{
				int counter = 0;
				while (menuIter.hasNext()) {
					MenuDetails menuItem = (MenuDetails) menuIter.next();
		%>
		<div class="card">
			<img class="card-img-top" src="<%=menuItem.getImage()%>"
				alt="<%=menuItem.getName()%>">
			<div class="card-body">
				<h5 class="card-title"><%=menuItem.getName()%></h5>
				<h6 class="card-subtitle mb-2 text-muted">
					$<%=menuItem.getPrice()%></h6>
				<p class="card-text"><%=menuItem.getDescEng()%></p>

			</div>
			<div class="card-footer">
				<small class="text-muted"><%=menuItem.getType()%></small>
			</div>
		</div>

		<%
			counter++;
				}
			}
		%>
	</div>

	<%@include file='templates/footer.html'%>
</body>
</html>