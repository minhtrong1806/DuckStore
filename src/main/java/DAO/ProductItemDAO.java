package DAO;

import java.util.Random;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.VariationOption;
import utils.HibernateUtil;

public class ProductItemDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();
	
	public void addListProductItem(ProductItem newProductItem, Product newProduct, Set<String> setSize, Set<String> setColor, String newProductCategoryName) {
		for(String itemColorString : setColor) {
			for(String itemSizeString : setSize) {
				addProductItem(newProductItem, newProduct, itemSizeString, itemColorString, newProductCategoryName);
			}
		}
	}
	
	public void addProductItem(ProductItem newProductItem, Product newProduct, String size, String color, String newProductCategoryName) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				
				VariationOptionDAO variationOptionDAO = new VariationOptionDAO();
				ProductDAO productDAO = new ProductDAO();
				ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
				ProductCategory productCategory = new ProductCategory();
				
				if(!productCategoryDAO.isProductCategoryExists(session, newProductCategoryName)) {
					productCategory.setCategoryName(newProductCategoryName);
					productCategoryDAO.addProductCategogy(productCategory);
				}
				else {
					productCategory = productCategoryDAO.getProductCategory(newProductCategoryName);
				}
				
				if (!productDAO.isProductNameExists(session, newProduct.getName())) {
					productDAO.addProduct(newProduct, productCategory);
				}
				else {
					newProduct = productDAO.getProduct(newProduct.getName());
				}
				
				VariationOption variationOptionSize = variationOptionDAO.getVariationOption(size, session);
				VariationOption variationOptionColor = variationOptionDAO.getVariationOption(color, session);
				
				newProductItem.getVariationOptions().add(variationOptionSize);
				newProductItem.getVariationOptions().add(variationOptionColor);
				newProductItem.setProduct(newProduct);
				
				variationOptionSize.getProductItems().add(newProductItem);
				variationOptionColor.getProductItems().add(newProductItem);
				
				Random random = new Random();
				int randomSuffix = random.nextInt(1000000);
				String sku = newProduct.getName().substring(0, 2) + color.substring(0, 1) + size.substring(0, 1) + randomSuffix;
				newProductItem.setSku(sku);
				
				session.save(newProductItem);
				session.saveOrUpdate(variationOptionColor);
				session.saveOrUpdate(variationOptionSize);
				//session.saveOrUpdate(newProduct);
				
				System.out.println("New ProductItem ID: " + newProductItem.getProductItemID());
				session.getTransaction().commit();
				session.close();
			} catch (Exception e) {
	            if (session.getTransaction() != null) {
	                session.getTransaction().rollback();
	            }
	            e.printStackTrace();
			}
		}
	}
	
	public boolean isProductItemNameExists(Session session, String productName) {
	    // Kiểm tra xem tên sản phẩm đã tồn tại chưa
	    CriteriaBuilder builder = session.getCriteriaBuilder();
	    CriteriaQuery<Long> query = builder.createQuery(Long.class);
	    Root<Product> root = query.from(Product.class);

	    query.select(builder.count(root));
	    query.where(builder.equal(builder.lower(root.get("sku")), productName.toLowerCase()));

	    Long count = session.createQuery(query).uniqueResult();
	    return count != null && count > 0;
	}
}
