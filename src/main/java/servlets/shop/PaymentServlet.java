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

import DAO.AddressDAO;
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
		try {
			Set<Address> listAddress = addressDAO.listAddressByUser(userCurrent.getUser_id());
			Address firstAddress = listAddress.iterator().next();
			request.setAttribute("user", userCurrent);
			request.setAttribute("listAddress", listAddress);
			request.setAttribute("firstAddress", firstAddress);
		} catch (Exception e) {
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/payment.jsp");
		dispatcher.forward(request, response);
	}
	protected void processPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/payment.jsp");
		dispatcher.forward(request, response);
	}
}
