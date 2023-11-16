package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	private Integer user_id;
	@Column(name = "name")
	private String name;
	@Column(name = "email_address")
	private String email_address;
	@Column(name = "phone_number")
	private String phone_number;
	@Column(name = "password")
	private String password;
	@Column(name = "role")
	private Integer role; 
	
	
	@OneToMany(mappedBy = "userAccount", fetch = FetchType.LAZY)
	private Set<Address> addresses = new HashSet<>();;
	
	
	public UserAccount(String name, String email_address, String phone_number, String password, Integer role,
			List<String> roles, Set<Address> addresses) {
		super();
		this.name = name;
		this.email_address = email_address;
		this.phone_number = phone_number;
		this.password = password;
		this.role = role;
		this.addresses = addresses;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
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
	
	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public UserAccount() {
		
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
