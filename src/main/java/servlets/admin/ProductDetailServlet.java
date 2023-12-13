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
import utils.DeleteUtils;
import utils.UploadUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;


import DAO.ProductCategoryDAO;
import DAO.ProductDAO;
import DAO.ProductItemDAO;
import DAO.VariationOptionDAO;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.VariationOption;

@WebServlet({"/admin-product-detail",
	"/admin-product-detail/edit-variant",
	"/admin-product-detail/variant-detail",
	"/admin-product-detail/edit-product",
	"/admin-product-detail/delete-variant"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 10MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class ProductDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public static void name() {
		
	}
	
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
			case "/admin-product-detail/edit-product":
				editProduct(request, response);
				break;
			case "/admin-product-detail/variant-detail":
				showVariant(request, response);
				break;
			case "/admin-product-detail/delete-variant":
				deleteVariant(request, response);
				break;
			case "/admin-product-detail/edit-variant":
				editVariant(request, response);
				break;
			default:
				productDetail(request, response);
				break;
				
			}	
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	protected void editVariant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductItemDAO itemDAO = new ProductItemDAO();
		String itemIdString = request.getParameter("itemId");
		int itemId = -1;
		try {
			itemId = Integer.parseInt(itemIdString);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		ProductItem itemCurrent = itemDAO.getProductItem(itemId);
		int newQty = itemCurrent.getQty_in_stock();
		float newPrice = itemCurrent.getPrice();
		if (request.getParameter("newQty") != null) {
			try {
				newQty = Integer.parseInt(request.getParameter("newQty"));
			} catch (Exception e) {
			}
			
		}
		if (request.getParameter("newPrice") != null) {
			try {
				newPrice = Float.parseFloat(request.getParameter("newPrice"));
				System.out.println(newPrice);
			} catch (Exception e) {
			}
			
		}
		
		boolean success = itemDAO.editProductItem(itemId, newQty, newPrice);
		if (success) {
			response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+itemCurrent.getProduct().getProductID());
		}
	
		
	}
protected void showVariant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductItemDAO itemDAO = new ProductItemDAO();
		VariationOptionDAO variationOptionDAO = new VariationOptionDAO();
		String itemIdString = request.getParameter("itemId");
		
		int itemId = -1;
		try {
			itemId = Integer.parseInt(itemIdString);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if (itemId < 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-products" );
		}
		else {
			String itemFolder = request.getContextPath() + "\\views\\images\\products\\";
			ProductItem itemCurent = itemDAO.getProductItem(itemId);
			String size = null;
			String color = null;
			
			for(VariationOption variationOption:variationOptionDAO.getVariationOptionByProductItemID(itemId)) {
				if (variationOption.getVariation().getName().equals("size")) {
					size = variationOption.getValue();
				}
				else {
					color = variationOption.getValue();
				}
			}
			request.setAttribute("size",size);
			request.setAttribute("color",color);
			request.setAttribute("itemFolder",itemFolder);
			request.setAttribute("itemCurent",itemCurent);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/edit-variant.jsp");
			dispatcher.forward(request, response);
		}
	}
	protected void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String folderStore = Constant.DIR + "\\products\\";
		
		int productId = -1;
		try {
			productId = Integer.parseInt(request.getParameter("productId"));			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		ProductDAO productDAO = new ProductDAO();
		Product productCurrent = productDAO.getProductbyID(productId);
		
		String newName = productCurrent.getName();
		String newDescription = productCurrent.getDescription();
		String newCategoryName = productCurrent.getProductCategory().getCategoryName();
		String oldImage = productCurrent.getProduct_image();
		
		if (request.getParameter("newName") != null) {
			newName = request.getParameter("newName");
			productCurrent.setName(newName);
		}
		if (request.getParameter("newDescription") != null) {
			newDescription = request.getParameter("newDescription");
			productCurrent.setDescription(newDescription);
		}
		if (request.getParameter("newCategory") != null) {
			newCategoryName = request.getParameter("newCategory");
			ProductCategory newCategory = new ProductCategory(newCategoryName, null);
			productCurrent.setProductCategory(newCategory);
		}
		try {
			if (request.getPart("newProductImage").getSize() != 0) {
				String fileName = "Product" + System.currentTimeMillis();
				String productLink = UploadUtils.processUpload("newProductImage", request, folderStore , fileName);
				productCurrent.setProduct_image(productLink);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		boolean success = productDAO.editProduct(productId, productCurrent);
		if (success) {
			DeleteUtils.processDelete(oldImage, folderStore ,request);
		}
	}
	
	protected void deleteVariant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean hasErorr = false;
		int itemId = -1;
		int productId = -1;
	
		try {
			productId = Integer.parseInt(request.getParameter("productId"));			
		} catch (Exception e) {}
		
		try {
			itemId = Integer.parseInt(request.getParameter("itemId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (itemId < 0) {
			hasErorr = true;
		}
		
		if(hasErorr) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+productId);			
		}
		else {
			ProductItemDAO itemDAO = new ProductItemDAO();
			String fileNameStore = itemDAO.getProductItem(itemId).getProduct_image();
			String folderStore = Constant.DIR + "\\products\\";
			boolean deleteSuccess = itemDAO.deleteProductItem(itemId);
			System.out.println(fileNameStore);
			if (deleteSuccess) {
				DeleteUtils.processDelete(fileNameStore, folderStore,request);
				response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+productId);	
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("successMessage", "This variant cannot be deleted!");
				response.sendRedirect(request.getContextPath() + "/admin-product-detail?productId="+productId);	
			}
			
		}	
	}
		
	protected void productDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemFolder = request.getContextPath() + "\\views\\images\\products\\";
		String productFolder = request.getContextPath() + "\\views\\images\\products\\";
		
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
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/product-detail.jsp");
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
