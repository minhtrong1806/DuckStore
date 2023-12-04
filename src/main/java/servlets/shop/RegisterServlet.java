package servlets.shop;

import java.io.IOException;

import DAO.userAccountDAO;
import bean.UserAccount;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/register"})
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/register.jsp");
		dispatcher.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String name = request.getParameter("name");
		String email_address = request.getParameter("email_address");
		String phone_number = request.getParameter("phone_number");
		String password = request.getParameter("password");
		String repeat_password = request.getParameter("repeat_password");
		
		String errorString = "";
		boolean hasError = false;
		UserAccount newUser = null;
		
		if(name == null || email_address == null || phone_number == null || password == null || //
			name.length() == 0 || email_address.length() == 0 || phone_number.length() == 0|| password.length() == 0) {
			hasError = true;
			errorString = errorString + "Required name, email, phone number and password \n";
		}
		
		if(!password.equals(repeat_password)) {
			hasError = true;
			errorString = errorString + "Repeated password is incorrect";
		}
		
		if(hasError) {
			
			request.setAttribute("name", name);
			request.setAttribute("email_address", email_address);
			request.setAttribute("phone_number", phone_number);
			request.setAttribute("errorString", errorString);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/register.jsp");
            dispatcher.forward(request, response);
		}
		else {
			newUser = new UserAccount();
			newUser.setName(name);
			newUser.setEmailAddress(email_address);
			newUser.setPassword(password);
			newUser.setPhone_number(phone_number);
			newUser.setRole(2);
			
			userAccountDAO userAccountDAO = new userAccountDAO();
			userAccountDAO.addUser(newUser);
			System.out.println("Đăng kí thành công");
			
			response.sendRedirect(request.getContextPath() + "/login");
			

		}
	}
}
