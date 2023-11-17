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
@Table(name = "address")
public class Address implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int addressID;
	
	@Column(name = "unit_number")
	private String unitNumber;
	
	@Column(name = "address_line")
	private String addressLine;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "district")
	private String district;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private UserAccount userAccount;

	public Address() {
	}

	public Address(String unitNumber, String addressLine, String city, String district, UserAccount userAccount) {
		super();
		this.unitNumber = unitNumber;
		this.addressLine = addressLine;
		this.city = city;
		this.district = district;
		this.userAccount = userAccount;
	}

	public UserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}

	public int getAddress_id() {
		return addressID;
	}

	public void setAddress_id(int addressID) {
		this.addressID = addressID;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public String getAddressLine() {
		return addressLine;
	}

	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
