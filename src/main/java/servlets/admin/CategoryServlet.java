package servlets.admin;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import DAO.ProductCategoryDAO;
import bean.ProductCategory;

@WebServlet(urlPatterns = 
		{"/admin-category", 
		"/admin-category/showAdd",
		"/admin-category/showEdit",
		"/admin-category/add",
		"/admin-category/edit"})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryServlet() {
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
			case "/admin-category/add":
				insertCategory(request, response);
				break;
			case "/admin-category/edit":
				editCategory(request, response);
				break;
			case "/admin-category/showEdit":
				showFormEdit(request, response);
				break;
			case "/admin-category/showAdd":
				showFormAdd(request, response);
				break;
			default:
				listCategory(request, response);
				break;
				
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
		

	}

	protected void listCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		List<ProductCategory> categorieList = null;
		categorieList = productCategoryDAO.listProductCategories();
		request.setAttribute("categoryList", categorieList);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/category.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void showFormEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String CategoryName = new String(request.getParameter("CategoryName").getBytes("ISO-8859-1"), "UTF-8");
		request.setAttribute("CategoryName", CategoryName);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/edit-category.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void showFormAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-category.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void insertCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductCategory category = new ProductCategory();
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		// lấy nameCategory từ request của người dùng
		String nameCategory = new String(request.getParameter("NewCategoryName").getBytes("ISO-8859-1"), "UTF-8");
		category.setCategoryName(nameCategory);
		productCategoryDAO.addProductCategogy(category);

		response.sendRedirect(request.getContextPath()+"/admin-category");

	}
	protected void editCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductCategory category = new ProductCategory();
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();

		// lấy nameCategory từ request của người dùng
		String NewCategoryName = new String(request.getParameter("NewCategoryName").getBytes("ISO-8859-1"), "UTF-8");
		String OldCategoryName = new String(request.getParameter("OldCategoryName").getBytes("ISO-8859-1"), "UTF-8");
		
		productCategoryDAO.editProductCategory(OldCategoryName, NewCategoryName);
		response.sendRedirect(request.getContextPath()+"/admin-category");
	}

}
