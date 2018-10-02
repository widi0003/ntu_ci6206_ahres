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
    		 	<label for="InputName">Name</label>
    		 	
				<input type="text" name="name" class="form-control" id="InputName"  value=<%=username %> size="100"><span style="text-align:right">Edit Your name</span>
  			</div>
		<div class="form-group">
    		 	<label for="InputEmail">Email address</label>
				<input type="text" name="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" value=<%=email %> size="100" readonly>
  		</div>
  		<div class="form-group">
    		 <label for="InputContactNo">Email address</label>
			<input type="text" name="contact" class="form-control" id="InputContact" aria-describedby="contactHelp" placeholder="Enter Contact Number" size="100" required>
  		</div>
			<div class="form-group">
				<label for="InputPassword">Password</label>
				<input type="password" name="password" size="100" class="form-control" id="InputPassword" placeholder="Password" required>
			</div>
		<input type="submit" class="btn btn-primary" value="Save changes">
		
	</form>
	
	<%@include file='templates/footer.html'%>
	
	<%
		}
	%>
</body>
</html>