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
@Table(name = "variation")
public class Variation implements Serializable{
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name")
	private String naemString;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id", referencedColumnName = "id")
	private ProductCategory variationCategory;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNaemString() {
		return naemString;
	}

	public void setNaemString(String naemString) {
		this.naemString = naemString;
	}

	public ProductCategory getVariationCategory() {
		return variationCategory;
	}

	public void setVariationCategory(ProductCategory variationCategory) {
		this.variationCategory = variationCategory;
	}

	public Variation(String naemString, ProductCategory variationCategory) {
		super();
		this.naemString = naemString;
		this.variationCategory = variationCategory;
	}
	
	public Variation() {
		// TODO Auto-generated constructor stub
	}
}
