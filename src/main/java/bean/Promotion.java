package bean;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "promotion")
public class Promotion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int promotionID;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "discount_rate")
	private int discount_rate;

	@Column(name = "start_date")
	private Date start_date;

	@Column(name = "end_date")
	private Date end_date;
	
	@OneToMany(mappedBy = "promotion")
	private Set<ShopOrder> shopOrders = new HashSet<ShopOrder>();

	public Promotion(String name, String description, int discount_rate, Date start_date, Date end_date,
			Set<ShopOrder> shopOrders) {
		super();
		this.name = name;
		this.description = description;
		this.discount_rate = discount_rate;
		this.start_date = start_date;
		this.end_date = end_date;
		if(shopOrders != null) {
			this.shopOrders = shopOrders;
		}
	}
	
	public Promotion() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPromotionID() {
		return promotionID;
	}

	public void setPromotionID(int promotionID) {
		this.promotionID = promotionID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDiscount_rate() {
		return discount_rate;
	}

	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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
