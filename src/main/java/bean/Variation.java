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
public class Variation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int variationID;

	@Column(name = "name")
	private String naemString;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id")
	private ProductCategory productCategory;

	public int getVariationID() {
		return variationID;
	}

	public void setVariationID(int variationID) {
		this.variationID = variationID;
	}

	public String getNaemString() {
		return naemString;
	}

	public void setNaemString(String naemString) {
		this.naemString = naemString;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Variation(String naemString, ProductCategory productCategory) {
		super();
		this.naemString = naemString;
		this.productCategory = productCategory;
	}

	public Variation() {
		// TODO Auto-generated constructor stub
	}
}
