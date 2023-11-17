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
@Table(name = "product_item")
public class ProductItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productItemID;

	@Column(name = "sku")
	private String sku;

	@Column(name = "qty_in_stock")
	private int qty_in_stock;

	@Column(name = "product_image")
	private String product_image;

	@Column(name = "price")
	private int price;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id")
	private Product product;

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ProductItem(String sku, int qty_in_stock, String product_image, int price, Product product) {
		super();
		this.sku = sku;
		this.qty_in_stock = qty_in_stock;
		this.product_image = product_image;
		this.price = price;
		this.product = product;
	}
	
	public ProductItem() {
		// TODO Auto-generated constructor stub
	}
}
