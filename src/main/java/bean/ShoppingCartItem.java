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
@Table(name = "shopping_cart_item")
public class ShoppingCartItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int shoppingCartItemID;
	
	@Column(name = "qty")
	private int qty;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "cart_id")
	private ShoppingCart shoppingCart;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "product_item_id")
	private ProductItem productItem;

	public ShoppingCartItem(int qty, ShoppingCart shoppingCart, ProductItem productItem) {
		super();
		this.qty = qty;
		this.shoppingCart = shoppingCart;
		this.productItem = productItem;
	}
	public ShoppingCartItem() {
		// TODO Auto-generated constructor stub
	}
	public int getShoppingCartItemID() {
		return shoppingCartItemID;
	}

	public void setShoppingCartItemID(int shoppingCartItemID) {
		this.shoppingCartItemID = shoppingCartItemID;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	public ProductItem getProductItem() {
		return productItem;
	}

	public void setProductItem(ProductItem productItem) {
		this.productItem = productItem;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
