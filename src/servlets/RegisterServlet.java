package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String newUserName = request.getParameter("name");
		String newUserEmail = request.getParameter("email");
		String newUserPassword = request.getParameter("password");

		PrintWriter out = response.getWriter();

		boolean validEmail = true;

		try {
			User newUser = new User();
			validEmail = newUser.checkEmail(newUserEmail);
			if (validEmail) {
				newUser.addNewUser(newUserName, newUserEmail, newUserPassword);
				response.sendRedirect("register-successful.jsp");
			} else {
				request.getRequestDispatcher("register.jsp").include(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
