package DAO;

import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.persistence.criteria.*;

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
            return session.get(ProductItem.class, productItemID);
		}
	}
	
	public boolean addProductItem(ProductItem newProductItem, int ProductID, String size, String color) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				
				VariationOptionDAO variationOptionDAO = new VariationOptionDAO();
				ProductDAO productDAO = new ProductDAO();
				
				Product product = productDAO.getProduct(productDAO.getProductbyID(ProductID).getName());
                ProductItem oldProductItem = getProductItemsByConditions(ProductID, size, color);
                if(oldProductItem != null){
                    int oldQuantity = oldProductItem.getQty_in_stock();
                    oldProductItem.setQty_in_stock(oldQuantity+newProductItem.getQty_in_stock());
                    System.out.println("Save new quantity with product item ID: " + oldProductItem.getProductItemID());
                    session.saveOrUpdate(oldProductItem);
                }
                else {
                    Random random = new Random();
                    int randomSuffix = random.nextInt(10000);
                    String sku = product.getName().substring(0, 4) + color.charAt(0) + size.charAt(0) + randomSuffix;
                    newProductItem.setSku(sku);

                    VariationOption variationOptionSize = variationOptionDAO.getVariationOption(size, session);
                    VariationOption variationOptionColor = variationOptionDAO.getVariationOption(color, session);

                    newProductItem.getVariationOptions().add(variationOptionSize);
                    newProductItem.getVariationOptions().add(variationOptionColor);
                    newProductItem.setProduct(product);

                    variationOptionSize.getProductItems().add(newProductItem);
                    variationOptionColor.getProductItems().add(newProductItem);

                    session.save(newProductItem);
                    session.saveOrUpdate(variationOptionColor);
                    session.saveOrUpdate(variationOptionSize);
                    session.close();
                    System.out.println("New ProductItem ID: " + newProductItem.getProductItemID());
                }
				session.getTransaction().commit();
				session.close();
				return true;

			} catch (Exception e) {
	            if (session.getTransaction() != null) {
	                session.getTransaction().rollback();
	            }
	            e.printStackTrace();
			}

		}
        return false;
	}

    public ProductItem getProductItemsByConditions(int productID, String size, String color) throws Exception{
        try(Session session = factory.openSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<ProductItem> query = builder.createQuery(ProductItem.class);
            Root<ProductItem> root = query.from(ProductItem.class);

            Predicate condition = builder.equal(root.get("product").get("productID"), productID);
            query.where(condition);
            root.fetch("variationOptions", JoinType.INNER);

            List<ProductItem> productItemSet = session.createQuery(query).getResultList();

            for(ProductItem productItem : productItemSet){
                Set<VariationOption> variationOptions = productItem.getVariationOptions();

                boolean containColor = false;
                boolean contrainSize = false;

                for(VariationOption variationOption : variationOptions){
                    if(size.equals(variationOption.getValue())){
                        contrainSize = true;
                    }
                    else if(color.equals(variationOption.getValue())){
                        containColor = true;
                    }
                }
                if(containColor && contrainSize){
                    return productItem;
                }
            }
            return null;
        }
    }
}
