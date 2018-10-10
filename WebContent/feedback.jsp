<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
<%@include file='templates/head.html'%>
<script type="text/javascript">
	$(document).ready(function() {

		$('#stars li').on('mouseover', function() {
			var onStar = parseInt($(this).data('value'));

			$(this).parent().children('li.star').each(function(e) {
				if (e < onStar) {
					$(this).addClass('hover');
				} else {
					$(this).removeClass('hover');
				}
			});
		}).on('mouseout', function() {
			$(this).parent().children('li.star').each(function(e) {
				$(this).removeClass('hover');
			});
		});

		$('#stars li').on('click', function() {

			var onStar = parseInt($(this).data('value'));
			var stars = $(this).parent().children('li.star');

			for (i = 0; i < stars.length; i++) {
				$(stars[i]).removeClass('selected');
			}

			for (i = 0; i < onStar; i++) {
				$(stars[i]).addClass('selected');
			}

		});

		$('#feedback-success').on('hidden.bs.modal', function(e) {
			$(location).attr('href', 'index.jsp');
		});
	});

	function validate() {
		var isValid = false;
		var stars = $('li.star').children('input');
		for (i = 0; i < stars.length; i++) {
			if ($(stars[i]).prop("checked") == true) {
				isValid = true;
				break;
			}
		}

		if (isValid == true) {
			//$("#feedback").submit();
			sendRequest();
		} else {
			$('#rate-warning').css('display', 'block');
		}
	}

	function initRequest() {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			isIE = true;
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function sendRequest() {
		var rate = 0;
		var stars = $('li.star').children('input');
		for (i = 0; i < stars.length; i++) {
			if ($(stars[i]).prop("checked") == true) {
				rate = $(stars[i]).val();
				break;
			}
		}

		var comments = $('#feedbackcomments').val();
		var url = "FeedbackServlet?rate=" + rate + "&comments="
				+ escape(comments);
		var req = initRequest();
		req.onreadystatechange = function() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					$('#feedback-success').modal('show');
				}
			}
		};
		req.open("GET", url, true);
		req.send(null);
	}
</script>
</head>
<body>
	<%@include file='templates/navbar.jsp'%>

	<%
		if (email == null) {
			response.sendRedirect("login.jsp");
			return;
		} else {
	%>

	<h2 class='formtitle mt-5'>Feedback</h2>

	<form action="FeedbackServlet" method="GET" class="m-auto pt-3"
		id="feedback">
		<div class="alert alert-warning" role="alert" id="rate-warning">
			Please rate for us</div>
		<div class='rating-stars text-center form-group'>
			<ul id='stars' class='p-0'>
				<li class='star' title='Poor' data-value='1'><input
					class="form-check-input checkbox-rate star" type="radio" name="rate"
					value="1" id="star-1"> <label for="star-1"><i
						class='fa fa-star fa-fw'></i></label></li>
				<li class='star' title='Fair' data-value='2'><input
					class="form-check-input checkbox-rate star" type="radio" name="rate"
					value="2" id="star-2"> <label for="star-2"><i
						class='fa fa-star fa-fw'></i></label></li>
				<li class='star' title='Good' data-value='3'><input
					class="form-check-input checkbox-rate star" type="radio" name="rate"
					value="3" id="star-3"> <label for="star-3"><i
						class='fa fa-star fa-fw'></i></label></li>
				<li class='star' title='Excellent' data-value='4'><input
					class="form-check-input checkbox-rate star" type="radio" name="rate"
					value="4" id="star-4"> <label for="star-4"><i
						class='fa fa-star fa-fw'></i></label></li>
				<li class='star' title='Perfect' data-value='5'><input
					class="form-check-input checkbox-rate star" type="radio" name="rate"
					value="5" id="star-5"> <label for="star-5"><i
						class='fa fa-star fa-fw'></i></label></li>
			</ul>
		</div>

		<div class="form-group">
			<label for="feedbackComments">Please tell us your comments:</label>
			<textarea class="form-control" id="feedbackcomments" name="comments"
				rows="3"></textarea>
		</div>
		<div class="form-group ml-1">
			<div class="text-center">
				<input type="button" value="Submit" onclick="validate()"
					class="btn btn-primary d-inline-block">
			</div>
		</div>
	</form>
	<div class="modal fade" id="feedback-success" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">Thank you
						for your feedback</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Thank you for taking the time to provide
					us with your feedback. We are looking forward to see you again in the
					near future!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file='templates/footer.html'%>
	<%
		}
	%>

</body>
</html>