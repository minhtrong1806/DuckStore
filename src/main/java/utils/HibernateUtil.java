package utils;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import bean.Address;
import bean.Product;
import bean.ProductCategory;
import bean.ProductItem;
import bean.Promotion;
import bean.UserAccount;
import bean.Variation;

public class HibernateUtil {
	private final static SessionFactory FACTORY;

	static {
		Configuration conf = new Configuration();

		Properties pros = new Properties();
		pros.put(Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");
		pros.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
		pros.put(Environment.URL,
				"jdbc:sqlserver://26.46.117.205:2703;databaseName=duckstore;encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8;useUnicode=true");
		pros.put(Environment.USER, "sa");
		pros.put(Environment.PASS, "123456");

		conf.setProperties(pros);
		conf.addAnnotatedClass(Address.class);
		conf.addAnnotatedClass(UserAccount.class);
		conf.addAnnotatedClass(ProductCategory.class);
		conf.addAnnotatedClass(Promotion.class);
		conf.addAnnotatedClass(Variation.class);
		conf.addAnnotatedClass(Product.class);
		conf.addAnnotatedClass(ProductItem.class);
		
		ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();

		FACTORY = conf.buildSessionFactory(registry);

	}

	public static SessionFactory getSessionFactory() {
		return FACTORY;
	}
}
