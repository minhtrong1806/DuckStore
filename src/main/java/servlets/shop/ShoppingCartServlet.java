package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;
import java.util.Set;

import DAO.ShoppingCartDAO;
import DAO.ShoppingCartItemDAO;
import bean.ShoppingCart;
import bean.ShoppingCartItem;
import bean.UserAccount;
import bean.VariationOption;

@WebServlet({"/shopping-cart"})
public class ShoppingCartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public ShoppingCartServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
		
		ShoppingCartDAO cartDAO = new ShoppingCartDAO();
		ShoppingCartItemDAO cartItemDAO = new ShoppingCartItemDAO();
		Set<ShoppingCartItem> itemList = null;
		ShoppingCart cartOfUserCurrent = null;
		
		try {
			UserAccount user = AppUtils.getLoginedUser(request.getSession());
			if (user != null) {
				cartOfUserCurrent = cartDAO.getShoppingCart(user.getUser_id());
			}
			if (cartOfUserCurrent != null) {
				itemList = cartDAO.listProductItemByUserID(user.getUser_id());
			}
		} catch (Exception e) {
		}
		
		
		request.setAttribute("folder", folderStore);
		request.setAttribute("productItemList", itemList);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/shopping-cart.jsp");
		dispatcher.forward(request, response);
	}
}
