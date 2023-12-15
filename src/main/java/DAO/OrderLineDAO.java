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

    public boolean addOrderLineByUserID(Session session, ShopOrder shopOrder, int userID) {
        ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
        ProductItemDAO productItemDAO = new ProductItemDAO();

        Set<ShoppingCartItem> shoppingCartItems = shoppingCartDAO.listProductItemByUserID(userID);
        for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
            ProductItem productItem = productItemDAO.getProductItem(shoppingCartItem.getProductItem().getProductItemID());
            OrderLine orderLine = new OrderLine();

            orderLine.setQty(shoppingCartItem.getQty());
            orderLine.setPrice(shoppingCartItem.getProductItem().getPrice() * shoppingCartItem.getQty());
            orderLine.setProductItem(productItem);
            orderLine.setShopOrder(shopOrder);

            int new_quantity = productItem.getQty_in_stock() - shoppingCartItem.getQty();
            if (new_quantity >= 0) {
                productItem.setQty_in_stock(new_quantity);
                session.saveOrUpdate(productItem);
            } else {
                System.out.println("Products with SKU code " + productItem.getSku() + " are no longer in stock");
                return false;
            }

            session.save(orderLine);

            System.out.println("Successfully added an order line");
        }
        return true;
    }
}
