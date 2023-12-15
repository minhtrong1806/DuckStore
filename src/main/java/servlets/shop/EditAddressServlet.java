package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


import DAO.AddressDAO;
import bean.Address;

@WebServlet({"/edit-address"})
public class EditAddressServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public EditAddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addressId = -1;
		try {
			addressId = Integer.parseInt(request.getParameter("addressId"));
		} catch (Exception e) {
		}
		
		AddressDAO addressDAO = new AddressDAO();
//		Address addressCurent = addressDAO
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/edit-address.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
