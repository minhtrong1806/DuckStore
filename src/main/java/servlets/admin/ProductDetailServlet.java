package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/admin-product-detail"})
public class ProductDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    public int productId = -1;
    
    public static void name() {
		
	}
	
    public ProductDetailServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/admin-product-detail/add":
				break;
			default:
				productDetai(request, response);
				break;
				
			}	
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void productDetai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/product-detail.jsp");
		dispatcher.forward(request, response);
	}



}
