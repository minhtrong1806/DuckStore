package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import DAO.AddressDAO;
import bean.Address;
import bean.UserAccount;

@WebServlet({"/address",
	"/delete-address"})
public class AddressServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public AddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/address":
				showAddress(request, response);
				break;
			case "/delete-address":
				deleteAddress(request, response);
				break;
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addressId = -1;
		boolean success = false;
		AddressDAO addressDAO = new AddressDAO();
		try {
			addressId = Integer.parseInt(request.getParameter("addressId"));
			success = addressDAO.deleteAddress(addressId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		response.sendRedirect(request.getContextPath() + "/address");	
	}
	
	protected void showAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		AddressDAO addressDAO = new AddressDAO();
	
		Set<Address> addressList = addressDAO.listAddressByUser(userCurrent.getUser_id());
		
		request.setAttribute("addressList", addressList);
		request.setAttribute("userCurrent", userCurrent);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/address.jsp");
		dispatcher.forward(request, response); 
	}
	
	
}
