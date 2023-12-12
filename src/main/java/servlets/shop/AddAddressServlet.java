package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.AppUtils;

import java.io.IOException;
import java.util.Base64.Encoder;

import org.hibernate.search.query.engine.impl.ReusableDocumentStoredFieldVisitor;

import DAO.AddressDAO;
import DAO.UserAccountDAO;
import bean.Address;
import bean.UserAccount;

@WebServlet({"/add-address"})
public class AddAddressServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public AddAddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/add-address.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Address address = new Address();
		
		String city = new String(request.getParameter("city").getBytes(), "UTF-8");
		String district = new String(request.getParameter("district").getBytes(), "UTF-8");
		String addressLine = new String(request.getParameter("addressLine").getBytes(), "UTF-8");
		String unitNumber = new String(request.getParameter("unitNumber").getBytes(), "UTF-8");
		
		address.setCity(city);
		address.setDistrict(district);
		address.setAddressLine(addressLine);
		address.setUnitNumber(unitNumber);
		
		boolean hasError = false;
		String errorString = "";
		
		if (city.length() == 0 || city == null
			|| district.length() == 0 || district == null 
			|| addressLine.length() == 0 || addressLine == null
			|| unitNumber.length() == 0 || unitNumber == null) {
			hasError = true;
			errorString += "Empty values ​​are not allowed! ";
		}
		
		if (hasError) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("address", address);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/add-address.jsp");
			dispatcher.forward(request, response);
		}
		else {
			UserAccount userCurrent = AppUtils.getLoginedUser(request.getSession());
			AddressDAO addressDAO = new AddressDAO();
			
			addressDAO.addAddressForUser(address, userCurrent.getUser_id());
			System.out.println("success");
			response.sendRedirect(request.getContextPath() + "/address");
		}
	}
}
