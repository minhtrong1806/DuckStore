package DAO;

import java.util.List;

import javax.persistence.criteria.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.ShoppingCart;
import bean.UserAccount;
import utils.HibernateUtil;


public class UserAccountDAO {
	//	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();
	/*
	 * static { initUsers(); }
	 */

	public UserAccount getUserAccount(int userID) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			query.select(root);
			query.where(builder.equal(root.get("userID"), userID));
			root.fetch("addresses", JoinType.LEFT);

			UserAccount userAccount = session.createQuery(query).uniqueResult();
			return userAccount;
		}
	}

	// Liệt kê danh sách các user
	public List<UserAccount> listUserAccounts() {
		try (Session session = factory.openSession()) {
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			query.select(root);
			Query<UserAccount> getUserQuery = session.createQuery(query);
			List<UserAccount> resultAccounts = getUserQuery.getResultList();
			session.close();
			return resultAccounts;
		}
	}

	// Kiểm tra đăng nhập bằng email và password
	public boolean checkLogin(String email, String password) {
		try (Session session = factory.openSession()) {
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Long> query = builder.createQuery(Long.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			Predicate conditionPredicate = builder.and(builder.equal(root.get("emailAddress"), email),
					builder.equal(root.get("password"), password));

			query.select(builder.count(root)).where(conditionPredicate);

			Query<Long> countQuery = session.createQuery(query);
			Long count = countQuery.uniqueResult();
			session.close();
			if (count > 0) {
				return true;
			}
			return false;
		}
	}

	// Tìm kiếm user theo email
	public UserAccount findUser(String email) {
		try (Session session = factory.openSession()) {
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);

			Predicate conditionPredicate = builder.equal(root.get("emailAddress"), email);

			query.where(conditionPredicate);

			Query<UserAccount> getUserQuery = session.createQuery(query);
			List<UserAccount> userAccountsList = getUserQuery.getResultList();
			// Kiểm tra xem danh sách có phần tử hay không
			if (!userAccountsList.isEmpty()) {
				// Nếu có ít nhất một phần tử, lấy phần tử đầu tiên
				UserAccount userAccount = userAccountsList.get(0);
				session.close();
				return userAccount;
			} else {
				// Nếu danh sách trống, trả về null
				session.close();
				return null;
			}
		}
	}

	// Thêm 1 user mới kèm theo địa chỉ (nếu có)
	public void addUser(UserAccount newUserAccount) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();

				session.save(newUserAccount);
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

	// Xoá 1 user ra khỏi hệ thông
	public void deleteUser(int userID) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();
				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
				Root<UserAccount> root = query.from(UserAccount.class);

				Predicate condition = builder.equal(root.get("userID"), userID);
				query.where(condition);

				Query<UserAccount> result = session.createQuery(query);
				UserAccount userAccount = result.getSingleResult();

				session.delete(userAccount);
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

	// edit User
	public void editUser(int userID, UserAccount newUserAccount) {
		try (Session session = factory.openSession()) {

			try {
				session.getTransaction().begin();

				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
				Root<UserAccount> root = query.from(UserAccount.class);

				// Tìm kiếm UserAccount dựa trên oldEmail
				Predicate conditionPredicate = builder.equal(root.get("userID"), userID);
				query.where(conditionPredicate);

				UserAccount userAccount = session.createQuery(query).uniqueResult();

				// Kiểm tra nếu userAccount không null và có giá trị mới được truyền vào
				if (userAccount != null) {
					if (newUserAccount.getEmailAddress() != null) {
						userAccount.setEmailAddress(newUserAccount.getEmailAddress());
					}
					if (newUserAccount.getPhone_number() != null) {
						userAccount.setPhone_number(newUserAccount.getPhone_number());
					}
					if (newUserAccount.getPassword() != null) {
						userAccount.setPassword(newUserAccount.getPassword());
					}
					if (newUserAccount.getName() != null) {
						userAccount.setName(newUserAccount.getName());
					}
					if (newUserAccount.getRole() != null) {
						userAccount.setRole(newUserAccount.getRole());
					}
					// Cập nhật UserAccount trong cơ sở dữ liệu
					session.update(userAccount);
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
}
