package bean;

import java.io.Serializable;
import java.util.HashSet;
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
@Table(name = "product")
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int productID;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "product_image")
	private String product_image;

	@OneToMany(mappedBy = "product")
	private Set<ProductItem> productItems = new HashSet<ProductItem>();

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id")
	private ProductCategory productCategory;

	public Product(String name, String description, String product_image, Set<ProductItem> productItems,
			ProductCategory productCategory) {
		super();
		this.name = name;
		this.description = description;
		this.product_image = product_image;
		this.productItems = productItems;
		this.productCategory = productCategory;
	}

	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
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

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public Set<ProductItem> getProductItems() {
		return productItems;
	}

	public void setProductItems(Set<ProductItem> productItems) {
		this.productItems = productItems;
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

	
	
}
