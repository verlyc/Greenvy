package beans;

import dao.DaoCrud;

public class UserTool {
	

	private Integer tool_id;
	private Integer user_id;
	private Integer months;
	private String status;
	private Tool tool;
	
	public Abonnement getTool() {
		return DaoCrud.getRecordById("tools", Abonnement.class, this.tool_id);
	}
	
	public Integer getTool_id() {
		return tool_id;
	}
	public void setTool_id(Integer tool_id) {
		this.tool_id = tool_id;
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
