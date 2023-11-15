package DAO;

import java.util.List;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.UserAccount;
import utils.HibernateUtil;



public class userAccountDAO {
//	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	private static final SessionFactory factory = HibernateUtil.getSessionFactory();
	/*
	 * static { initUsers(); }
	 */

	
	// Liệt kê danh sách các user
	public List<UserAccount> listUserAccounts(){
		try(Session session = factory.openSession()){
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


            Predicate conditionPredicate = builder.and(
                    builder.equal(root.get("emailAddress"), email),
                    builder.equal(root.get("password"), password));

            query.select(builder.count(root)).where(conditionPredicate);


            Query<Long> countQuery = session.createQuery(query);
            Long count = countQuery.uniqueResult();
            session.close();
            if(count > 0) {
            	return true;
            }
            return false;
        }
    }
	
	// Tìm kiếm user theo email
	public UserAccount findUser(String email) {
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
			Root<UserAccount> root = query.from(UserAccount.class);
			
			Predicate conditionPredicate = builder.equal(root.get("email_address"), email);
			
			query.where(conditionPredicate);
			
			Query<UserAccount> getUserQuery = session.createQuery(query);
			UserAccount userAccounts = getUserQuery.getSingleResult();
			session.close();
			return userAccounts;
		}
	}
	
	// Thêm 1 user mới kèm theo địa chỉ (nếu có)
	public void addUser(UserAccount newUserAccount) {
		try(Session session = factory.openSession()){
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
	public void deleteUser(String email) {
		try(Session session = factory.openSession()){
			try {
				session.getTransaction().begin();
				CriteriaBuilder builder = session.getCriteriaBuilder();
				CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
				Root<UserAccount> root = query.from(UserAccount.class);
				
				Predicate condition = builder.equal(root.get("email_address"), email);
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
	public void editUser(String oldEmail, String newEmail, String newPhoneNumber, String newPassword) {
		try(Session session = factory.openSession()){
            try {
                session.getTransaction().begin();

                CriteriaBuilder builder = session.getCriteriaBuilder();
                CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
                Root<UserAccount> root = query.from(UserAccount.class);

                // Tìm kiếm UserAccount dựa trên oldEmail
                Predicate conditionPredicate = builder.equal(root.get("emailAddress"), oldEmail);
                query.where(conditionPredicate);

                UserAccount userAccount = session.createQuery(query).uniqueResult();

                // Kiểm tra nếu userAccount không null và có giá trị mới được truyền vào
                if (userAccount != null) {
                    if (newEmail != null) {
                        userAccount.setEmail_address(newEmail);
                    }
                    if (newPhoneNumber != null) {
                        userAccount.setPhone_number(newPhoneNumber);
                    }
                    if (newPassword != null) {
                        userAccount.setPassword(newPassword);
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
	
	/*
	 * private static void initUsers() {
	 * 
	 * // User này có 1 vai trò là EMPLOYEE. UserAccount staff = new
	 * UserAccount("staff@gmail.com", "123","0123",1);
	 * 
	 * // User này có 2 vai trò EMPLOYEE và MANAGER. UserAccount mng = new
	 * UserAccount("manager@gmail.com", "123", "0123",0);
	 * 
	 * // User này có vai trò CUSTOMER. UserAccount ctm = new
	 * UserAccount("customer@gmail.com", "123", "0123", 2);
	 * 
	 * mapUsers.put(staff.getEmail_address(), staff);
	 * mapUsers.put(mng.getEmail_address(), mng);
	 * mapUsers.put(ctm.getEmail_address(), ctm); }
	 */

}
