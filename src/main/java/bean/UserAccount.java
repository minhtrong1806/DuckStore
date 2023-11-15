package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "site_user")
public class UserAccount implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "email_address")

	private String email_address;
	@Column(name = "phone_number")
	private String phone_number;
	@Column(name = "password")
	private String password;
	@Column(name = "role")
	private Integer role; //mã role lấy từ database
	private List<String> roles; //list các role theo mã role
	
	
	@OneToMany(mappedBy = "userAccount",cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Address> addresses;
	
	public UserAccount(String email_address, String password, String phone_number, Integer role) {

		this.email_address = email_address;
		this.phone_number = phone_number;
		this.password = password;
		this.name = name;
		this.role = role;
		
		this.roles = new ArrayList<String>();
		if (this.role == 0) {
				this.roles.add("MANAGER");
				this.roles.add("STAFF");
				this.roles.add("CUSTOMER");
		}
		if (this.role == 1) {
			this.roles.add("STAFF");
			this.roles.add("CUSTOMER");
		}
		if (this.role == 2) {
			this.roles.add("CUSTOMER");
		}
	}
	

	public Integer getId() {
		return id;
	}
	


	public String getEmail_address() {
		return email_address;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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

	public List<String> getRoles() {
		return roles;
	}
	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public UserAccount() {
		
	}
}
