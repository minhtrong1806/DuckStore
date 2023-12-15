package DAO;

import bean.ShoppingCartItem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.ShoppingCart;
import bean.UserAccount;
import utils.HibernateUtil;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.util.Set;

public class ShoppingCartDAO {
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();

	public void addShoppingCart(int userID) {
		try (Session session = factory.openSession()) {
			session.getTransaction().begin();

			UserAccountDAO userAccountDAO = new UserAccountDAO();
			UserAccount userAccount = userAccountDAO.getUserAccount(userID);

			ShoppingCart newsShoppingCart = new ShoppingCart(userAccount, null);

			session.save(newsShoppingCart);
			System.out.println("Added ShoppingCart for users with name " + userAccount.getName());
			session.getTransaction().commit();
		}
	}

	public ShoppingCart getShoppingCart(int userID){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			query.select(root);
			query.where(builder.equal(root.get("userID"), userID));
			root.fetch("shoppingCart", JoinType.LEFT).fetch("shoppingCartItems", JoinType.LEFT);

			UserAccount userAccount = session.createQuery(query).uniqueResult();
			return userAccount.getShoppingCart();
		}
	}

	public Set<ShoppingCartItem> listProductItemByUserID(int userID){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<ShoppingCart> query = builder.createQuery(ShoppingCart.class);
			Root<ShoppingCart> root = query.from(ShoppingCart.class);

			query.select(root);
			query.where(builder.equal(root.get("userAccount"), userID));
			root.fetch("shoppingCartItems", JoinType.LEFT)
					.fetch("productItem", JoinType.LEFT)
					.fetch("variationOptions", JoinType.LEFT)
					.fetch("variation", JoinType.LEFT);

			ShoppingCart shoppingCart = session.createQuery(query).uniqueResult();
			return shoppingCart.getShoppingCartItems();
		}
	}

	public float cartCheckoutByUserID(int userID){
		Set<ShoppingCartItem> shoppingCartItems = listProductItemByUserID(userID);
		float totalPrice = 0;
		for(ShoppingCartItem shoppingCartItem : shoppingCartItems){
			totalPrice = totalPrice + shoppingCartItem.getQty()*shoppingCartItem.getProductItem().getPrice();
		}
		return totalPrice;
	}

	public void cleanCartAfterCheckout(int userID){
		ShoppingCart shoppingCart = getShoppingCart(userID);
		try(Session session = factory.openSession()){
			try{
				session.getTransaction().begin();
				Set<ShoppingCartItem> shoppingCartItems = shoppingCart.getShoppingCartItems();
				shoppingCartItems.forEach(session::delete);
				session.getTransaction().commit();
				System.out.println("Successfully cleared the cart of user with id " + userID);
				session.close();
			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
					System.out.println("Cleaning up the cart of user with id " + userID + " failed");
				}
				e.printStackTrace();
			}
		}
	}

}
