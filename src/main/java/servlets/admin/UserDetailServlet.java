package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.ValidatorUtils;

import java.io.IOException;

import javax.persistence.Id;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.lucene.queryparser.flexible.standard.processors.AnalyzerQueryNodeProcessor;

import DAO.UserAccountDAO;
import bean.UserAccount;

@WebServlet({"/admin-user-detail",
	"/admin-edit-user",
	"/admin-reset-password"})
public class UserDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public UserDetailServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/admin-edit-user":
				editUser(request, response);
				break;
			default:
				userDetail(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean hasError = false;
		String passwordMessage = "";
		
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (userId < 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-users");		
		}
		
		String newPassword = request.getParameter("newPassword");
		String repeatPassword = request.getParameter("repeatPassword");
		if (!ValidatorUtils.isPasswordValid(newPassword)) {
			passwordMessage = "- Password must: At least 8 characters long," + " one lowercase letter,"
					+ " one uppercase letter," + " one digit," + "	one special character from the set [@ $!%*?&].";
			hasError = true;
		} 
		else {
				if (!newPassword.equals(repeatPassword)) {
					hasError = true;
					passwordMessage = passwordMessage + "Repeated password is incorrect!";
				}
		}
		
		if (hasError) {
			request.setAttribute("passwordMessage", passwordMessage);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/user-detail.jsp");
			dispatcher.forward(request, response);			
		}

	}
	
	protected void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean hasError = false;
		boolean hasChange = false;
		String userNameMessage = "";
		String emailMessage = "";

		
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (userId < 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-users");
		}

		String oldUsername = request.getParameter("oldUsername");
		String newUsername = request.getParameter("newUsername");
		String oldEmail = request.getParameter("oldEmail");
		String newEmail = request.getParameter("newEmail");
		String oldPhoneNumber = request.getParameter("oldPhoneNumber");
		String newPhoneNumber = request.getParameter("newPhoneNumber");
		String oldRole = request.getParameter("oldRole");
		String newRole = request.getParameter("newRole");
		
		if (!oldUsername.equals(newUsername) || !oldEmail.equals(newEmail) 
			|| !oldPhoneNumber.equals(newPhoneNumber) || newRole != null) {
			hasChange = true;
		}
		
		if(hasChange) {
			if (!ValidatorUtils.isUserNameValid(newUsername)) {
				userNameMessage = 
						"- Username must start and end with a letter or a digit."
						+ " Have a length between 3 and 18 characters."
						+ " Allow dots, underscores, or hyphens in between characters, but not consecutively.";
				hasError = true;
			}
			if (!ValidatorUtils.isEmailValid(newEmail)) {
				emailMessage = "- Invalid email";
				hasError = true;
			}
			if (hasError) {
				request.setAttribute("userNameMessage", userNameMessage);
				request.setAttribute("emailMessage", emailMessage);

				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/user-detail.jsp");
				dispatcher.forward(request, response);
			}
			else {
				UserAccountDAO userAccountDAO = new UserAccountDAO();
				response.sendRedirect(request.getContextPath() + "/admin-users");
			}
		}
		else {
			response.sendRedirect(request.getContextPath() + "/admin-users");
		}
		


	}
	
	protected void userDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (userId < 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-users");			
		}
		else {
			UserAccountDAO userAccountDAO = new UserAccountDAO();
			UserAccount userCurrent = userAccountDAO.getUserAccount(userId);
			String role = null;
			
			switch (userCurrent.getRole()) {
			case 0:
				role = "Manager";
				break;
			case 1:
				role = "Staff";
				break;
			case 2:
				role = "Customer";
				break;
			}
			
			request.setAttribute("role", role);
			request.setAttribute("user", userCurrent);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/user-detail.jsp");
			dispatcher.forward(request, response);
			
			
			
		}
		
	}

}
