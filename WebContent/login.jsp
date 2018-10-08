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
		if (email != null) {

			response.sendRedirect("profile.jsp");
			return;
		} else {

			Cookie cookie = null;
			Cookie[] cookies = null;
			String emailCookie = "";
			String passwordCookie = "";
	%>

	<div class="container">
		<h2 class="mt-5 formtitle">Login</h2>
		<form action="LoginServlet" method="POST" class=" m-auto">
			<%
				if (request.getAttribute("errorMessage") != null) {
			%>
			<div class="alert alert-warning" role="alert">
				<%=request.getAttribute("errorMessage")%>
			</div>
			<%
				}
			%>
			<%
				if (request.getAttribute("registrationMessage") != null) {
			%>
			<div class="alert alert-success" role="alert"><%=request.getAttribute("registrationMessage")%></div>
			<%
				}
			%>
			<%
				if (request.getAttribute("changepassword") != null) {
			%>
			<div class="alert alert-success" role="alert"><%=request.getAttribute("changepassword")%></div>
			<%
				} else {
						cookies = request.getCookies();
						if (cookies != null) {
							for (int i = 0; i < cookies.length; i++) {
								cookie = cookies[i];
								if (cookie.getName().equals("email")) {
									emailCookie = cookie.getValue();
								} else if (cookie.getName().equals("password")) {
									passwordCookie = cookie.getValue();
								}
							}
						}
					}
			%>
			<div class="form-group">
				<label for="InputEmail1">Email address</label> <input type="email"
					name="email" class="form-control" id="InputEmail1"
					aria-describedby="emailHelp" placeholder="Enter email" size="100"
					required value=<%=emailCookie%>> <small id="emailHelp"
					class="form-text text-muted">We'll never share your email
					with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="InputPassword1">Password</label> <input type="password"
					name="password" size="100" class="form-control" id="InputPassword1"
					placeholder="Password" required value=<%=passwordCookie%>>
			</div>
			<div class="form-group">
				<input type="checkbox" name="remember" value="RememberMe"
					<%if (emailCookie.length() > 0) {%> checked <%}%>>Remember
				me next time<br>
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