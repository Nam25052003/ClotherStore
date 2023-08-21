package ASM_ClotherStore.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "accounts")
public class Accounts implements Serializable {

	@Id
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;

	@JsonIgnore
	@OneToMany(mappedBy = "accounts")
	List<Orders> orders;

	@JsonIgnore
	@OneToMany(mappedBy = "accounts", fetch = FetchType.EAGER)
	List<Authorities> authorities = new ArrayList<>();
}
