package DAO;

import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.Product;
import bean.ProductCategory;
import utils.HibernateUtil;

public class ProductCategoryDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();
	
	public ProductCategory getProductCategory(String productCategoryName) {
		try (Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> query = builder.createQuery(ProductCategory.class);
			Root<ProductCategory> root = query.from(ProductCategory.class);
			
			Predicate conditionPredicate = builder.equal(root.get("categoryName"), productCategoryName);
			query.where(conditionPredicate);
			
			Query<ProductCategory> productCategoryQuery = session.createQuery(query);
			ProductCategory productCategoryPickCategory = productCategoryQuery.uniqueResult();
			session.close();
			if(productCategoryPickCategory != null) {
				return productCategoryPickCategory;
			}
			else {
				return null;
			}
		}
	}
	public ProductCategory getProductCategorybyID(int productCategoryID) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> query = builder.createQuery(ProductCategory.class);
			Root<ProductCategory> root = query.from(ProductCategory.class);
			
			//query.select(root);
			query.where(builder.equal(root.get("productCategoryID"), productCategoryID));
			
			ProductCategory productCategory = session.createQuery(query).uniqueResult();
			return productCategory;
		}
	}
	public boolean isProductCategoryExists(Session session, String nameProductCategory) {
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Long> query = builder.createQuery(Long.class);
		Root<ProductCategory> root = query.from(ProductCategory.class);
		
		query.select(builder.count(root));
		query.where(builder.equal(builder.lower(root.get("categoryName")), nameProductCategory.toLowerCase()));
		
		Long count = session.createQuery(query).uniqueResult();
		return count != null && count > 0;
	}
	
	public boolean addProductCategogy(ProductCategory productCategory) {
		try (Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				
				session.save(productCategory);
				session.getTransaction().commit();
				session.close();
				return true;
				
			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
				}
				e.printStackTrace();
			}
			return false;
		}
	}
	
	public List<ProductCategory> listProductCategories(){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> query = builder.createQuery(ProductCategory.class);
			Root<ProductCategory> root = query.from(ProductCategory.class);
			
			query.select(root);
			Query<ProductCategory> getProductCategory = session.createQuery(query);
			List<ProductCategory> resultList = getProductCategory.getResultList();
			session.close();
			return resultList;
		}
	}
	
	public void editProductCategory(String productCategoryName, String newProductCategoryName) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				
				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<ProductCategory> query = builder.createQuery(ProductCategory.class);
				Root<ProductCategory> root = query.from(ProductCategory.class);
				
				Predicate conditionPredicate = builder.equal(root.get("categoryName"), productCategoryName);
				query.where(conditionPredicate);
				
				ProductCategory productCategory = session.createQuery(query).uniqueResult();
				
				if(productCategory != null) {
					if(newProductCategoryName != null) {
						productCategory.setCategoryName(newProductCategoryName);
					}
					session.update(productCategory);
				}
				session.getTransaction().commit();
				
			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
				}
				e.printStackTrace();
			}
			session.close();
		}
	}
	
	public Set<Product> getProductByCategory(String productCategoryName) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> query = builder.createQuery(ProductCategory.class);
			Root<ProductCategory> root = query.from(ProductCategory.class);
			
			Predicate conditionPredicate = builder.equal(root.get("categoryName"), productCategoryName);
			query.where(conditionPredicate);
			root.fetch("products", JoinType.LEFT);
			
			ProductCategory productCategory = session.createQuery(query).uniqueResult();
			session.close();
			if(productCategory != null) {
				Set<Product> products = productCategory.getProducts();
				return products;
			}
			return null;
		}
	}	
}
