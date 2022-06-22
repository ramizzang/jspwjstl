package notice.vo;

import java.util.Date;

public class Notice {
	//ctrl + shif + y : 소문자로 변환 / ctrl + shift + x : 대문자로 변환
	private String seq;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	
	
	public String getSeq() { //저장된 데이터를 외부로 보낼때 사용
		return seq;
	}
	public void setSeq(String seq) { //외부에서 자료를 받아 저장
		this.seq = seq;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	

}
