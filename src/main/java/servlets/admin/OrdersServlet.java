package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import DAO.ShopOrderDAO;
import bean.ShopOrder;

@WebServlet({"/admin-orders"})
public class OrdersServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public OrdersServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/admin-user/delete":
				break;
			default:
				showOrder(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}

	
	protected void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
		List<ShopOrder>  listOrder= shopOrderDAO.getShopOrderList();
		
		request.setAttribute("listOrder", listOrder);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/orders.jsp");
		dispatcher.forward(request, response);
	}
	
	

}
