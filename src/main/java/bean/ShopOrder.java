package bean;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import java.time.LocalDate;

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
	private LocalDate orderDate;

	@Column(name = "order_total")
	private float orderTotal;

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
	@JoinColumn(name = "payment_method")
	private PaymentMethod paymentMethod;

	public ShopOrder(LocalDate orderDate, int orderTotal, ShippingMethod shippingMethod, OrderStatus orderStatus,
					 UserAccount userAccount, Address address, Set<OrderLine> orderLines) {
		super();
		this.orderDate = orderDate;
		this.orderTotal = orderTotal;
		this.shippingMethod = shippingMethod;
		this.userAccount = userAccount;
		this.address = address;
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

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public float getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(float orderTotal) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
}
