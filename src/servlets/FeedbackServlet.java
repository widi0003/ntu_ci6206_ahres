package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Feedback;
import database.FeedbackDetails;
import database.User;
import database.UserDetails;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FeedbackServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("email");
		String inputRate = request.getParameter("rate");
		String comments = request.getParameter("comments");

		int userId = 0;
		int id = 0;
		int rate = Integer.parseInt(inputRate);
		String showFlag = "N";

		try {
			User user = new User();
			UserDetails userDetails = user.getUserDetails(email);
			userId = userDetails.getId();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			FeedbackDetails newFeedbackDetails = new FeedbackDetails(id, userId, comments, rate, showFlag);
			Feedback Feedback = new Feedback();
			Feedback.addNewFeedback(newFeedbackDetails);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
