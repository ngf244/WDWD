package com.kh.WDWD.author.model.vo;

public class BanList {
	private String id;
	private String content;
	private String date;
	
	public BanList() {}

	public BanList(String id, String content, String date) {
		super();
		this.id = id;
		this.content = content;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "BanList [id=" + id + ", content=" + content + ", date=" + date + "]";
	}
	
}
