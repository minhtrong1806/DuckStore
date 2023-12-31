package servlets.shop;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;


import java.io.IOException;

import DAO.UserAccountDAO;
import bean.UserAccount;

@WebServlet({"/login"})
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/login.jsp");
		
		dispatcher.forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String emailAddress = request.getParameter("emailAddress");
		String password = request.getParameter("password");
		UserAccountDAO userAccountDAO = new UserAccountDAO();
		
		boolean check = userAccountDAO.checkLogin(emailAddress, password);

		if (check == false) {
			String errorMessage = "Invalid email or Password";
			System.out.println(errorMessage);

			request.setAttribute("errorMessage", errorMessage);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/login.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		UserAccount userAccount = userAccountDAO.findUser(emailAddress);
		AppUtils.storeLoginedUser(request.getSession(), userAccount);

		// 
		int redirectId = -1;
		try {
			redirectId = Integer.parseInt(request.getParameter("redirectId"));
		} catch (Exception e) {
		}
		String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
		if (requestUri != null) {
			response.sendRedirect(requestUri);
		} else {
			response.sendRedirect(request.getContextPath() + "/home");
		}
	    
	}
}
