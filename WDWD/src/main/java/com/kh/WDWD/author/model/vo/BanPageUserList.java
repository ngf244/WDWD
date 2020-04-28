package com.kh.WDWD.author.model.vo;

public class BanPageUserList {
	private String id;
	private String nick;
	private int reportedCount;
	
	public BanPageUserList() {}
	
	public BanPageUserList(String id, String nick, int reportedCount) {
		super();
		this.id = id;
		this.nick = nick;
		this.reportedCount = reportedCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getReportedCount() {
		return reportedCount;
	}

	public void setReportedCount(int reportedCount) {
		this.reportedCount = reportedCount;
	}

	@Override
	public String toString() {
		return "BanPageUserList [id=" + id + ", nick=" + nick + ", reportedCount=" + reportedCount + "]";
	}
}
