package bean;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "variation_option")
public class VariationOption implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int VariationOptionID;

	@Column(name = "value")
	private String value;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "variation_id")
	private Variation variation;
	
	@ManyToMany
	@JoinTable(name = "product_configuration", 
			joinColumns = @JoinColumn(name = "variation_option_id"), inverseJoinColumns = @JoinColumn(name = "product_item_id"))
	private Set<ProductItem> productItems;

	public VariationOption(String value, Variation variation, Set<ProductItem> productItems) {
		super();
		this.value = value;
		if(variation != null) {
			this.variation = variation;
		}
		if(productItems != null) {
			this.productItems = productItems;
		}
	}
	public VariationOption() {
		// TODO Auto-generated constructor stub
	}
	public int getVariationOptionID() {
		return VariationOptionID;
	}

	public void setVariationOptionID(int variationOptionID) {
		VariationOptionID = variationOptionID;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Variation getVariation() {
		return variation;
	}

	public void setVariation(Variation variation) {
		this.variation = variation;
	}

	public Set<ProductItem> getProductItems() {
		return productItems;
	}

	public void setProductItems(Set<ProductItem> productItems) {
		this.productItems = productItems;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
