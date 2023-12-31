package ASM_ClotherStore.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "products")
public class Products implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String image;
	private float price;
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	private Date createDate = new Date();
	private Boolean available;

	@ManyToOne
	@JoinColumn(name = "categoryid")
	Categories categories;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<ProductDetail> productDetails;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<OrderDetail> orderDetails;
}
