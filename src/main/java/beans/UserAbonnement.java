package beans;

import dao.DaoCrud;

public class UserAbonnement {
	

	private Integer abonnement_id;
	private Integer user_id;
	private Integer months;
	private String status;
	private Abonnement abonnement;
	
	
	
	
	
	public Abonnement getAbonnement() {
		return DaoCrud.getRecordById("abonnements", Abonnement.class, this.abonnement_id);
	}
	public void setAbonnement(Abonnement abonnement) {
		this.abonnement = abonnement;
	}
	
	public Integer getAbonnement_id() {
		return abonnement_id;
	}
	public void setAbonnement_id(Integer abonnement_id) {
		this.abonnement_id = abonnement_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getMonths() {
		return months;
	}
	public void setMonths(Integer months) {
		this.months = months;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
