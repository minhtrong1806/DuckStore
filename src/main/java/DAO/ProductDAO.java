package DAO;

import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.lucene.search.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.SearchFactory;
import org.hibernate.search.query.dsl.QueryBuilder;
import utils.HibernateUtil;

public class ProductDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();

    public List<Product> searchProduct(String name) throws Exception{
        try(Session session = factory.openSession()) {
            FullTextSession fullTextSession = Search.getFullTextSession(session);
            fullTextSession.createIndexer().startAndWait();
            SearchFactory searchFactory = fullTextSession.getSearchFactory();

            QueryBuilder mythQB = searchFactory.buildQueryBuilder().forEntity(Product.class).get();
            Query luceneQuery = mythQB.phrase().onField("name").sentence(name).createQuery();
            FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(luceneQuery, Product.class);

            return fullTextQuery.getResultList();
        }
    }

	public List<Product> getProductList(){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Product> query = builder.createQuery(Product.class);
			Root<Product> root = query.from(Product.class);

			query.select(root);
            return session.createQuery(query).getResultList();
		}
	}

	public Set<ProductItem> getProductItemsByProduct(int productID){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Product> query = builder.createQuery(Product.class);
			Root<Product> root = query.from(Product.class);
			
			Predicate condition = builder.equal(root.get("productID"), productID);
			query.where(condition);
			root.fetch("productItems", JoinType.LEFT);
			
			Product products = session.createQuery(query).uniqueResult();

            return products.getProductItems();
		}
	}
	
	public Product getProduct(String productName) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Product> query = builder.createQuery(Product.class);
			Root<Product> root = query.from(Product.class);
			
			query.select(root);
			query.where(builder.equal(builder.lower(root.get("name")), productName.toLowerCase()));
            return session.createQuery(query).uniqueResult();
		}
	}
	
	public Product getProductbyID(int productID) {
		try(Session session = factory.openSession()){
            return session.get(Product.class, productID);
		}
	}
	
	public boolean addProduct(Product newProduct, String productCategoryPick) {
	    try (Session session = factory.openSession()) {
	        try {
	            session.getTransaction().begin();
	            
	            // Lấy product category để thêm product
	            ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
	            ProductCategory productCategory = productCategoryDAO.getProductCategory(productCategoryPick);  
	            
	            // Kiểm tra xem tên sản phẩm đã tồn tại chưa
	            if (!isProductNameExists(session, newProduct.getName())) {
	                newProduct.setProductCategory(productCategory);
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
}
