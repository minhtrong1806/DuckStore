package bean;

import java.util.ArrayList;

import java.util.List;


public class UserAccount {
	
	private Integer id;
	private String email_address;
	private String phone_number;
	private String password;
	private Integer role; //mã role lấy từ database
	private List<String> roles; //list các role theo mã role
	
	public UserAccount() {
		
	}

	public UserAccount(String email_address, String password, String phone_number, Integer role) {
		this.email_address = email_address;
		this.phone_number = phone_number;
		this.password = password;
		this.role = role;
		
		this.roles = new ArrayList<String>();
		if (this.role == 0) {
				this.roles.add("MANAGER");
				this.roles.add("STAFF");
		}
		if (this.role == 1) {
			this.roles.add("STAFF");
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
	
}
