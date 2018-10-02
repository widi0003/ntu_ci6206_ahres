package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import database.User;
import database.ReservationDetails;
import database.Reservation;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("email");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String pax = request.getParameter("pax");

		Date reserved_date = Date.valueOf(date);
		Time reserved_time = Time.valueOf(time);
		int total_pax = Integer.parseInt(pax);

		int user_id = 0;

		try {
			User user = new User();
			user_id = user.getId(email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			ReservationDetails newReservationDetails = new ReservationDetails(user_id, reserved_date, reserved_time,
					total_pax);
			Reservation reservation = new Reservation();
			reservation.addNewReservation(newReservationDetails);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
