package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import database.UserDetails;

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

		Date reservedDate = Date.valueOf(date);
		Time reservedTime = Time.valueOf(time);
		int totalPax = Integer.parseInt(pax);

		int userId = 0;
		int id = 0;
		String remarks = "";

		try {
			User user = new User();
			UserDetails userDetails = user.getUserDetails(email);
			userId = userDetails.getId();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			
			
			//Make the Reservation.
			int tableID = 0;
			ReservationDetails newReservationDetails = new ReservationDetails(id, userId, reservedDate, reservedTime,
					totalPax, remarks);
			
			Reservation reservation = new Reservation();
			tableID  = reservation.getAvailableTable(reservedDate, reservedTime, totalPax);
			if (tableID != 0)
			{
				reservation.addNewReservation(newReservationDetails,tableID);
				response.sendRedirect("reserve-successful.jsp");
			}
			else
			{
				request.setAttribute("errorMessage", "We are sorry. There is no available table. Please adjust your search.");
				request.getRequestDispatcher("reservation.jsp").include(request, response);
			}
			

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
