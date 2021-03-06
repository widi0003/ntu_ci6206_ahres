<%@ page import="database.User,database.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light"
	id="login-navigation">
	<a class="navbar-brand" href="#"> <img
		src="assets/icons/ah_icon.png" width="30" height="30"
		class="d-inline-block align-top" alt=""> Ah Ha Restaurant
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarToggler" aria-controls="navbarToggler"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarToggler">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link active" href="menu.jsp">Menu</a></li>
			<li class="nav-item"><a class="nav-link active">Promotions</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="reservation.jsp">Reservation</a></li>
		</ul>

		<%
			String email = (String) session.getAttribute("email");
			String username = "Phantomas";
			boolean isAdmin = false;
			int userId = 0;
		%>
		<%
			if (email == null) {
		%>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" id="login"
				href="login.jsp">Login</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="register.jsp">Register</a></li>
		</ul>

		<%
			} else {
				try {
					User user = new User();
					UserDetails userDetails = user.getUserDetails(email);
					userId = userDetails.getId();
					username = userDetails.getName();
					isAdmin = user.isAdmin(email);

				} catch (Exception e1) {
					e1.printStackTrace();
				}
		%>

		<ul class="navbar-nav">
			<li class="nav-item">
				<div class="btn-group">
					<button id="navbarusername" class="btn btn-link dropdown-toggle"
						href="#" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<%=username%>
					</button>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="profile.jsp">Profile</a> <a
							class="dropdown-item" href="editprofile.jsp">Edit Profile</a> <a
							class="dropdown-item" href="changepassword.jsp">Change
							Password</a> <a class="dropdown-item" href="reservations.jsp">Reservations</a>
						<a class="dropdown-item" href="feedback.jsp">Feedback</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="LogoutServlet">Logout</a>
					</div>
				</div>
			</li>
		</ul>

		<%
			}
		%>

	</div>
</nav>
