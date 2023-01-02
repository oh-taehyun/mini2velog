package board;

import java.sql.Date;

public class BoardVo {
	private int post_num;
	private String writer;
	private String title;
	private String content;
	private Date w_date;
	private int views;
	private int likes;
	private String fname;
	
	public BoardVo() {
		
	}
	
	public BoardVo(int post_num, String writer, String title, String content, Date w_date, int views, int likes,
			String fname) {
		this.post_num = post_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.w_date = w_date;
		this.views = views;
		this.likes = likes;
		this.fname = fname;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Override
	public String toString() {
		return "BoardVo [post_num=" + post_num + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", w_date=" + w_date + ", views=" + views + ", likes=" + likes + ", fname=" + fname + "]";
	}
	
	
	
	
	
}
