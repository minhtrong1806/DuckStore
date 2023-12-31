package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import bean.OrderLine;
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
			org.apache.lucene.search.Query luceneQuery = mythQB.phrase().onField("name").sentence(name).createQuery();
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

	public Product getProduct(int productID) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Product> query = builder.createQuery(Product.class);
			Root<Product> root = query.from(Product.class);

			query.select(root);
			query.where(builder.equal(builder.lower(root.get("productID")), productID));
			root.fetch("productItems", JoinType.LEFT);

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

	public boolean deteleProduct(int productID){
		try(Session session = factory.openSession()){
			session.getTransaction().begin();
			Product product = getProduct(productID);
			if(product.getProductItems().size() == 0){
				session.delete(product);
				System.out.println("Successfully deleted product");
				session.getTransaction().commit();
				session.close();
				return true;
			}
			else {
				System.out.println("This product does exist product item");
				session.close();
				return false;
			}
		}
	}

	public boolean editProduct(int oldProductID, Product newProduct){
        try(Session session = factory.openSession()){
            try{
                session.getTransaction().begin();
				Product oldProduct = getProduct(oldProductID);
				if(newProduct.getProductCategory() != null){
					oldProduct.setProductCategory(newProduct.getProductCategory());
				}
				if(newProduct.getName() != null && !isProductNameExists(session ,newProduct.getName())){
					oldProduct.setName(newProduct.getName());
				}
				if(newProduct.getDescription() != null){
					oldProduct.setDescription(newProduct.getDescription());
				}
				if(newProduct.getProduct_image() != null){
					oldProduct.setProduct_image(newProduct.getProduct_image());
				}
                session.saveOrUpdate(oldProduct);
                session.getTransaction().commit();
                System.out.println("Successfully edit product");
                session.close();
            }catch (Exception e){
                if (session.getTransaction() != null) {
                    session.getTransaction().rollback();
                }
                System.out.println("An error occurred during the update process");
                e.printStackTrace();
            }
			return false;
		}
	}

	public List<Product> getProductsByPage(List<Product> productList, int pageNumber, int pageSize) {
	    if (productList == null || pageNumber <= 0 || pageSize <= 0) {
	        throw new IllegalArgumentException("Invalid input parameters");
	    }

	    int totalProducts = productList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

	    if (pageNumber > totalPages) {
	        throw new IllegalArgumentException("Page number exceeds total pages");
	    }

	    int fromIndex = (pageNumber - 1) * pageSize;
	    int toIndex = Math.min(fromIndex + pageSize, totalProducts);

	    if (fromIndex > toIndex) {
	        throw new IllegalArgumentException("Invalid input parameters");
	    }

	    return new ArrayList<>(productList.subList(fromIndex, toIndex));
	}


	public int totalItem(int productID){
		Product product = getProduct(productID);
		int total = 0;
		for(ProductItem productItem : product.getProductItems()){
			total = total+productItem.getQty_in_stock();
		}
		return total;
	}
	public int totalSold(int productID){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<OrderLine> query = builder.createQuery(OrderLine.class);
			Root<OrderLine> root = query.from(OrderLine.class);

			query.where(builder.equal(root.get("productItem").get("product"), productID));
			List<OrderLine> orderLines =  session.createQuery(query).getResultList();
			int totalSale = 0;
			for(OrderLine orderLine : orderLines){
				totalSale = totalSale + orderLine.getQty();
			}
			return totalSale;
		}
	}

}
