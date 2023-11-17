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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_category")
public class ProductCategory implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productCategoryID;

	@Column(name = "parent_category_id")
	private int parentCategoryID;

	@Column(name = "category_name")
	private String categoryName;
	

	@OneToOne(targetEntity = ProductCategory.class)
	@JoinColumn(name = "parent_category_id", referencedColumnName = "productCategoryID", insertable = false, updatable = false)
	private ProductCategory parentCategory;


	@ManyToMany(mappedBy = "productCategories")
	private Set<Promotion> promotions = new HashSet<Promotion>();

	@OneToMany(mappedBy = "productCategory")
	private Set<Product> products = new HashSet<Product>();

	@OneToMany(mappedBy = "productCategory")
	private Set<Variation> variations = new HashSet<Variation>();
	
	
	public ProductCategory() {
	}

	public ProductCategory(String categoryName, ProductCategory parentCategory, Set<Promotion> promotions) {
		super();
		this.categoryName = categoryName;
		this.parentCategory = parentCategory;
		this.promotions = promotions;
	}

	public int getProductCategoryID() {
		return productCategoryID;
	}

	public void setProductCategoryID(int productCategoryID) {
		this.productCategoryID = productCategoryID;
	}

	public int getParentCategoryID() {
		return parentCategoryID;
	}

	public void setParentCategoryID(int parentCategoryID) {
		this.parentCategoryID = parentCategoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public ProductCategory getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(ProductCategory parentCategory) {
		this.parentCategory = parentCategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Set<Promotion> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotion> promotions) {
		this.promotions = promotions;
	}

}
