package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order_status")
public class OrderStatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int orderStatusID;
	
	@Column(name = "status")
	private String status;
	
	@OneToMany(mappedBy = "orderStatus")
	private Set<ShopOrder> shopOrders = new HashSet<ShopOrder>();
	
	public OrderStatus(String status, Set<ShopOrder> shopOrders) {
		super();
		this.status = status;
		if(shopOrders != null) {
			this.shopOrders = shopOrders;
		}
	}

	public OrderStatus() {
		// TODO Auto-generated constructor stub
	}
	
	public int getOrderStatusID() {
		return orderStatusID;
	}

	public void setOrderStatusID(int orderStatusID) {
		this.orderStatusID = orderStatusID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<ShopOrder> getShopOrders() {
		return shopOrders;
	}

	public void setShopOrders(Set<ShopOrder> shopOrders) {
		this.shopOrders = shopOrders;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
