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
			System.out.println("Added ShoppingCart for users with name" + userAccount.getName());
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
			root.fetch("shoppingCart", JoinType.LEFT);

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
            root.fetch("shoppingCartItems", JoinType.LEFT).fetch("productItem", JoinType.LEFT)
                    .fetch("variationOptions")
                    .fetch("variation");

            ShoppingCart shoppingCart = session.createQuery(query).uniqueResult();
            return shoppingCart.getShoppingCartItems();
        }
    }

}
