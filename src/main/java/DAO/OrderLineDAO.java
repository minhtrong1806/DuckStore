package DAO;

import bean.OrderLine;
import bean.ProductItem;
import bean.ShopOrder;
import bean.ShoppingCartItem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

import java.util.Set;

public class OrderLineDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public void addOrderLineByUserID(ShopOrder shopOrder, int userID){
        ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
        try(Session session = factory.openSession()){
            Set<ShoppingCartItem> shoppingCartItems = shoppingCartDAO.listProductItemByUserID(userID);
            session.getTransaction().begin();
            try {
                for(ShoppingCartItem shoppingCartItem : shoppingCartItems) {
                    OrderLine orderLine = new OrderLine();

                    orderLine.setQty(shoppingCartItem.getQty());
                    orderLine.setPrice(shoppingCartItem.getProductItem().getPrice() * shoppingCartItem.getQty());
                    orderLine.setProductItem(shoppingCartItem.getProductItem());
                    orderLine.setShopOrder(shopOrder);

                    session.save(orderLine);
                    System.out.println("Successfully added an order line");
                }
                session.getTransaction().commit();
            }catch (Exception e){
                if (session.getTransaction() != null) {
                    session.getTransaction().rollback();
                    System.out.println("Add failure to order line");
                }
                e.printStackTrace();
            }
        }
        updateQuantityProduct(userID);
        shoppingCartDAO.cleanCartAfterCheckout(userID);
    }

    public void updateQuantityProduct(int userID) {
        ProductItemDAO productItemDAO = new ProductItemDAO();
        ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
        try (Session session = factory.openSession()) {
            try {
                session.getTransaction().begin();
                Set<ShoppingCartItem> shoppingCartItems = shoppingCartDAO.listProductItemByUserID(userID);

                for(ShoppingCartItem shoppingCartItem : shoppingCartItems){
                    ProductItem productItem = productItemDAO.getProductItem(shoppingCartItem.getProductItem().getProductItemID());
                    int new_quantity = productItem.getQty_in_stock() - shoppingCartItem.getQty();
                    productItem.setQty_in_stock(new_quantity);
                    session.saveOrUpdate(productItem);
                }
                session.getTransaction().commit();
                System.out.println("Successfully updated inventory quantity");
                session.close();
            } catch (Exception e) {
                if (session.getTransaction() != null) {
                    session.getTransaction().rollback();
                    System.out.println("Failed to update inventory quantity");
                }
                e.printStackTrace();
            }
        }
    }
}
