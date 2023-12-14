package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.JSONObject;

import DAO.ProductCategoryDAO;
import DAO.ProductDAO;
import DAO.ProductItemDAO;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.VariationOption;

@WebServlet({"/product-detail",
			"/product-detail/upload"})
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
	
	protected void productDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
		String folder = request.getContextPath() + "\\views\\images\\products\\";
		String selectedColor = request.getParameter("color");
		String selectedSize = request.getParameter("size");
		
		int productId = -1;
		try {
			productId = Integer.parseInt(request.getParameter("productId"));			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.getProductbyID(productId);
		ProductItemDAO itemDAO = new ProductItemDAO();
		
		List<String> imageList = getListImage(productId);
		Set<String> sizeList = getListOptionValue(productId, "size");
		Set<String> colorList = getListOptionValue(productId, "color");
		
		String message = "";
		int quantity = 0;
		float price = 0;
		
		Set<ProductItem> items = productDAO.getProductItemsByProduct(productId);
		if (items.size() == 0 || items == null) {
			message += "Out of stock";
		} 
		else {
			if (selectedColor == null || selectedSize == null) {
				ProductItem firtItem = items.iterator().next(); 
				quantity = firtItem.getQty_in_stock();
				price = firtItem.getPrice();
			}
			else {
				ProductItem selectedItem = itemDAO.getProductItemsByConditions(productId, selectedSize, selectedColor);
				if (selectedItem == null) {
					quantity = 0;
					price = getMinPrice(productId);
				}
				else {
					quantity = selectedItem.getQty_in_stock();
					price = selectedItem.getPrice();
				}
			}
		}
		
			
		request.setAttribute("message", message);
		request.setAttribute("product", product);
		request.setAttribute("quantity", quantity);
		request.setAttribute("price", price);
		request.setAttribute("imageList", imageList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("colorList", colorList);
		request.setAttribute("folder", folder);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/product-detail.jsp");
		dispatcher.forward(request, response);
	}
	
	private  List<String> getListImage(int productId) {
		ProductItemDAO itemDAO = new ProductItemDAO();
		List<ProductItem> listItems = itemDAO.getListProductItemByProductID(productId);
		List<String> imageList = new ArrayList<String>();
		for(ProductItem item:listItems) {
			imageList.add(item.getProduct_image());		
		}
		return  imageList;
	}
	
	private Set<String> getListOptionValue(int productId,String option) {
		ProductItemDAO itemDAO = new ProductItemDAO();
		List<ProductItem> listItems = itemDAO.getListProductItemByProductID(productId);
		Set<String> optionValue = new HashSet<String>();
		for(ProductItem item:listItems) {
			for (VariationOption variationOption : item.getVariationOptions()) {
				if(variationOption.getVariation().getName().equals(option)) {
					optionValue.add(variationOption.getValue());
				}
			}		
		}
		return  optionValue;
	}

	private float getMinPrice(int productId) {
		ProductDAO productDAO = new ProductDAO();
		Set<ProductItem> items = productDAO.getProductItemsByProduct(productId);
		float priceMin = Float.MAX_VALUE;
		for (ProductItem item : items) {
			if (items == null || items.size() == 0) {
				return 0;
			}
			if (priceMin > item.getPrice()) {
				priceMin = item.getPrice();
			}
		}
		return priceMin;
	}
}
