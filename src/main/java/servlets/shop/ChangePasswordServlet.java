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

@WebServlet({"/change-password"})
public class ChangePasswordServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public ChangePasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		request.setAttribute("userCurrent", userCurrent);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/change-password.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccountDAO userAccountDAO = new UserAccountDAO();
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		boolean hasError = false;
		String errorString = "";
		
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String repeatPassword = request.getParameter("repeatPassword");

		if (!oldPassword.equals(userCurrent.getPassword())) {
			errorString += "Incorrect password!";
			
			request.setAttribute("errorString", errorString);


			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/change-password.jsp");
			dispatcher.forward(request, response);
		}
		else {
			if (!ValidatorUtils.isPasswordValid(newPassword)) {
				errorString += "- Password must: At least 8 characters long," + " one lowercase letter,"
						+ " one uppercase letter," + " one digit," + "	one special character from the set [@ $!%*?&].";
				hasError = true;
			} else {
				if (!newPassword.equals(repeatPassword)) {
					hasError = true;
					errorString = errorString + "Repeated password is incorrect!";
				}
			}
			if (hasError) {
				request.setAttribute("errorString", errorString);
				
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/change-password.jsp");
				dispatcher.forward(request, response);
			}
			else {
				userCurrent.setPassword(newPassword);

				AppUtils.storeLoginedUser(request.getSession(), userCurrent);
				userAccountDAO.editUser(userCurrent.getUser_id(), userCurrent);
				response.sendRedirect(request.getContextPath() + "/info");
			}
			
		}
		
	}
}
