package DAO;

import bean.PaymentMethod;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

public class PaymentMethodDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public PaymentMethod getPaymentMethod(int paymentMethodID){
        try(Session session = factory.openSession()){
            return session.get(PaymentMethod.class, paymentMethodID);
        }
    }
}
