package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.User;
import database.UserDetails;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String username = request.getParameter("name");
		String cancel = request.getParameter("cancel");

		try {

			if (cancel == null) {
				User user = new User();
				UserDetails userDetails = user.getUserDetails(email);
				userDetails.setContactNo(contact);
				userDetails.setName(username);

				if (user.updateUserDetails(userDetails)) {
					System.out.println(
							"OK setting contact:" + contact + ", username:" + username + " for email:" + email);
				}
				response.sendRedirect("profile.jsp");
			} else {
				response.sendRedirect("editprofile.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
