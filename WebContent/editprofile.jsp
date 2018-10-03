<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<%@include file='templates/head.html'%>
</head>
<body>
	<%@include file='templates/navbar.jsp'%>

	<%
		if (email == null) {
			response.sendRedirect("login.jsp");
			return;
		} else {
	%>

	<h2 class="mt-5 formtitle">Edit Your Profile</h2>
	<form class=" m-auto" action="EditProfileServlet" method="POST">

		<div class="form-group">
			<label for="InputName">Name</label> <input type="text" name="name"
				class="form-control" id="InputName" value=<%=username %>
				title="Edit your name" size="100" required> <small
				id="username-help" class="form-text text-muted">Edit your
				name</small>

		</div>
		<div class="form-group">
			<label for="InputEmail">Email address</label> <input type="text"
				name="email" class="form-control" id="InputEmail"
				aria-describedby="emailHelp" value=<%=email %> size="100" readonly>
			<small id="email-help" class="form-text text-muted">You
				cannot change your email</small>
		</div>
		<div class="form-group">
			<label for="InputContactNo">Contact Number</label> <input type="text"
				name="contact" class="form-control" id="InputContact"
				aria-describedby="contactHelp"
				value=<%=(String)session.getAttribute("contactno") %> size="100"
				required> <small id="contact-help"
				class="form-text text-muted">Change your contact number</small>

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