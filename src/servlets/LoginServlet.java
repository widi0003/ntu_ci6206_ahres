package servlets;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import database.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("remember");

		boolean result = false;

		try {
			User user = new User();
			result = user.authenticate(email, password);
			if (result) {
				if (rememberMe != null && rememberMe.equals("RememberMe")) {
					Cookie emailCookie = new Cookie("email", email);
					Cookie passwordCookie = new Cookie("password", password);
					emailCookie.setMaxAge(24 * 60 * 60); // 1 day
					passwordCookie.setMaxAge(24 * 60 * 60);
					response.addCookie(emailCookie);
					response.addCookie(passwordCookie);
					System.out.println("Added email Cookie and Password Cookie");
				} else {
					Cookie emailCookie = new Cookie("email", email);
					Cookie passwordCookie = new Cookie("password", password);
					emailCookie.setMaxAge(0); // Clear the cookie
					passwordCookie.setMaxAge(0);
					response.addCookie(emailCookie);
					response.addCookie(passwordCookie);
					System.out.println("Removed email Cookie and Password Cookie");
				}
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				if (user.isAdmin(email)) {
					response.sendRedirect("reservations.jsp");
				} else {
					response.sendRedirect("profile.jsp");
				}

			} else {
				request.setAttribute("errorMessage", "Incorrect email or password. Please try again.");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}