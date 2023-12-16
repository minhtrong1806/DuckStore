package config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {
	public static final String ROLE_MANAGER = "MANAGER";
	public static final String ROLE_STAFF = "STAFF";
	public static final String ROLE_CUSTOMER = "CUSTOMER";
	

	// String: Role
	// List<String>: urlPatterns.
	private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

	static {
		init();
	}

	private static void init() {

		// Cấu hình cho vai trò "STAFF".
		List<String> urlPatterns1 = new ArrayList<String>();
		
		urlPatterns1.add("/admin-products");	
		urlPatterns1.add("/admin-product/*");	
		urlPatterns1.add("/admin-add-product");
		urlPatterns1.add("/admin-add-product/*");
		urlPatterns1.add("/admin-product-detail");
		urlPatterns1.add("/admin-product-detail/*");
		urlPatterns1.add("/admin-category");
		urlPatterns1.add("/admin-category/*");
		urlPatterns1.add("/admin-add-variant");
		urlPatterns1.add("/admin-order-detail");
		urlPatterns1.add("/admin-orders");
	
		mapConfig.put(ROLE_STAFF, urlPatterns1);

		// Cấu hình cho vai trò "MANAGER".
		List<String> urlPatterns2 = new ArrayList<String>();
		
		urlPatterns2.add("/admin-promotions");
		urlPatterns2.add("/admin-add-promotion");
		urlPatterns2.add("/admin-users");
		urlPatterns2.add("/admin-user/*");
		
		mapConfig.put(ROLE_MANAGER, urlPatterns2);
		
		// Cấu hình cho vai trò "CUSTOMER".
		List<String> urlPatterns3 = new ArrayList<String>();

		urlPatterns3.add("/info");
		urlPatterns3.add("/edit-info");
		urlPatterns3.add("/address");
		urlPatterns3.add("/add-address");
		urlPatterns3.add("/edit-address");
		urlPatterns3.add("/change-password");
		urlPatterns3.add("/shopping-cart");
		urlPatterns3.add("/payment");
		urlPatterns3.add("/add-to-card");
		urlPatterns3.add("/delete-item-cart");

		mapConfig.put(ROLE_CUSTOMER, urlPatterns3);
	}

	public static Set<String> getAllAppRoles() {
		return mapConfig.keySet();
	}

	public static List<String> getUrlPatternsForRole(String role) {
		return mapConfig.get(role);
	}

}
