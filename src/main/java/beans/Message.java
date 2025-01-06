package beans;

import java.sql.Timestamp;
import java.util.List;

import dao.DaoCrud;

public class Message {
	private Integer id;
	private Integer author_id;
	private Integer discussion_id;
	private String message;
	private Timestamp created_at;
	
	
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
	public Integer getDiscussion_id() {
		return discussion_id;
	}
	public void setDiscussion_id(Integer discussion_id) {
		this.discussion_id = discussion_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	

	public User getAuthor() {
		return DaoCrud.getRecordById("users", User.class, this.author_id);
	}
	
	
	
	

}
