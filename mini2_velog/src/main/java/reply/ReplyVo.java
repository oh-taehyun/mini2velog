package reply;

import java.sql.Date;

public class ReplyVo {
	private int rep_num;
	private String writer;
	private String content;
	private int post_num;
	private Date rDate;
	
	public ReplyVo() {}
	
	public ReplyVo(int rep_num, String writer, String content, int post_num, Date rDate) {
		this.rep_num = rep_num;
		this.writer = writer;
		this.content = content;
		this.post_num = post_num;
		this.rDate = rDate;
	}
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	
	
	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	@Override
	public String toString() {
		return "ReplyVo [rep_num=" + rep_num + ", writer=" + writer + ", content=" + content + ", post_num=" + post_num
				+ ", rDate=" + rDate + "]";
	}

	
}
