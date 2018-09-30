package servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		String email_address = request.getParameter("email_address");
		String password = request.getParameter("password");
		boolean result = false;

		try {
			User user = new User();
			result = user.authenticate(email_address, password);
		} catch (Exception e) {
			e.printStackTrace();

		}

		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("email_address", email_address);
			response.sendRedirect("profile.jsp");

		} else {
			response.sendRedirect("login.jsp");
		}
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
