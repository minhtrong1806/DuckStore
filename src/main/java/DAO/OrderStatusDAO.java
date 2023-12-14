package DAO;

import bean.OrderStatus;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class OrderStatusDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public OrderStatus getOrderStatus(int orderStatusID){
        try(Session session = factory.openSession()){
            return session.get(OrderStatus.class, orderStatusID);
        }
    }

    public OrderStatus getStatusForNewOrder(){
        try(Session session = factory.openSession()){
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<OrderStatus> query = builder.createQuery(OrderStatus.class);
            Root<OrderStatus> root = query.from(OrderStatus.class);

            query.select(root);
            query.where(builder.equal(root.get("status"), "Preparing orders"));
            return session.createQuery(query).uniqueResult();
        }
    }

}
