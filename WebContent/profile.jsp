<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page
	import="java.util.Iterator,database.User,database.Reservation,database.ReservationDetails"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file='templates/head.html'%>
<title>Profile</title>
</head>
<body>

	<%@include file='templates/navbar.jsp'%>

	<%
		if (email != null & isAdmin) {
	%>
	<h1>
		Welcome
		<%=username%>!
	</h1>
	<h2>Reservations:</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Name</th>
				<th scope="col">Contact No</th>
				<th scope="col">Email</th>
				<th scope="col">Date</th>
				<th scope="col">Time</th>
				<th scope="col">Pax</th>
				<th scope="col">Remarks</th>
				<th scope="col">Table Id</th>
				<th scope="col">Table Capacity</th>
			</tr>
		</thead>
		<tbody>

			<%
				Reservation reservation = new Reservation();
					Iterator reservIter = reservation.getReservations().iterator();

					while (reservIter.hasNext()) {
						ReservationDetails reservDetails = (ReservationDetails) reservIter.next();
			%>
			<tr>
				<th scope="row"><%=reservDetails.getReservationId()%></th>
				<td><%=reservDetails.getUserName()%></td>
				<td><%=reservDetails.getUserContactNo()%></td>
				<td><%=reservDetails.getUserEmail()%></td>
				<td><%=reservDetails.getReservedDate()%></td>
				<td><%=reservDetails.getReservedTime()%></td>
				<td><%=reservDetails.getTotalPax()%></td>
				<td><%=reservDetails.getRemarks()%></td>
				<td><%=reservDetails.getTableId()%></td>
				<td><%=reservDetails.getTableCapacity()%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>
	<%
		} else if (email != null & !isAdmin) {
	%>
	<p>
		Welcome
		<%=username%>!
	</p>
	<%
		} else {
			response.sendRedirect("login.jsp");
			return;
		}
	%>

	<%@include file='templates/footer.html'%>

</body>
</html>