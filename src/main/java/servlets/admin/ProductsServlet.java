package servlets.admin;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.Constant;
import utils.DeleteUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import DAO.ProductCategoryDAO;
import DAO.ProductDAO;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;

@WebServlet({"/admin-products",
	"/admin-product/delete"})
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
			case "/admin-product/delete":
				deleteProduct(request, response);
				break;
			default:
				list(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean hasErorr = false;
		int productId = -1;
		
		try {
			productId = Integer.parseInt(request.getParameter("productId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (productId < 0) {
			hasErorr = true;
		}
		
		if(hasErorr) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-products");			
		}
		else {
			ProductDAO productDAO = new ProductDAO();
			String fileNameStore = productDAO.getProductbyID(productId).getProduct_image();
			String folderStore = Constant.DIR + "\\products\\";
			boolean deleteSuccess  = productDAO.deteleProduct(productId);
			if (deleteSuccess) {
				DeleteUtils.processDelete(fileNameStore, folderStore, request);
				response.sendRedirect(request.getContextPath() + "/admin-products");	
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("successMessage", "This product cannot be deleted!");
				response.sendRedirect(request.getContextPath() + "/admin-products");	
			}
			
		}	
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		List<Product> listProducts = null;
		List<Product> listProductInPage = null;
		int pageSize = 16;
		int pageN = 1;
		try {
			if (request.getParameter("pageNumber") != null) {
				pageN = Integer.parseInt(request.getParameter("pageNumber"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String search = request.getParameter("search");

		try {
			listProducts = productDAO.searchProduct(search);
		} catch (Exception e) {
			listProducts = productDAO.getProductList();
		}
		
		if (listProducts == null || listProducts.size() == 0) {
			listProducts = productDAO.getProductList();
		}
		
		HashMap<Integer, String> priceRange = new HashMap<Integer, String>();
		HashMap<Integer, Integer> quantity = new HashMap<Integer, Integer>();
		HashMap<Integer, Integer> sold = new HashMap<Integer, Integer>();
		
		priceRange = getPriceRange(listProducts, productDAO);
		quantity = getQty(listProducts, productDAO);
		sold = getSold(listProducts, productDAO);
		
		String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
		
		int numberOfPages = listProducts.size() / pageSize;
		if (listProducts.size() % pageSize != 0 ) {
			numberOfPages++;
		}
		
		listProductInPage = productDAO.getProductsByPage(listProducts, pageN, pageSize);
		
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("categoryList", categorieList);
		request.setAttribute("listProducts", listProductInPage);
		request.setAttribute("priceRange", priceRange);
		request.setAttribute("quantity", quantity);
		request.setAttribute("sold", sold);
		request.setAttribute("productFolder", folderStore);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/products.jsp");
		dispatcher.forward(request, response);
	}
	
	private HashMap<Integer, Integer> getQty(List<Product> listProducts, ProductDAO productDAO) {
		HashMap<Integer, Integer> sumQtys = new HashMap<Integer, Integer>();
		for (Product product : listProducts) {
			sumQtys.put(product.getProductID(), productDAO.totalItem(product.getProductID()));
		}
		return sumQtys;
	}

	private HashMap<Integer, Integer> getSold(List<Product> listProducts, ProductDAO productDAO){
		HashMap<Integer, Integer> sumSold = new HashMap<Integer, Integer>();
		for(Product product : listProducts){
			sumSold.put(product.getProductID(), productDAO.totalSold(product.getProductID()));
		}
		return sumSold;
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
