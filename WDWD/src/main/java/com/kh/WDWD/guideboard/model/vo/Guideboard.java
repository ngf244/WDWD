package com.kh.WDWD.guideboard.model.vo;

import java.util.Date;

public class Guideboard {
	
	private int bno; //번호
	private String title; // 제목  
	private String content; // 내용
	private String writer; // 작성자
	private Date regDate; // 작성일자
	private int viewCnt; // 조회수
	private String answer; // 답변여부
	

	public Guideboard(int bno, String title, String content, String writer, Date regDate, int viewCnt, String answer) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.answer = answer;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
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


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getViewCnt() {
		return viewCnt;
	}


	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	@Override
	public String toString() {
		return "Guideboard [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", answer=" + answer + "]";
	}
}

	
