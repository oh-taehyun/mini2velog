package todo;

import java.sql.Date;

public class TodoVo {
	private int todo_num;
	private String writer;
	private Date w_date;
	private String content;
	private int complete_status;
	private int likes;
	private String d_date;
	
	public TodoVo() {}	
	public TodoVo(int todo_num, String writer, String content, Date w_date, int complete_status, int likes, String d_date) {
		this.todo_num = todo_num;
		this.writer = writer;
		this.w_date = w_date;
		this.content = content;
		this.complete_status = complete_status;
		this.likes = likes;
		this.d_date = d_date;
	}
	
	public int getTodo_num() {
		return todo_num;
	}
	public void setTodo_num(int todo_num) {
		this.todo_num = todo_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getComplete_status() {
		return complete_status;
	}
	public void setComplete_status(int complete_status) {
		this.complete_status = complete_status;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	
	@Override
	public String toString() {
		return "TodoVo [todo_num=" + todo_num + ", writer=" + writer + ", w_date=" + w_date + ", content=" + content
				+ ", complete_status=" + complete_status + ", likes=" + likes + ", d_date=" + d_date + "]";
	}
	
	
}
