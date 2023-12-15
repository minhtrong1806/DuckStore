package servlets.shop;

import DAO.UserAccountDAO;
import bean.ShopOrder;
import bean.UserAccount;
import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;
import java.util.Set;

@WebServlet({"/history"})
public class OderHistoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public OderHistoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listOrder(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void listOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());

		UserAccountDAO userAccountDAO = new UserAccountDAO();
		Set<ShopOrder> shopOrders = userAccountDAO.getListOrderByUserID(userCurrent.getUser_id());

		request.setAttribute("shopOrders", shopOrders);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/history.jsp");
		dispatcher.forward(request, response);
	}
}
