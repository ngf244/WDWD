package com.kh.WDWD.board.model.vo;

public class Scrap extends Board {
	private String userId;
	private String scrapDate;
	
	public Scrap() {}

	public Scrap(String userId, String scrapDate) {
		super();
		this.userId = userId;
		this.scrapDate = scrapDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(String scrapDate) {
		this.scrapDate = scrapDate;
	}

	@Override
	public String toString() {
		return "Scrap [userId=" + userId + ", scrapDate=" + scrapDate + ", toString()=" + super.toString() + "]";
	}
	
	
}
