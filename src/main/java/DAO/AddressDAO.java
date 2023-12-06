package DAO;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.Address;
import bean.UserAccount;
import utils.HibernateUtil;

public class AddressDAO {
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();

	public List<Address> listAddressByUser(String email) {
		try (Session session = factory.openSession()) {
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Address> query = builder.createQuery(Address.class);
			Root<UserAccount> useRoot = query.from(UserAccount.class);

			Join<Address, UserAccount> addressJoin = useRoot.join("addresses");

			query.multiselect(addressJoin).where(builder.equal(useRoot.get("emailAddress"), email));

			Query<Address> addressQuery = session.createQuery(query);

			return addressQuery.getResultList();
		}
	}

	public void addAddressForUser(Address newAddress, String email) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();

				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
				Root<UserAccount> userRoot = query.from(UserAccount.class);

				Predicate conditionPredicate = builder.equal(userRoot.get("emailAddress"), email);
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

	public void editAddress(String email, String newUnitNumber, String newAddressLine, String newCity,
			String newDistrict) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();

				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<Address> query = builder.createQuery(Address.class);
				Root<UserAccount> addressRoot = query.from(UserAccount.class);

			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
