package DAO;

import java.util.HashMap;


import java.util.Map;

import bean.UserAccount;


public class userAccountDAO {
	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	
	static {
		initUsers();
	}
	
	private static void initUsers() {

		// User này có 1 vai trò là EMPLOYEE.
		UserAccount staff = new UserAccount("staff@gmail.com", "123","Duy","0123",1);

		// User này có 2 vai trò EMPLOYEE và MANAGER.
		UserAccount mng = new UserAccount("manager@gmail.com", "123","Minh Trong", "0123",0);
		
		// User này có vai trò CUSTOMER.
				UserAccount ctm = new UserAccount("customer@gmail.com", "123","Hoai Trong", "0123", 2);

		mapUsers.put(staff.getEmail_address(), staff);
		mapUsers.put(mng.getEmail_address(), mng);
		mapUsers.put(ctm.getEmail_address(), ctm);
	}

	// Tìm kiếm người dùng theo email_address và password.
	public static UserAccount findUser(String email_address, String password) {
		UserAccount u = mapUsers.get(email_address);
		if (u != null && u.getPassword().equals(password)) {
			return u;
		}
		return null;
	}
}
