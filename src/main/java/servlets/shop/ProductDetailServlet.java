package servlets.shop;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.bytebuddy.dynamic.scaffold.TypeInitializer.None;
import utils.CalUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
		ProductCategoryDAO categoryDAO = new ProductCategoryDAO();

		List<String> imageList = getListImage(productId);
		Set<String> sizeList = getListOptionValue(productId, "size");
		Set<String> colorList = getListOptionValue(productId, "color");
		
		String message = "";
		String sku = "";
		int quantity = 0;
		float price = 0;
		
		Set<ProductItem> items = productDAO.getProductItemsByProduct(productId);
		if (items.size() == 0 || items == null) {
			message += "Out of stock";
		} 
		else {
			if (selectedColor == null ) {
				selectedColor = colorList.iterator().next();
			}
			if (selectedSize == null) {
				selectedSize = sizeList.iterator().next();
			}
			else {
				try {
					ProductItem selectedItem = itemDAO.getProductItemsByConditions(productId, selectedSize, selectedColor);
					if (selectedItem == null) {
						price = CalUtils.getMinPrice(productId);
					}
					else {
						quantity = selectedItem.getQty_in_stock();
						price = selectedItem.getPrice();
						sku = selectedItem.getSku();
					}
				} catch (Exception e) {
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
		request.setAttribute("sku", sku);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/shop/product-detail.jsp");
		dispatcher.forward(request, response);
	}
	
	private  List<String> getListImage(int productId) {
		ProductItemDAO itemDAO = new ProductItemDAO();
		List<ProductItem> listItems = itemDAO.getListProductItemByProductID(productId);
		if (listItems == null || listItems.size() == 0) {
			return null;
		}
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
}
