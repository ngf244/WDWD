package com.kh.WDWD.guideboard.model.vo;

import java.util.Date;

public class Qna {
	
	private int boNum; //번호
	private String boTitle; // 제목  
	private String boContent; // 내용
	private String boWriter; // 작성자
	private String boWriterNick;// 작성자 닉네임
	private String boDate; // 작성일자
	private int boView; // 조회수
	private String boUpdate;
	private String boDel;//  게시판 삭제 부분
	
	
	
	public Qna(int boNum, String boTitle, String boContent, String boWriter, String boWriterNick, String boDate, int boView, String boUpdate,
			String boDel) {
		super();
		this.boNum = boNum;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.boWriter = boWriter;
		this.boWriterNick = boWriterNick;
		this.boDate = boDate;
		this.boView = boView;
		this.boUpdate = boUpdate;
		this.boDel = boDel;
	}



	public int getBoNum() {
		return boNum;
	}



	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}



	public String getBoTitle() {
		return boTitle;
	}



	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}



	public String getBoContent() {
		return boContent;
	}



	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}



	public String getBoWriter() {
		return boWriter;
	}



	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}



	public String getBoWriterNick() {
		return boWriterNick;
	}



	public void setBoWriterNick(String boWriterNick) {
		this.boWriterNick = boWriterNick;
	}



	public String getBoDate() {
		return boDate;
	}



	public void setBoDate(String boDate) {
		this.boDate = boDate;
	}



	public int getBoView() {
		return boView;
	}



	public void setBoView(int boView) {
		this.boView = boView;
	}



	public String getBoUpdate() {
		return boUpdate;
	}



	public void setBoUpdate(String boUpdate) {
		this.boUpdate = boUpdate;
	}



	public String getBoDel() {
		return boDel;
	}



	public void setBoDel(String boDel) {
		this.boDel = boDel;
	}



	@Override
	public String toString() {
		return "Qna [boNum=" + boNum + ", boTitle=" + boTitle + ", boContent=" + boContent + ", boWriter=" + boWriter
				+ ", boWriterNick=" + boWriterNick + ", boDate=" + boDate + ", boView=" + boView + ", boUpdate="
				+ boUpdate + ", boDel=" + boDel + "]";
	}
}



	
	