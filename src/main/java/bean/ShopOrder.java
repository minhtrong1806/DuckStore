package bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "shop_order")
public class ShopOrder implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int shopOrderID;
	
	@Column(name = "order_date")
	private Date orderDate;
	
	@Column(name = "order_total")
	private int orderTotal;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "shipping_method")
	private ShippingMethod shippingMethod;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "order_status")
	private OrderStatus orderStatus;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserAccount userAccount;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "shipping_address")
	private Address address;

	@OneToMany(mappedBy = "shopOrder")
	private Set<OrderLine> orderLines;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "promotion_id")
	private Promotion promotion;

	public ShopOrder(Date orderDate, int orderTotal, ShippingMethod shippingMethod, OrderStatus orderStatus,
			UserAccount userAccount, Address address, Set<OrderLine> orderLines, Promotion promotion) {
		super();
		this.orderDate = orderDate;
		this.orderTotal = orderTotal;
		this.shippingMethod = shippingMethod;
		this.orderStatus = orderStatus;
		this.userAccount = userAccount;
		this.address = address;
		this.orderLines = orderLines;
		this.promotion = promotion;
	}
	public ShopOrder() {
		// TODO Auto-generated constructor stub
	}
	public int getShopOrderID() {
		return shopOrderID;
	}

	public void setShopOrderID(int shopOrderID) {
		this.shopOrderID = shopOrderID;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}

	public ShippingMethod getShippingMethod() {
		return shippingMethod;
	}

	public void setShippingMethod(ShippingMethod shippingMethod) {
		this.shippingMethod = shippingMethod;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public UserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Set<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(Set<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public Promotion getShopOrder() {
		return promotion;
	}

	public void setShopOrder(Promotion promotion) {
		this.promotion = promotion;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
