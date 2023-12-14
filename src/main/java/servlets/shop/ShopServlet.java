package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

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
	
	@SuppressWarnings("unchecked")
	protected void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		List<Product> listProduct = null;
		
		if (search != null) {
			try {
				System.out.println("search: " + search);
				listProduct = productDAO.searchProduct(search);
			} catch (Exception e) {
				listProduct = productDAO.getProductList();
				e.printStackTrace();
			}
		}
		else {
			if (category.equals("All Products")) {
				listProduct = productDAO.getProductList();
			}
			else {
				Set<Product> setProduct= productCategoryDAO.getProductByCategory(category);
				try {
					listProduct = new ArrayList<>(setProduct);
					System.out.println("caterory: " + category);
				} catch (Exception e) {
					listProduct = productDAO.getProductList();
					e.printStackTrace();
				}
			}
			
		}
		
		request.setAttribute("categoryList", categorieList);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("productFolder", folderStore);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/product.jsp");
		dispatcher.forward(request, response);
	}
	

}
