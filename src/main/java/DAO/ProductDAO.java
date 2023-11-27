package DAO;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.Product;
import bean.ProductCategory;
import utils.HibernateUtil;

public class ProductDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();
	
	public Product getProduct(String productName) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Product> query = builder.createQuery(Product.class);
			Root<Product> root = query.from(Product.class);
			
			query.select(root);
			query.where(builder.equal(builder.lower(root.get("name")), productName.toLowerCase()));
			Product product = session.createQuery(query).uniqueResult();
			return product;
		}
	}
	
	public boolean addProduct(Product newProduct, ProductCategory productCategoryPick) {
	    try (Session session = factory.openSession()) {
	        try {
	            session.getTransaction().begin();

	            // Kiểm tra xem tên sản phẩm đã tồn tại chưa
	            if (!isProductNameExists(session, newProduct.getName())) {
	                newProduct.setProductCategory(productCategoryPick);
	                session.save(newProduct);
	                session.getTransaction().commit();

	                return true; // Trả về true nếu thêm mới thành công
	            } else {
	                System.out.println("Tên sản phẩm đã tồn tại. Không thể thêm mới.");
	                return false; // Trả về false nếu tên sản phẩm đã tồn tại
	            }
	        } catch (Exception e) {
	            if (session.getTransaction() != null) {
	                session.getTransaction().rollback();
	            }
	            e.printStackTrace();
	        }
	        return false; // Trả về false nếu có lỗi xảy ra
	    }
	}

	public boolean isProductNameExists(Session session, String productName) {
	    // Kiểm tra xem tên sản phẩm đã tồn tại chưa
	    CriteriaBuilder builder = session.getCriteriaBuilder();
	    CriteriaQuery<Long> query = builder.createQuery(Long.class);
	    Root<Product> root = query.from(Product.class);

	    query.select(builder.count(root));
	    query.where(builder.equal(builder.lower(root.get("name")), productName.toLowerCase()));

	    Long count = session.createQuery(query).uniqueResult();
	    return count != null && count > 0;
	}

	
	public boolean deleteProductByName(String productName) {
	    try (Session session = factory.openSession()) {
	        try {
	            session.getTransaction().begin();

	            CriteriaBuilder builder = session.getCriteriaBuilder();
	            CriteriaDelete<Product> deleteQuery = builder.createCriteriaDelete(Product.class);
	            Root<Product> root = deleteQuery.from(Product.class);

	            deleteQuery.where(builder.equal(root.get("name"), productName));

	            // Thực hiện xóa
	            int deletedCount = session.createQuery(deleteQuery).executeUpdate();

	            if (deletedCount > 0) {
	                session.getTransaction().commit();
	                return true; // Trả về true nếu xóa thành công
	            } else {
	                System.out.println("Không tìm thấy Product có tên: " + productName);
	                session.getTransaction().rollback();
	                return false; // Trả về false nếu không tìm thấy Product
	            }
	        } catch (Exception e) {
	            if (session.getTransaction() != null) {
	                session.getTransaction().rollback();
	            }
	            e.printStackTrace();
	        }
	        return false; // Trả về false nếu có lỗi xảy ra
	    }
	}

}
