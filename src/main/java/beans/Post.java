package beans;

public class Post {
	
	private Integer id;
	private String message;
	private String date;
	private Integer author_id;
	
	
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public Integer getAuthor_id() {
		return author_id;
	}
	
	public void setAuthor_id(Integer author_id) {
		this.author_id = author_id;
	}

	
}
