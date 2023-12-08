package bean;

import java.io.Serial;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "product_item")
public class ProductItem implements Serializable {

	/**
	 *
	 */
	@Serial
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int productItemID;

	@Column(name = "sku")
	private String sku;

	@Column(name = "qty_in_stock")
	private int qty_in_stock;

	@Column(name = "product_image")
	private String product_image;

	@Column(name = "price")
	private float price;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToMany
	@JoinTable(name = "product_configuration",
			joinColumns = @JoinColumn(name = "product_item_id"), inverseJoinColumns = @JoinColumn(name = "variation_option_id"))
	private Set<VariationOption> variationOptions = new HashSet<VariationOption>();

	@OneToMany(mappedBy = "productItem")
	private Set<ShoppingCartItem> shoppingCartItems = new HashSet<ShoppingCartItem>();

	@OneToMany(mappedBy = "productItem")
	private Set<OrderLine> orderLines = new HashSet<OrderLine>();

	public ProductItem(int qty_in_stock, String product_image, int price, Product product,
					   Set<VariationOption> variationOptions, Set<ShoppingCartItem> shoppingCartItems, Set<OrderLine> orderLines) {
		super();
		this.qty_in_stock = qty_in_stock;
		this.product_image = product_image;
		this.price = price;
		this.product = product;
		this.variationOptions = variationOptions;
		if(shoppingCartItems != null) {
			this.shoppingCartItems = shoppingCartItems;
		}
		if(orderLines != null) {
			this.orderLines = orderLines;
		}
	}

	public ProductItem() {
		// TODO Auto-generated constructor stub
	}

	public int getProductItemID() {
		return productItemID;
	}

	public void setProductItemID(int productItemID) {
		this.productItemID = productItemID;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public int getQty_in_stock() {
		return qty_in_stock;
	}

	public void setQty_in_stock(int qty_in_stock) {
		this.qty_in_stock = qty_in_stock;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Set<VariationOption> getVariationOptions() {
		return variationOptions;
	}

	public void setVariationOptions(Set<VariationOption> variationOptions) {
		this.variationOptions = variationOptions;
	}

	public Set<ShoppingCartItem> getShoppingCartItems() {
		return shoppingCartItems;
	}

	public void setShoppingCartItems(Set<ShoppingCartItem> shoppingCartItems) {
		this.shoppingCartItems = shoppingCartItems;
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


}
