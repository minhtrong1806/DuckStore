package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "site_user")
public class UserAccount implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int userID;

	@Column(name = "name")
	private String name;

	@Column(name = "email_address")
	private String emailAddress;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "password")
	private String password;

	@Column(name = "role")
	private Integer role;

	@OneToMany(mappedBy = "userAccount")
	private Set<Address> addresses = new HashSet<Address>();;

	@OneToOne(mappedBy = "userAccount")
	private ShoppingCart shoppingCart;

	@OneToMany(mappedBy = "userAccount")
	private Set<ShopOrder> shopOrders;

	public UserAccount(String name, String emailAddress, String phoneNumber, String password, Integer role,
					   Set<Address> addresses, ShoppingCart shoppingCarts) {
		super();
		this.name = name;
		this.emailAddress = emailAddress;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.role = role;
		if(addresses != null) {
			this.addresses = addresses;
		}
		if(shoppingCarts != null) {
			this.shoppingCart = shoppingCarts;
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUser_id() {
		return userID;
	}

	public void setUser_id(int userID) {
		this.userID = userID;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhone_number() {
		return phoneNumber;
	}

	public void setPhone_number(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCarts(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	public UserAccount() {

	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Set<ShopOrder> getShopOrders() {
		return shopOrders;
	}

	public void setShopOrders(Set<ShopOrder> shopOrders) {
		this.shopOrders = shopOrders;
	}
}
