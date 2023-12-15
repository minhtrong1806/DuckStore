package servlets.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.Constant;
import utils.UploadUtils;

import java.io.IOException;

import DAO.ProductItemDAO;
import bean.ProductItem;

@WebServlet({"/admin-add-variant"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 10MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class AddVariantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int productId = -1;

    public AddVariantServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("productId");
		try {
			productId = Integer.parseInt(id);
		} catch (Exception e) {
		}
		if (productId < 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-products");
		}
		else {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-variant.jsp");
			dispatcher.forward(request, response);
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductItemDAO itemDAO = new ProductItemDAO();
		ProductItem item = new ProductItem();
		
		String errorString = "";
		boolean hasError = false;
		
		String color = request.getParameter("color");
		String size = request.getParameter("size");	
		String qty_in_stockString = (String)request.getParameter("qty_in_stock");	
		String priceString = (String)request.getParameter("price");	

		if (color == null || size == null
				|| qty_in_stockString.length() == 0 || qty_in_stockString == null
				|| priceString.length() == 0 || priceString == null){
			errorString += "Please choose \"color\", \"size\" and fill in \"quantity\" and \"price\" for the product.";
			hasError = true;
		}
		
		int qty_in_stock = 0;
		//double price = 0;
		int price = 0;
		
		try {	
			qty_in_stock = Integer.parseInt(qty_in_stockString);
			price = Integer.parseInt(priceString);
		} catch (Exception e) {
			errorString += "\nPlease enter a integer for \"quantity\" and a real number for \"price\"  !";
			hasError = true;
		}
		
		if (qty_in_stock < 0 || price <0) {
			errorString += "\n\"Quantity\" and \"price\" must be greater than 0.";
			hasError = true;
		}
		
		try {
			if (request.getPart("itemImage").getSize() == 0) {
				errorString += "Please choose image!";
				hasError = true;
			}
			else {
				String folderStore = Constant.DIR + "\\products\\";
				String fileName = "Item" + System.currentTimeMillis();
				String productLink = UploadUtils.processUpload("itemImage", request, folderStore, fileName);
				
				item.setProduct_image(productLink);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if (hasError) {
			
			request.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-variant.jsp");
			dispatcher.forward(request, response);

		}
		else {
			
			item.setPrice(price);
			item.setQty_in_stock(qty_in_stock);
			Boolean addSuccess = itemDAO.addProductItem(item, productId, size, color);
			
			if(addSuccess) {
				response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+productId);
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("message", "An error occurred ! \\nPlease use another name!");
				response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+productId);
			}
			
			
		}
	}

}
