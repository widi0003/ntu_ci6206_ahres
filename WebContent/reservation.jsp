<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file='templates/head.html'%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>
<title>Reservation</title>
</head>
<body>
	<%@include file='templates/navbar.jsp'%>

	<%
		if (email == null) {
			response.sendRedirect("login.jsp");
			return;
		} else {
	%>

	<div class="container">
		<h2 class="mt-5 formtitle">Make a reservation with us</h2>
		<form action="ReservationServlet" method="GET" class="m-auto pt-3" id="reservation">
			<div class="form-row">
				<div class="form-group col">
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="far fa-calendar-alt"></i>
							</div>
						</div>
						<input id="inputdate" type="text" name="date" class="form-control">
					</div>
				</div>
				<div class="form-group col">
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="far fa-clock"></i>
							</div>
						</div>
						<select class="form-control" name="time" id="inputtime" required>
							<option value="15:00:00" selected>15:00</option>
							<option value="16:00:00">16:00</option>
							<option value="17:00:00">17:00</option>
							<option value="18:00:00">18:00</option>
							<option value="19:00:00">19:00</option>
							<option value="20:00:00">20:00</option>
							<option value="21:00:00">21:00</option>
							<option value="22:00:00">22:00</option>
						</select>
					</div>
				</div>
				<div class="form-group col">
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fas fa-user-alt"></i>
							</div>
						</div>
						<select class="form-control" name="pax" id="inputpax" required>
							<option value="1">1</option>
							<option value="2" selected>2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="9">10</option>
						</select>
					</div>
				</div>
				<div class="form-group ml-1">
					<div class="input-group">
						<button type="submit" class="btn btn-primary">
							<span class="fas fa-search"></span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@include file='templates/footer.html'%>

	<script type="text/javascript">
		$(document).ready(
				function() {
					var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60
							* 1000);
					var day = tomorrow.getDate();
					var month = tomorrow.getMonth() + 1;
					var year = tomorrow.getFullYear();

					$('#inputdate').val(year + '-' + month + '-' + day);
					
					$('#inputdate').datepicker({
						format : 'yyyy-mm-dd',
						startDate : '+1d',
						endDate : '+60d',
						todayHighlight : 'true'
					});

					$('#inputpax').selectpicker();
					
					$('#inputtime').selectpicker();
				});
	</script>

	<%
		}
	%>


</body>
</html>