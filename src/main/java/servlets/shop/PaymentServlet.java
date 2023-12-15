package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import DAO.AddressDAO;
import DAO.ShopOrderDAO;
import bean.Address;
import bean.UserAccount;

@WebServlet({"/payment",
	"/process-payment"})
public class PaymentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public PaymentServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/process-payment":
				processPayment(request, response);
				break;
			default:
				showForm(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}

	protected void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddressDAO addressDAO = new AddressDAO();
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		Set<Address> listAddress= null;
		Address selectedAddress = null;
		try {
			listAddress = addressDAO.listAddressByUser(userCurrent.getUser_id());
			selectedAddress = listAddress.iterator().next();

		} catch (Exception e) {
		}
		try {
			int id = Integer.parseInt(request.getParameter("addressId"));
			selectedAddress = addressDAO.getAddress(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("selectedAddress", selectedAddress);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/payment.jsp");
		dispatcher.forward(request, response);
	}
	protected void processPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		UserAccount user = AppUtils.getLoginedUser(request.getSession());
		
		String address = request.getParameter("addressId");
		String shippingMedthod = request.getParameter("shippingMethod");
		String paymentMethod = request.getParameter("paymentMethod");
		try {
			int ShippingId = Integer.parseInt(shippingMedthod);
			int paymentId = Integer.parseInt(paymentMethod);
			int addressId = Integer.parseInt(address);
			shopOrderDAO.addShopOrder(ShippingId, addressId, user.getUser_id(), paymentId);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		response.sendRedirect(request.getContextPath() + "/shopping-cart");		
	}
}
