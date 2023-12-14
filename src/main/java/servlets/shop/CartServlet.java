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

@WebServlet({"/add-to-cart"})
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
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void cartPopup(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
		ShoppingCartDAO cartDAO = new ShoppingCartDAO();
		ShoppingCartItemDAO cartItemDAO = new ShoppingCartItemDAO();
		
		String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
		Set<ShoppingCartItem> itemList = null;
		
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		ShoppingCart cartOfUserCurrent = cartDAO.getShoppingCart(userCurrent.getUser_id());
		if (cartOfUserCurrent != null) {
			itemList = cartDAO.listProductItemByUserID(userCurrent.getUser_id());
		}
		
		for (ShoppingCartItem shoppingCartItem : itemList) {
			System.out.println(shoppingCartItem.getProductItem().getProduct_image());
			System.out.println(shoppingCartItem.getQty());
			System.out.println(shoppingCartItem.getProductItem().getPrice());
		}

		request.setAttribute("itemList", itemList);
		request.setAttribute("folderStore", folderStore);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/cart.jsp");
		dispatcher.forward(request, response);
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
		System.out.println(productId);
		
		
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		ShoppingCart cartOfUserCurrent = shoppingCartDAO.getShoppingCart(userCurrent.getUser_id());
		if (cartOfUserCurrent == null) {
			shoppingCartDAO.addShoppingCart(userCurrent.getUser_id());
			cartOfUserCurrent = shoppingCartDAO.getShoppingCart(userCurrent.getUser_id());
		}
				
		ProductItem itemSelected = itemDAO.getProductItemsByConditions(productId, size, color);
		if (itemSelected == null) {
			hasError = true;
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please choose color and size !");
			response.sendRedirect(request.getContextPath() + "/product-detail");
		}
		
		if (!hasError) {
			boolean success = shoppingCartItemDAO.addProductToShoppingCart(itemSelected.getProductItemID(), userCurrent.getUser_id(), numProduct);
			response.sendRedirect(request.getContextPath() + "/product-detail?productId=" + productId);		
		}
		
	}


}
