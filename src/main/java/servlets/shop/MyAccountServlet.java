package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;

import bean.UserAccount;

@WebServlet({"/info"})
public class MyAccountServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public MyAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		request.setAttribute("userCurrent", userCurrent);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/info.jsp");	
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
