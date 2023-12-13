package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import DAO.ProductCategoryDAO;
import DAO.ProductDAO;
import bean.Product;
import bean.ProductCategory;

@WebServlet({"/shop"})
public class ShopServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public ShopServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/shop":
				listProduct(request, response);
				break;
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
		
	}
	
	protected void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		List<Product> listProduct = productDAO.getProductList();


		request.setAttribute("categoryList", categorieList);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("productFolder", folderStore);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/product.jsp");
		dispatcher.forward(request, response);
	}
	

}
