package DAO;

import bean.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
import java.util.Set;

public class ShopOrderDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public void addShopOrder(int shippingMethodID, int addressID, int userID, int paymentMethodID){
        ShippingMethodDAO shippingMethodDAO = new ShippingMethodDAO();
        AddressDAO addressDAO = new AddressDAO();
        UserAccountDAO userAccountDAO = new UserAccountDAO();
        PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
        OrderLineDAO orderLineDAO = new OrderLineDAO();

        ShopOrder newShopOrder = new ShopOrder();
        UserAccount userAccount = userAccountDAO.getUserAccount(userID);
        ShippingMethod shippingMethod = shippingMethodDAO.getShippingMethod(shippingMethodID);
        Address address = addressDAO.getAddress(addressID);
        PaymentMethod paymentMethod = paymentMethodDAO.getPaymentMethod(paymentMethodID);

        newShopOrder.setOrderDate(LocalDate.now());
        newShopOrder.setOrderStatus(orderStatusDAO.getStatusForNewOrder());
        newShopOrder.setAddress(address);
        newShopOrder.setUserAccount(userAccount);
        newShopOrder.setShippingMethod(shippingMethod);
        newShopOrder.setPaymentMethod(paymentMethod);

        try(Session session = factory.openSession()){
            try {
                session.getTransaction().begin();
                session.save(newShopOrder);
                session.getTransaction().commit();
                System.out.println("Complete cart checkout");
            }catch (Exception e) {
                if (session.getTransaction() != null) {
                    session.getTransaction().rollback();
                    System.out.println("An error occurred while adding a shop order");
                }
                e.printStackTrace();
            }
            session.close();
        }
        orderLineDAO.addOrderLineByUserID(newShopOrder, userID);
    }

    public Set<ShopOrder> getShopOrderByUserID(int userID){
        try(Session session = factory.openSession()){
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<UserAccount> query = builder.createQuery(UserAccount.class);
            Root<UserAccount> root = query.from(UserAccount.class);

            query.select(root);
            query.where(builder.equal(root.get("userID"), userID));
            root.fetch("shopOrders", JoinType.LEFT);

            UserAccount userAccount = session.createQuery(query).uniqueResult();
            return userAccount.getShopOrders();
        }
    }

}
