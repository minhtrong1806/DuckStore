package utils;

import java.util.Properties;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import bean.Address;
import bean.OrderLine;
import bean.OrderStatus;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.Promotion;
import bean.ShippingMethod;
import bean.ShopOrder;
import bean.ShoppingCart;
import bean.ShoppingCartItem;
import bean.UserAccount;
import bean.Variation;
import bean.VariationOption;


public class HibernateUtil {
	private final static SessionFactory FACTORY;

	static {
		Configuration conf = new Configuration();

		Properties pros = new Properties();
		pros.put(Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");
		pros.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
		pros.put(Environment.URL,
				"jdbc:sqlserver://192.168.1.8:1433;databaseName=DuckStore;encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8;useUnicode=true");
		pros.put(Environment.USER, "sa");
		pros.put(Environment.PASS, "123456");
		
		pros.put("hibernate.search.default.indexBase", "D:\\HOC\\2023_2024\\HK1\\lap_trinh_web\\DoAn-Workspace\\DuckStore\\indexes");

		conf.setProperties(pros);
		conf.addAnnotatedClass(Address.class);
		conf.addAnnotatedClass(UserAccount.class);
		conf.addAnnotatedClass(ProductCategory.class);
		conf.addAnnotatedClass(Promotion.class);
		conf.addAnnotatedClass(Variation.class);
		conf.addAnnotatedClass(Product.class);
		conf.addAnnotatedClass(ProductItem.class);
		conf.addAnnotatedClass(VariationOption.class);
		conf.addAnnotatedClass(ShoppingCart.class);
		conf.addAnnotatedClass(ShoppingCartItem.class);
		conf.addAnnotatedClass(ShippingMethod.class);
		conf.addAnnotatedClass(OrderStatus.class);
		conf.addAnnotatedClass(ShopOrder.class);
		conf.addAnnotatedClass(OrderLine.class);

		
		ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();

		FACTORY = conf.buildSessionFactory(registry);

	}

	public static SessionFactory getSessionFactory() {
		return FACTORY;
	}
}