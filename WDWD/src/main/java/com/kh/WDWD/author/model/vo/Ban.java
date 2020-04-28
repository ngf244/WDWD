package com.kh.WDWD.author.model.vo;

public class Ban {
	private String banUserId;
	private String banUserNick;
	private String banContent;
	private String banTerm;
	
	public Ban() {}

	public Ban(String banUserId, String banUserNick, String banContent, String banTerm) {
		super();
		this.banUserId = banUserId;
		this.banUserNick = banUserNick;
		this.banContent = banContent;
		this.banTerm = banTerm;
	}

	public String getBanUserId() {
		return banUserId;
	}

	public void setBanUserId(String banUserId) {
		this.banUserId = banUserId;
	}

	public String getBanUserNick() {
		return banUserNick;
	}

	public void setBanUserNick(String banUserNick) {
		this.banUserNick = banUserNick;
	}

	public String getBanContent() {
		return banContent;
	}

	public void setBanContent(String banContent) {
		this.banContent = banContent;
	}

	public String getBanTerm() {
		return banTerm;
	}

	public void setBanTerm(String banTerm) {
		this.banTerm = banTerm;
	}

	@Override
	public String toString() {
		return "Ban [banUserId=" + banUserId + ", banUserNick=" + banUserNick + ", banContent=" + banContent
				+ ", banTerm=" + banTerm + "]";
	}
	
}
