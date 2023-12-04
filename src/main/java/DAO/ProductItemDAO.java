package DAO;

import java.util.Random;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.Product;
import bean.ProductItem;
import bean.VariationOption;
import utils.HibernateUtil;

public class ProductItemDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();
	
	
	
	public ProductItem getProductItem(int productItemID) {
		try(Session session = factory.openSession()){
			ProductItem productItem = session.get(ProductItem.class, productItemID);
			return productItem;
		}
	}
	
	public boolean addProductItem(ProductItem newProductItem, int ProductID, String size, String color) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				
				VariationOptionDAO variationOptionDAO = new VariationOptionDAO();
				ProductDAO productDAO = new ProductDAO();
				
				Product newProduct = productDAO.getProductbyID(ProductID);
				
				Random random = new Random();
				int randomSuffix = random.nextInt(10000);
				String sku = newProduct.getName().substring(0, 4) + color.substring(0, 1) + size.substring(0, 1) + randomSuffix;
				newProductItem.setSku(sku);

				VariationOption variationOptionSize = variationOptionDAO.getVariationOption(size, session);
				VariationOption variationOptionColor = variationOptionDAO.getVariationOption(color, session);

				newProductItem.getVariationOptions().add(variationOptionSize);
				newProductItem.getVariationOptions().add(variationOptionColor);
				newProductItem.setProduct(newProduct);

				variationOptionSize.getProductItems().add(newProductItem);
				variationOptionColor.getProductItems().add(newProductItem);

				session.save(newProductItem);
				session.saveOrUpdate(variationOptionColor);
				session.saveOrUpdate(variationOptionSize);

				System.out.println("New ProductItem ID: " + newProductItem.getProductItemID());
				
				session.getTransaction().commit();
				session.close();
				return true;
				
			} catch (Exception e) {
	            if (session.getTransaction() != null) {
	                session.getTransaction().rollback();
	            }
	            e.printStackTrace();
			}return false;
		}
	}
	
	public boolean isProductItemNameExists(Session session, ProductItem productItem) {
	    // Kiểm tra xem tên sản phẩm đã tồn tại chưa
	    CriteriaBuilder builder = session.getCriteriaBuilder();
	    CriteriaQuery<Long> query = builder.createQuery(Long.class);
	    Root<ProductItem> root = query.from(ProductItem.class);

	    query.select(builder.count(root));
	    query.where(builder.equal(builder.lower(root.get("sku")), productItem.getSku().toLowerCase()));

	    Long count = session.createQuery(query).uniqueResult();
	    return count != null && count > 0;
	}
}
