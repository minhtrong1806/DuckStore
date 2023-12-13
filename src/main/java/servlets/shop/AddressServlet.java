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

import DAO.AddressDAO;
import bean.Address;
import bean.UserAccount;

@WebServlet({"/address"})
public class AddressServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public AddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
		AddressDAO addressDAO = new AddressDAO();
		
		List<Address> addressList = addressDAO.listAddressByUser(userCurrent.getUser_id());
		for (Address address : addressList) {
			System.out.println(address.getCity());
		}
		
		request.setAttribute("addressList", addressList);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/address.jsp");
		dispatcher.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
