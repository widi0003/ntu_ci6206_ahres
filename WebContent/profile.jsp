<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.sql.Date,database.User,database.UserDetails"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file='templates/head.html'%>
<title>Profile</title>
</head>
<body>

	<%@include file='templates/navbar.jsp'%>

	<%
		if (email != null) {

			String contactNo = "";
			Date createdDate = null;
			try {
				User user = new User();
				UserDetails userDetails = user.getUserDetails(email);
				contactNo = userDetails.getContactNo();
				createdDate = userDetails.getCreatedDate();

				session.setAttribute("contactno", contactNo);

			} catch (Exception e1) {
				e1.printStackTrace();
			}
	%>
	<div class="container pt-5">
		<div class="row align-items-center">
			<h2 class="m-auto">
				<span style="color: #0b5680"> <%=username%>'s profile
				</span>
			</h2>
		</div>
	</div>
	<%
		if (createdDate != null) {
	%><br>
	<div class="profile-item" style="font-weight: normal">
		Member since
		<%=createdDate%></div>
	<%
		}
	%>
	<br>
	<div class="profile-item">Name:</div>
	<div class="profile-value">
		<%=username%>
	</div>
	<br>
	<div class="profile-item">Email:</div>
	<div class="profile-value">
		<%=email%>
	</div>
	<br>
	<div class="profile-item">Mobile:</div>
	<div class="profile-value">
		<%=contactNo%>
	</div>
	<br>


	<%
		} else {
			response.sendRedirect("login.jsp");
			return;
		}
	%>
	<center>
		<button onclick="window.location.href='editprofile.jsp'"
			class="btn btn-primary">Edit Profile</button>
	</center>

	<%@include file='templates/footer.html'%>

</body>
</html>