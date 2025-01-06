package beans;

import java.sql.Timestamp;
import java.util.List;

import dao.DaoCrud;

public class User {
	
	private Integer id;
	private String name;
	private String username;
	private String experience;
	private String role;
	private String cultures;
	private String password;
	private Integer credit_balance;
	private Timestamp created_at;
	
	
	
	
	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Integer getCredit_balance() {
		return credit_balance;
	}

	public void setCredit_balance(Integer credit_balance) {
		this.credit_balance = credit_balance;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the email
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param email the email to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * @return the cultures
	 */
	public String getCultures() {
		return cultures;
	}
	/**
	 * @param cultures the cultures to set
	 */
	public void setCultures(String cultures) {
		this.cultures = cultures;
	}

	
	public List<UserAbonnement> getAbonnements() {
		
		return DaoCrud.getTableDataWithCondition("user_abonnements", UserAbonnement.class, " user_id ="+ this.id+ " ORDER BY id DESC");
	}
	
	
	public List<UserTool> getRents() {
		
		return DaoCrud.getTableDataWithCondition("user_tools", UserTool.class, " user_id ="+ this.id+ " ORDER BY id DESC");
	}
}
