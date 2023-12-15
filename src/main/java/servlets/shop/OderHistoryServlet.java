package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;

import DAO.ShopOrderDAO;
import bean.UserAccount;

@WebServlet({"/history"})
public class OderHistoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public OderHistoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserAccount user = AppUtils.getLoginedUser(request.getSession());
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/history.jsp");	
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
