package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import utils.Constant;
import utils.UploadUtils;

import java.io.IOException;
import java.util.List;

import DAO.ProductCategoryDAO;
import DAO.ProductItemDAO;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;



@WebServlet(urlPatterns = {
		"/admin-add-product",
		"/admin-add-product/add",
		"/admin-add-product/form"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 10MB
				maxFileSize = 1024 * 1024 * 50, 	  // 50MB
				maxRequestSize = 1024 * 1024 * 50) 	  // 50MB

public class AddProductServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public AddProductServlet() {
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
				addProduct(request, response);
				break;
			default:
				showForm(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		List<ProductCategory> categorieList = null;
		categorieList = productCategoryDAO.listProductCategories();
		request.setAttribute("categoryList", categorieList);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-product.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String message = "";
		
		Product product = new Product();
		ProductItem item = new ProductItem();
		ProductItemDAO itemDAO = new ProductItemDAO();
		
		String nameRaw = request.getParameter("name");
		String descriptionRaw = request.getParameter("description");
		String productCategoryRaw = request.getParameter("productCategory");
		String sizeRaw = request.getParameter("size");
		String colorRaw = request.getParameter("color");
		String qty_in_stockRaw = request.getParameter("qty_in_stock");
		String priceRaw = request.getParameter("price");
		
		if (nameRaw.isEmpty() || descriptionRaw.isEmpty() || productCategoryRaw.isEmpty() || sizeRaw.isEmpty() || colorRaw.isEmpty() || qty_in_stockRaw.isEmpty() || priceRaw.isEmpty()) {
			message = "Empty values ​​are not allowed";
		} 
		else {
			int qty_in_stock = 0;
			int price = 0;
			try {
				qty_in_stock = Integer.parseInt(qty_in_stockRaw);
				price = Integer.parseInt(priceRaw);
			} catch (Exception e) {
				
			}
			if (qty_in_stock > 0 && price > 0) {
				String name = new String(nameRaw.getBytes("ISO-8859-1"), "UTF-8");
				String description = new String(descriptionRaw.getBytes("ISO-8859-1"), "UTF-8");
				String productCategory = new String(productCategoryRaw.getBytes("ISO-8859-1"), "UTF-8");
				String size = new String(sizeRaw.getBytes("ISO-8859-1"), "UTF-8");
				String color = new String(colorRaw.getBytes("ISO-8859-1"), "UTF-8");
				
				product.setName(name);
				product.setDescription(description);
				
				item.setQty_in_stock(qty_in_stock);
				item.setPrice(price);
				
				try {

					if(request.getPart("productImage").getSize() != 0) {
						String fileName = "pd"+ System.currentTimeMillis();
						String result1 = UploadUtils.processUpload("productImage", request, Constant.DIR + "\\product\\", fileName);
						product.setProduct_image(result1);
					}
					
					if(request.getPart("productItemImage").getSize() != 0) {
						String fileName = "item"+ System.currentTimeMillis();
						String result2 = UploadUtils.processUpload("productItemImage", request, Constant.DIR + "\\product\\", fileName);
						item.setProduct_image(result2);
					}
					itemDAO.addProductItem(item, product, size, color, productCategory);

					
				} catch (Exception e) {
					error = "Error: " + e.getMessage();
				}
			}
			else {
				message += ", Price and Quantity must be greater than 0";
			}
			
		}
		
		if(error.isEmpty() && message.isEmpty()) {
			response.sendRedirect(request.getContextPath()+"/admin-products");
		}
		else {
			request.setAttribute("error", error);
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-product.jsp");
			dispatcher.forward(request, response);
		}

	}
	



}
