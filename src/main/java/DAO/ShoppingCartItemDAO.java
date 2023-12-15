package DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.ProductItem;
import bean.ShoppingCart;
import bean.ShoppingCartItem;
import utils.HibernateUtil;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Set;

public class ShoppingCartItemDAO {
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();

	public boolean addProductToShoppingCart(int productItemID, int userID, int quantity) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();

				ShoppingCart shoppingCart = shoppingCartDAO.getShoppingCart(userID);
				ProductItem productItem = session.get(ProductItem.class, productItemID);

				Set<ShoppingCartItem> shoppingCartItems = shoppingCartDAO.listProductItemByUserID(userID);
				boolean oldItem = false;
				for(ShoppingCartItem shoppingCartItem : shoppingCartItems){
					if(shoppingCartItem.getProductItem().getProductItemID() == productItemID){
						oldItem = true;
						int new_quantity = shoppingCartItem.getQty() + quantity;
						shoppingCartItem.setQty(new_quantity);
						session.saveOrUpdate(shoppingCartItem);
					}
				}
				if(!oldItem) {
					ShoppingCartItem shoppingCartItem = new ShoppingCartItem(quantity, shoppingCart, productItem);
					session.save(shoppingCartItem);
				}
				System.out.println("Completed adding items to cart");
				session.getTransaction().commit();
				session.close();
				return true;

			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
					System.out.println("Failed adding items to cart");
				}
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean deleleProductToShoppingCart(int productItemID, int userID){
        try(Session session = factory.openSession()){
            try{
                session.getTransaction().begin();
                CriteriaBuilder builder = session.getCriteriaBuilder();
                CriteriaQuery<ShoppingCartItem> query = builder.createQuery(ShoppingCartItem.class);
                Root<ShoppingCartItem> root = query.from(ShoppingCartItem.class);

                ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
                ShoppingCart shoppingCart = shoppingCartDAO.getShoppingCart(userID);

                Predicate predicate = builder.and(
                        builder.equal(root.get("shoppingCart"), shoppingCart.getShoppingCartID()),
                        builder.equal(root.get("productItem"), productItemID)
                );
                query.where(predicate);
                ShoppingCartItem shoppingCartItem = session.createQuery(query).uniqueResult();
				session.delete(shoppingCartItem);
				System.out.println("Completed removing item from cart");
				session.getTransaction().commit();
				session.close();
				return true;
			}catch (Exception e){
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
					System.out.println("Failed removing item from cart");
				}
				e.printStackTrace();
			}
		}
		return false;
	}
}
