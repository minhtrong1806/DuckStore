package servlets.admin;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import DAO.UserAccountDAO;
import bean.UserAccount;
import utils.ValidatorUtils;

@WebServlet({ "/admin-user/add" })
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-user.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String errorString = "";
		String userNameMessage = "";
		String emailMessage = "";
		String passwordMessage = "";
		boolean hasError = false;
		boolean addSuccess = false;

		String userName = request.getParameter("userName");
		String emailAddress = request.getParameter("emailAddress");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		String passwordRepeat = request.getParameter("passwordRepeat");

		int role = 2;
		try {
			role = Integer.parseInt(request.getParameter("role"));
		} catch (Exception e) {
		}

		if (userName == null || userName.isEmpty() || emailAddress == null || emailAddress.isEmpty()
				|| phoneNumber == null || phoneNumber.isEmpty() || password == null || password.isEmpty()
				|| passwordRepeat == null || passwordRepeat.isEmpty()) {
			errorString += "Empty values ​​are not allowed! ";
			hasError = true;
		}
		
		//BẮT LỖI USERNAME, EMAIL, PASSWORD
		
//		else {
//			if (!ValidatorUtils.isUserNameValid(userName)) {
//				userNameMessage = 
//						"- Username must start and end with a letter or a digit."
//						+ " Have a length between 3 and 18 characters."
//						+ " Allow dots, underscores, or hyphens in between characters, but not consecutively.";
//				hasError = true;
//			}
//			if (!ValidatorUtils.isEmailValid(emailAddress)) {
//				emailMessage = "- Invalid email";
//				hasError = true;
//			}
//			if (!ValidatorUtils.isPasswordValid(password)) {
//				passwordMessage = 
//						"- Password must: At least 8 characters long,"
//						+ " one lowercase letter,"
//						+ " one uppercase letter,"
//						+ " one digit,"
//						+ "	one special character from the set [@ $!%*?&].";
//				hasError = true;
//			}
//			else {
//				if (!password.equals(passwordRepeat)) {
//					hasError = true;
//					passwordMessage = passwordMessage + "Repeated password is incorrect!";
//				}
//			}
//		}
		if (hasError) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("userNameMessage", userNameMessage);
			request.setAttribute("emailMessage", emailMessage);
			request.setAttribute("passwordMessage", passwordMessage);
			
			request.setAttribute("userName", userName);
			request.setAttribute("emailAddress", emailAddress);
			request.setAttribute("phoneNumber", phoneNumber);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-user.jsp");
			dispatcher.forward(request, response);
		}
		else {
			UserAccount newUser = new UserAccount();
			UserAccountDAO userAccountDAO = new UserAccountDAO();
			
			newUser.setName(userName);
			newUser.setRole(role);
			newUser.setEmailAddress(emailAddress);
			newUser.setPhone_number(phoneNumber);
			newUser.setPassword(password);
			
			userAccountDAO.addUser(newUser);
			System.out.println("add user success");	
		}
		
		
//		
		
//		if(addSuccess) {
			response.sendRedirect(request.getContextPath() + "/admin-users");
//		}
//		else {
//			HttpSession session = request.getSession();
//			session.setAttribute("successMessage", "An error occurred, please try again !");
//			response.sendRedirect(request.getContextPath() + "/admin-add-user");
//		}
		
	}

}
