package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import DAO.ProductCategoryDAO;
import DAO.ProductItemDAO;
import bean.ProductCategory;
import bean.ProductItem;

@WebServlet({"/admin-products"})
public class ProductsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public ProductsServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/admin-add-product/add":
//				addProduct(request, response);
				break;
			default:
				list(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ProductItemDAO productItemDAO = new ProductItemDAO();
		
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		List<ProductItem> listItem = null;

		request.setAttribute("categoryList", categorieList);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/products.jsp");
		dispatcher.forward(request, response);
	}

}
