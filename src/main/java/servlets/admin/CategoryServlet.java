package servlets.admin;

import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import DAO.ProductCategoryDAO;
import bean.Product;
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
		List<ProductCategory> categorieList = productCategoryDAO.listProductCategories();
		HashMap<Integer, Integer> qtyProductOfCategory = new HashMap<Integer, Integer>();
		
		qtyProductOfCategory = getQty(categorieList, productCategoryDAO);
		
		request.setAttribute("categoryList", categorieList);
		request.setAttribute("qty", qtyProductOfCategory);
			
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/category.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	private HashMap<Integer, Integer> getQty(List<ProductCategory> categorieList, ProductCategoryDAO productCategoryDAO) {
		HashMap<Integer, Integer> qtyProductOfCategory = new HashMap<Integer, Integer>();
		for (ProductCategory category:categorieList) {
			Set<Product> productList = productCategoryDAO.getProductByCategory(category.getCategoryName());
			int qty = productList.size();
			qtyProductOfCategory.put(category.getProductCategoryID(), qty);	
		}
		return qtyProductOfCategory;
	}
	
	protected void showFormEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String CategoryName = new String(request.getParameter("CategoryName").getBytes(), "UTF-8");
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
		
		String errorString = "";
		boolean hasError = false;
		
		ProductCategory category = new ProductCategory();
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		// lấy nameCategory từ request của người dùng
		String nameCategory = request.getParameter("NewCategoryName");
		
		if(nameCategory == null || nameCategory.isEmpty()) {
			errorString += "Empty values ​​are not allowed"; 
			hasError = true;
		}
		
		if (hasError) {
			request.setAttribute("errorString", errorString);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-category.jsp");
			dispatcher.forward(request, response);
		}
		else {
			category.setCategoryName(nameCategory);
			productCategoryDAO.addProductCategogy(category);
			
			// Lưu thông báo vào session attribute
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "The category has been added successfully!");
			response.sendRedirect(request.getContextPath() + "/admin-category");
			
		}
		

	}
	protected void editCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();

		// lấy nameCategory từ request của người dùng
		String NewCategoryName = new String(request.getParameter("NewCategoryName").getBytes(), "UTF-8");
		String OldCategoryName = new String(request.getParameter("OldCategoryName").getBytes(), "UTF-8");
		
		productCategoryDAO.editProductCategory(OldCategoryName, NewCategoryName);
		
		response.sendRedirect(request.getContextPath()+"/admin-category");
	}

}
