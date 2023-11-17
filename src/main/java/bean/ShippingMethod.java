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
@Table(name = "shipping_method")
public class ShippingMethod implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int shippingMethodID;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "price")
	private int price;
	
	@OneToMany(mappedBy = "shippingMethod")
	private Set<ShopOrder> shopOrders = new HashSet<ShopOrder>();

	public ShippingMethod(String name, int price, Set<ShopOrder> shopOrders) {
		super();
		this.name = name;
		this.price = price;
		if(shopOrders != null) {
			this.shopOrders = shopOrders;
		}
	}
	public ShippingMethod() {
		// TODO Auto-generated constructor stub
	}
	public int getShippingMethodID() {
		return shippingMethodID;
	}

	public void setShippingMethodID(int shippingMethodID) {
		this.shippingMethodID = shippingMethodID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
