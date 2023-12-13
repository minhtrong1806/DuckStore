package DAO;

import java.util.List;
import java.util.Set;

import javax.persistence.criteria.*;

import bean.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.Address;
import bean.UserAccount;
import utils.HibernateUtil;

public class AddressDAO {
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();

	public Set<Address> listAddressByUser(int userID) {
		try (Session session = factory.openSession()) {
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			query.select(root);
			query.where(builder.equal(root.get("userID"), userID));
			root.fetch("addresses", JoinType.LEFT);
			UserAccount userAccount = session.createQuery(query).uniqueResult();

			return userAccount.getAddresses();
		}
	}

	public void addAddressForUser(Address newAddress, int userID) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();

				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
				Root<UserAccount> userRoot = query.from(UserAccount.class);

				Predicate conditionPredicate = builder.equal(userRoot.get("userID"), userID);
				query.where(conditionPredicate);

				UserAccount userAccount = session.createQuery(query).uniqueResult();

				if (userAccount != null) {
					userAccount.getAddresses().add(newAddress);

					newAddress.setUserAccount(userAccount);
					session.save(newAddress);

					session.update(userAccount);
				}

				session.getTransaction().commit();

			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
				}
				e.printStackTrace();
			}
		}
	}
}
