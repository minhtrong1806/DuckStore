package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import net.sourceforge.jtds.jdbc.DateTime;

@Entity
@Table(name = "promotion")
public class Promotion implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int promotionID;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "discount_rate")
	private int discount_rate;
	
	@Column(name = "start_date")
	private DateTime start_date;
	
	@Column(name = "end_date")
	private DateTime end_date;
	
    @ManyToMany
    @JoinTable(
    		name = "promotion_category",
    		joinColumns = @JoinColumn(name = "promotion_id"),
    		inverseJoinColumns = @JoinColumn(name = "category_id")
    	)
    private Set<ProductCategory> productCategories = new HashSet<>();
	
    
    
    
    
    
    
    
    
    public Promotion() {
	}
		
	public Promotion(String name, String description, int discount_rate, DateTime start_date, DateTime end_date,
			Set<ProductCategory> productCategories) {
		super();
		this.name = name;
		this.description = description;
		this.discount_rate = discount_rate;
		this.start_date = start_date;
		this.end_date = end_date;
		this.productCategories = productCategories;
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
	public DateTime getStart_date() {
		return start_date;
	}
	public void setStart_date(DateTime start_date) {
		this.start_date = start_date;
	}
	public DateTime getEnd_date() {
		return end_date;
	}
	public void setEnd_date(DateTime end_date) {
		this.end_date = end_date;
	}
}
