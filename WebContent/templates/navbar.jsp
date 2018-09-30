<%@ page import="database.User"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="login-navigation">
	<a class="navbar-brand" href="#">
		<img src="assets/icons/ah_icon.png" width="30" height="30" class="d-inline-block align-top" alt="">
		Ah Ha Restaurant
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
	<div class="collapse navbar-collapse" id="navbarToggler">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link active" href="menu.jsp">Menu</a></li>
			<li class="nav-item"><a class="nav-link active">Promotions</a></li>
		</ul>

		<%
			String email_address = (String) session.getAttribute("email_address");
			String username = "Phantomas";
		%>
		<%
			if (email_address == null) { 
		%>

		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link active" id="login" href="login.jsp" >Login</a></li>
			<li class="nav-item">
				<a class="nav-link active" href="register.jsp">Register</a></li>
		</ul>

		<% 
			} else { 
				try {
					User user = new User();
					username = user.getName(email_address);
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			
		%>

    	<ul class="navbar-nav">
    		<li class="nav-item">
    			<div class="btn-group">
  					<button  id="navbarusername"class="btn btn-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    					<%= username %> 
  					</button >
  				
  					<div class="dropdown-menu dropdown-menu-right" >
    					<a class="dropdown-item" href="profile.jsp"> 
							My profile
						</a>
    					<a class="dropdown-item" href="#">
    						My reservations
    					</a>
    					<div class="dropdown-divider"></div>
    					<a class="dropdown-item" href="LogoutServlet">
    						Logout
    					</a>
 					 </div>
				</div>
			</li>	
		</ul>
		
    	<% 
			} 		
		%>
		
	</div>
</nav>
