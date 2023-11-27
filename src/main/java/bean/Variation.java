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
	private String name;

	@OneToMany(mappedBy = "variation")
	private Set<VariationOption> variationOptions = new HashSet<VariationOption>();

	public Variation(String name, Set<VariationOption> variationOptions) {
		super();
		this.name = name;
		this.variationOptions = variationOptions;
	}
	public Variation() {
		// TODO Auto-generated constructor stub
	}
	public int getVariationID() {
		return variationID;
	}

	public void setVariationID(int variationID) {
		this.variationID = variationID;
	}

	public String getName() {
		return name;
	}

	public void setNameString(String name) {
		this.name = name;
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
