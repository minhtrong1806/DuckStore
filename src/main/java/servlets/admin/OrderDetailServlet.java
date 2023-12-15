package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.ShopOrderDAO;
import bean.ShopOrder;

@WebServlet({"/admin-order-detail",
	"/admin-order-update"})
public class OrderDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public OrderDetailServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/admin-order-update":
				updateOrder(request, response);
				break;
			default:
				showOrder(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newStatus = request.getParameter("newStatus");
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		try {
			if (newStatus != null) {
				int statusId = Integer.parseInt(newStatus);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	protected void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/order-detail.jsp");
		dispatcher.forward(request, response);
	}



}
