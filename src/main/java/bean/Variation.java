package bean;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "variation")
public class Variation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int variationID;

	@Column(name = "name")
	private String naemString;

	@OneToMany(mappedBy = "variation")
	private Set<VariationOption> variationOptions;

	public Variation(String naemString, Set<VariationOption> variationOptions) {
		super();
		this.naemString = naemString;
		this.variationOptions = variationOptions;
	}

	public int getVariationID() {
		return variationID;
	}

	public void setVariationID(int variationID) {
		this.variationID = variationID;
	}

	public String getNaemString() {
		return naemString;
	}

	public void setNaemString(String naemString) {
		this.naemString = naemString;
	}

	public Set<VariationOption> getVariationOptions() {
		return variationOptions;
	}

	public void setVariationOptions(Set<VariationOption> variationOptions) {
		this.variationOptions = variationOptions;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
