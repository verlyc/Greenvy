package beans;

import dao.DaoCrud;

public class Abonnement {
	
	private Integer id;
	private String name;
	private String description;
	private String access_condition;
	private Integer parcelle_id;
	private Integer tool_id;
	private Integer price;
	private String type = "partage";
	private Parcelle parcelle;
	private Tool tool;
	
	
	
	
	
	
	
	public Parcelle getParcelle() {
		
		
		
		return DaoCrud.getRecordById("parcelles", Parcelle.class, this.parcelle_id);
	}

	public void setParcelle(Parcelle parcelle) {
		this.parcelle = parcelle;
	}

	public Tool getTool() {
		
		return DaoCrud.getRecordById("tools", Tool.class, this.tool_id);
	}

	public void setTool(Tool tool) {
		this.tool = tool;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccess_condition() {
		return access_condition;
	}

	public void setAccess_condition(String access_condition) {
		this.access_condition = access_condition;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCondition() {
		return access_condition;
	}
	
	public void setCondition(String condition) {
		this.access_condition = condition;
	}
	public Integer getParcelle_id() {
		return parcelle_id;
	}
	
	public void setParcelle_id(Integer parcelle_id) {
		this.parcelle_id = parcelle_id;
	}
	
	public Integer getTool_id() {
		return tool_id;
	}
	
	public void setTool_id(Integer tool_id) {
		this.tool_id = tool_id;
	}
	
	public Integer getPrice() {
		return price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
