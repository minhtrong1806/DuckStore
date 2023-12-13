package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;
import utils.ValidatorUtils;

import java.io.IOException;

import DAO.UserAccountDAO;
import bean.UserAccount;

@WebServlet({"/edit-info"})
public class EditInfoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public EditInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		request.setAttribute("userCurrent", userCurrent);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/edit-info.jsp");	
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		UserAccountDAO userAccountDAO = new UserAccountDAO();
		
		boolean hasError = false;
		String userNameMessage = "";
		String emailMessage = "";
		
		String newUsername = request.getParameter("userName");
		String newEmail = request.getParameter("emailAddress");
		String newPhoneNumber = request.getParameter("phoneNumber");
				
		if (!ValidatorUtils.isUserNameValid(newUsername)) {
			userNameMessage = "- Username must start and end with a letter or a digit."
					+ " Have a length between 3 and 18 characters."
					+ " Allow dots, underscores, or hyphens in between characters, but not consecutively.";
			hasError = true;
		}
		if (!ValidatorUtils.isEmailValid(newEmail)) {
			emailMessage = "- Invalid email";
			hasError = true;
		}
		
		if (hasError) {
			request.setAttribute("userCurrent", userCurrent);
			request.setAttribute("userNameMessage", userNameMessage);
			request.setAttribute("emailMessage", emailMessage);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/edit-info.jsp");	
			dispatcher.forward(request, response);
		}
		else {
			userCurrent.setName(newUsername);
			userCurrent.setEmailAddress(newEmail);
			userCurrent.setPhone_number(newPhoneNumber);
			
			AppUtils.storeLoginedUser(request.getSession(), userCurrent);
			userAccountDAO.editUser(userCurrent.getUser_id(), userCurrent);
			response.sendRedirect(request.getContextPath() + "/info");
		}
	}
}
