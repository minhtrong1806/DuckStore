package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.geom.Ellipse2D;
import java.io.IOException;
import java.util.Set;

import DAO.OrderStatusDAO;
import DAO.ShopOrderDAO;
import bean.OrderLine;
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
		boolean hasError = false;
		String newStatus = request.getParameter("newStatus");
		String orderIdString = request.getParameter("orderId");
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		
		int statusId = -1;
		int orderId = -1;
		
		try {
			if (newStatus != null && orderIdString != null) {
				statusId = Integer.parseInt(newStatus);
				orderId = Integer.parseInt(orderIdString);
				System.out.println(statusId);
				System.out.println(orderId);
				shopOrderDAO.updateOrderStatus(orderId, statusId);
			}
			else {
				hasError = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (hasError) {
			response.sendRedirect(request.getContextPath() + "/admin-orders");		
		} else {
			response.sendRedirect(request.getContextPath() + "/admin-order-update?orderId=" + orderId);		
		}
		
		
		
		
	}
	
	protected void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		ShopOrder shopOrder = null;
		int orderId = -1;
		try {
			orderId = Integer.parseInt(request.getParameter("orderId"));
			shopOrder = shopOrderDAO.getShopOrderByID(orderId);
			Set<OrderLine> orderLines = shopOrder.getOrderLines();

			request.setAttribute("shopOrder", shopOrder);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/order-detail.jsp");
		dispatcher.forward(request, response);
	}



}
