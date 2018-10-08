<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Change Password</title>
<%@include file='templates/head.html'%>
</head>
<body>
	<%@include file='templates/navbar.jsp'%>

	<%
		if (email == null) {
			response.sendRedirect("login.jsp");
			return;
		} else {
			
			String password = "";
			String newPassword = "";
			String repeatNewPassword = "";
			
			if (request.getAttribute("password") != null) {
				password = (String)request.getAttribute("password");
			}
			
			if (request.getAttribute("newPassword") != null) {
				newPassword = (String)request.getAttribute("newPassword");
			}
			
			if (request.getAttribute("repeatNewPassword") != null) {
				repeatNewPassword = (String)request.getAttribute("repeatNewPassword");
			}
	%>

	<h2 class="mt-5 formtitle">Change Password</h2>
	<form class=" m-auto" action="ChangePasswordServlet" method="POST">

		<div class="form-group">
			<label for="OldPassword">Old Password</label> <input type="password"
				name="password" class="form-control" id="OldPassword"
				title="Enter Your Old Password" size="100" required
				value=<%=password%>>
			<%
				if (request.getAttribute("errorOldPassword") != null) {
				%>
			<div id="errpass"><%=request.getAttribute("errorOldPassword")%></div>
			<%} 
				else { %>
			<small id="oldpassword-help" class="form-text text-muted">Enter
				your old password</small>
			<% } %>
		</div>
		<div class="form-group">
			<label for="NewPassword">New Password</label> <input type="password"
				name="newpassword" class="form-control" id="NewPassword" size="100"
				required value=<%=newPassword%>>
			<%
					if (request.getAttribute("differentPassword") != null) {
				%>
			<div id="errpass"><%=request.getAttribute("differentPassword") %></div>
			<%} 
				else { %>
			<small id="newpassword-help" class="form-text text-muted">Enter
				your new password</small>
			<% } %>
		</div>
		<div class="form-group">
			<label for="RepeatNewPassword">Repeat</label> <input type="password"
				name="repeatnewpassword" class="form-control" id="RepeatNewPassword"
				size="100" required value=<%=repeatNewPassword%>>
			<%
					if (request.getAttribute("differentPassword") != null) {
				%>
			<div id="errpass"><%=request.getAttribute("differentPassword") %></div>
			<%} 
				else { %>
			<small id="newpassword-help" class="form-text text-muted">Repeat
				your new password</small>
			<% } %>

		</div>

		<input type="submit" class="btn btn-primary" value="Save changes">
		<input type="submit" class="btn btn-primary" value="Cancel"
			name="cancel" value="yes">

	</form>

	<%@include file='templates/footer.html'%>

	<%
		}
	%>
</body>
</html>