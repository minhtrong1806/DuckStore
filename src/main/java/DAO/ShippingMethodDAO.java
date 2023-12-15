package DAO;

import bean.ShippingMethod;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;


public class ShippingMethodDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public ShippingMethod getShippingMethod(int shippingMethodID){
        try(Session session = factory.openSession()){
            return session.get(ShippingMethod.class, shippingMethodID);
        }
    }
}
