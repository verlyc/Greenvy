package beans;

import java.util.List;

import dao.DaoCrud;

public class Discussion {
	private Integer id;
	private Integer author_id;
	private String name;
	private String description;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(Integer author_id) {
		this.author_id = author_id;
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
	

	public User getAuthor() {
		return DaoCrud.getRecordById("users", User.class, this.author_id);
	}

	public List<Message> getMessages() {
				
		return DaoCrud.getTableDataWithCondition("messages", Message.class, " discussion_id ="+ this.id+ " ORDER BY id DESC");
	}

	
}
