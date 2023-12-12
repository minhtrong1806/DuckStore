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
import DAO.ProductItemDAO;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.VariationOption;

@WebServlet({"/product-detail"})
public class ProductDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
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
			case "/product-detail":
				productDetail(request, response);
				break;
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
		
	}
	
	protected void productDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemFolder = request.getContextPath() + "\\views\\images\\productItem\\";
		String productFolder = request.getContextPath() + "\\views\\images\\product\\";
		
		int productId = -1;
		try {
			productId = Integer.parseInt(request.getParameter("productId"));			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		ProductDAO productDAO = new ProductDAO();
		ProductItemDAO itemDAO = new ProductItemDAO();
		ProductCategoryDAO categoryDAO = new ProductCategoryDAO();
		
		List<ProductCategory> categoryList = categoryDAO.listProductCategories();
		Product product = productDAO.getProductbyID(productId);
		List<ProductItem> listItems = itemDAO.getListProductItemByProductID(productId);
		HashMap<Integer, HashMap<String, String>> variationList = new HashMap<Integer, HashMap<String, String>>();
		
		variationList = getListVariant(listItems);
		
		request.setAttribute("product", product);
		request.setAttribute("listItems", listItems);
		request.setAttribute("variationList", variationList);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("itemFolder", itemFolder);
		request.setAttribute("productFolder", productFolder);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/product-detail.jsp");
		dispatcher.forward(request, response);
		
	}
	private HashMap<Integer, HashMap<String, String>> getListVariant(List<ProductItem> listItems) {
		HashMap<Integer, HashMap<String, String>> variationList = new HashMap<Integer, HashMap<String, String>>();
		for(ProductItem item:listItems) {
			HashMap<String, String> variation = new HashMap<String, String>();
			for (VariationOption variationOption : item.getVariationOptions()) {
				variation.put(variationOption.getVariation().getName(), variationOption.getValue());
			}		
			variationList.put(item.getProductItemID(), variation);
		}
		return variationList;
		
	}
}
