package bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_line")
public class OrderLine implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int orderLineID;

	@Column(name = "qty")
	private int qty;
	
	@Column(name = "price")
	private int price;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_item_id")
	private ProductItem productItem;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "order_id")
	private ShopOrder shopOrder;
	
	public OrderLine(int qty, int price, ProductItem productItem, ShopOrder shopOrder) {
		super();
		this.qty = qty;
		this.price = price;
		this.productItem = productItem;
		this.shopOrder = shopOrder;
	}

	public OrderLine() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderLineID() {
		return orderLineID;
	}

	public void setOrderLineID(int orderLineID) {
		this.orderLineID = orderLineID;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public ProductItem getProductItem() {
		return productItem;
	}

	public void setProductItem(ProductItem productItem) {
		this.productItem = productItem;
	}

	public ShopOrder getShopOrder() {
		return shopOrder;
	}

	public void setShopOrder(ShopOrder shopOrder) {
		this.shopOrder = shopOrder;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
