package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Constant;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import DAO.ProductCategoryDAO;
import DAO.ProductDAO;
import DAO.ProductItemDAO;
import bean.Product;
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
		ProductDAO productDAO = new ProductDAO();
		
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		List<Product> listProducts = productDAO.getProductList();
		HashMap<Integer, String> priceRange = new HashMap<Integer, String>();
		HashMap<Integer, Integer> quantity = new HashMap<Integer, Integer>();
		
		priceRange = getPriceRange(listProducts, productDAO);
		quantity = getQty(listProducts, productDAO);
		
		String folderStore = Constant.DIR + "\\product\\";
		
		request.setAttribute("categoryList", categorieList);
		request.setAttribute("listProducts", listProducts);
		request.setAttribute("priceRange", priceRange);
		request.setAttribute("quantity", quantity);
		request.setAttribute("folder", folderStore);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/products.jsp");
		dispatcher.forward(request, response);
	}
	
	private HashMap<Integer, Integer> getQty(List<Product> listProducts, ProductDAO productDAO) {
		HashMap<Integer, Integer> sumQtys = new HashMap<Integer, Integer>();
		for (Product product : listProducts) {
			int sumQty = 0;
			Set<ProductItem> items = productDAO.getProductItemsByProduct(product.getProductID());
			if (items == null || items.size() == 0) {
				sumQtys.put(product.getProductID(), 0);
				continue;
			}
			for (ProductItem item : items) {
				sumQty += item.getPrice();
			}
			sumQtys.put(product.getProductID(), sumQty);
		}
		return sumQtys;
	}
		
	


	
	private HashMap<Integer, String> getPriceRange(List<Product> listProducts, ProductDAO productDAO) {
		HashMap<Integer, String> priceRange = new HashMap<Integer, String>();
		for (Product product:listProducts) {
			float priceMax = Float.MIN_VALUE;
			float priceMin = Float.MAX_VALUE;
			Set<ProductItem> items = productDAO.getProductItemsByProduct(product.getProductID());
			if (items == null || items.size() == 0) {
				priceRange.put(product.getProductID(), "No items");
				continue;
			}
			for (ProductItem item:items) {
				
				
				if (priceMax < item.getPrice()) {
					priceMax = item.getPrice();
				}
				if (priceMin > item.getPrice()) {
					priceMin = item.getPrice();
				}
			}
			if (priceMin == priceMax) {
				priceRange.put(product.getProductID(), (String)(priceMax + " $"));
			}
			else {
				priceRange.put(product.getProductID(), (String)(priceMin + " - " + priceMax + " $"));
			}		
		}
		return priceRange;
	}

}
