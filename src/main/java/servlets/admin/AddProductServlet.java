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
import DAO.ProductDAO;
import bean.Product;
import bean.ProductCategory;

@WebServlet(urlPatterns = { "/admin-add-product", "/admin-add-product/add", "/admin-add-product/form" })

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 10MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddProductServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void showForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		List<ProductCategory> categorieList = null;
		categorieList = productCategoryDAO.listProductCategories();
		request.setAttribute("categoryList", categorieList);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-product.jsp");
		dispatcher.forward(request, response);
	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String errorString = "";
		boolean hasError = false;

		Product product = new Product();
		ProductDAO productDAO = new ProductDAO();
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();

		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String categoryName = request.getParameter("categoryName");

		if (name.isEmpty() || name == null || description.isEmpty() || description == null
				|| categoryName.isEmpty() || categoryName == null) {
			errorString += "Empty values ​​are not allowed";
			hasError = true;
		}
		
		try {
			if (request.getPart("productImage").getSize() == 0) {
				errorString += "Please choose image!";
				hasError = true;
			}
			else {
				String folderStore = Constant.DIR + "\\product\\";
				String fileName = "Product" + System.currentTimeMillis();
				String productLink = UploadUtils.processUpload("productImage", request, folderStore , fileName);
				product.setProduct_image(productLink);
				
			}
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
		}
		if (hasError) {

			List<ProductCategory> categorieList = null;
			categorieList = productCategoryDAO.listProductCategories();

			request.setAttribute("errorString", errorString);
			request.setAttribute("categoryList", categorieList);
			request.setAttribute("name", name);
			request.setAttribute("description", description);
			request.setAttribute("productCategory", categoryName);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-product.jsp");
			dispatcher.forward(request, response);

		} else {
			
			product.setName(name);
			product.setDescription(description);
			
			Boolean addSuccess = productDAO.addProduct(product, categoryName);
			if(addSuccess) {
				int id = product.getProductID();
				// Lưu thông báo vào session attribute
				HttpSession session = request.getSession();
				session.setAttribute("successMessage", "The product has been added successfully! \n Let's add variations to product");
				response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId=" + id);
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("message", "Product name already exists! \\nPlease use another name!");
				response.sendRedirect(request.getContextPath() + "/admin-add-product");
			}
			
			
			
		}
	}

}
