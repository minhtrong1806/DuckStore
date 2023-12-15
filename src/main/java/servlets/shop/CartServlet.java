package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.AppUtils;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import DAO.ProductItemDAO;
import DAO.ShoppingCartDAO;
import DAO.ShoppingCartItemDAO;
import bean.Product;
import bean.ProductItem;
import bean.ShoppingCart;
import bean.ShoppingCartItem;
import bean.UserAccount;

@WebServlet({"/add-to-cart",
	"/delete-item-cart"})
public class CartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public CartServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/add-to-cart":
				add2Cart(request, response);
				break;
			case "/delete-item-cart":
				deleteItemToCart(request, response);
				break;
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void deleteItemToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
		ShoppingCartItemDAO shoppingCartItemDAO = new ShoppingCartItemDAO();
		UserAccount user = AppUtils.getLoginedUser(request.getSession());

		boolean success = false;
		int itemId = -1;
		try {
			itemId = Integer.parseInt(request.getParameter("itemId"));
			success = shoppingCartItemDAO.deleleProductToShoppingCart(itemId, user.getUser_id());
		} catch (Exception e) {
			// TODO: handle exception
		}

		response.sendRedirect(request.getContextPath() + "/shopping-cart");	
	}
	
	protected void add2Cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
		ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
		ShoppingCartItemDAO shoppingCartItemDAO = new ShoppingCartItemDAO();
		ProductItemDAO itemDAO = new ProductItemDAO();
		
		int productId = -1;
		int numProduct = 0;
		boolean hasError = false;
		
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		try {
			productId = Integer.parseInt(request.getParameter("productId"));
			numProduct = Integer.parseInt(request.getParameter("numProduct"));
		} catch (Exception e) {
		}	
		
		
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		ShoppingCart cartOfUserCurrent = shoppingCartDAO.getShoppingCart(userCurrent.getUser_id());
		if (cartOfUserCurrent == null) {
			shoppingCartDAO.addShoppingCart(userCurrent.getUser_id());
			cartOfUserCurrent = shoppingCartDAO.getShoppingCart(userCurrent.getUser_id());
		}
		
		ProductItem itemSelected = null;
		try {
			itemSelected = itemDAO.getProductItemsByConditions(productId, size, color);
		} catch (Exception e) {
			hasError = true;
		}		
		
		if (itemSelected == null || hasError) {
			hasError = true;
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please choose color and size !");
			response.sendRedirect(request.getContextPath() + "/product-detail?productId=" + productId);
			System.out.println("loi");
		}
		
		else {
			boolean success = shoppingCartItemDAO.addProductToShoppingCart(itemSelected.getProductItemID(), userCurrent.getUser_id(), numProduct);
			response.sendRedirect(request.getContextPath() + "/product-detail?productId=" + productId);		
		}
		
	}


}
