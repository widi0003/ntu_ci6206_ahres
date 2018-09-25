<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script type='text/javascript' src='https://d2jzxcrnybzkkt.cloudfront.net/static/widget_v5/js/lib/jquery.js?date=201809190847'></script>	
<script type='text/javascript' src='https://d2jzxcrnybzkkt.cloudfront.net/static/widget_v5/js/lib/bootstrap.min.js?date=201809190847'></script>	
<script type='text/javascript' src='https://d2jzxcrnybzkkt.cloudfront.net/static/widget_v5/js/app/helper.js?date=201809190847'></script>		        <script type='text/javascript' src='https://d2jzxcrnybzkkt.cloudfront.net/static/widget_v5/js/app/include/showmsg.js?date=201809190847'></script>	
</head>
<style>
	form {
		width: 500px;
		margin: auto;
		line-height: 30px
	}
	label {
		display: inline-block;
		width:100px;	
	}
	input.inputbox {
		width:390px;
	}
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
	<form action="RegisterServlet" method="POST">

		<label>Name : </label> <input class="inputbox" type="text" name="name" size="100" required> <br>
		<label>Email : </label> <input class="inputbox" type="email" name="email" size="100" required> <br>
		<label>Password : </label> <input class="inputbox" type="password" name="password" size="100" required> <br>
		<input type="submit" value="Submit">
		
	</form>

	<%
		}
	%>
</body>
</html>