package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.User;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newpassword");
		String repeatNewPassword = request.getParameter("repeatnewpassword");
		String cancel = request.getParameter("cancel");

		request.setAttribute("password", password);
		request.setAttribute("newPassword", newPassword);
		request.setAttribute("repeatNewPassword", repeatNewPassword);

		System.out.println("password:" + password + ", new password:" + newPassword + ", repeat new password: "
				+ repeatNewPassword);

		boolean result = false;
		try {
			if (cancel == null) {
				System.out.println("email: " + email);
				if (email != null) {
					User user = new User();
					result = user.authenticate(email, password);

					if (result) {
						if (newPassword.equals(repeatNewPassword) && !newPassword.equals(password)) {
							request.setAttribute("password", null);
							request.setAttribute("newPassword", null);
							request.setAttribute("repeatNewPassword", null);
							if (user.updatePassword(email, newPassword)) {

								Cookie emailCookie = new Cookie("email", email);
								Cookie passwordCookie = new Cookie("password", password);
								emailCookie.setMaxAge(0); // Clear the cookie
								passwordCookie.setMaxAge(0);
								response.addCookie(emailCookie);
								response.addCookie(passwordCookie);
								System.out.println("Removed email Cookie and Password Cookie");

								System.out.println("Updated password");
								session.setAttribute("email", null);
								session.setAttribute("contactno", null);
								session.setAttribute("username", null);
								request.setAttribute("changepassword", "Password changed. Please relogin");
								request.getRequestDispatcher("login.jsp").include(request, response);

							} else {
								System.out.println("Failed to Update password");

							}
						} else {
							request.setAttribute("differentPassword", "Invalid new password");
							request.getRequestDispatcher("changepassword.jsp").include(request, response);
						}
					} else {
						request.setAttribute("errorOldPassword", "Please enter a correct password");
						request.getRequestDispatcher("changepassword.jsp").include(request, response);
					}

				} else {
					response.sendRedirect("login.jsp");
				}
			} else {
				response.sendRedirect("changepassword.jsp");
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
