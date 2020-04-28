package com.kh.WDWD.author.model.vo;

public class Declaration {
	private int deNum;
	private String deReporterNick;
	private String deReporterId;
	private String deReportedNick;
	private String deReportedId;
	private String deContent;
	private String deStatus;
	private int boNum;
	private String deDate;
	private String deCate;
	private int boGroup;
	
	public Declaration() {}

	public Declaration(int deNum, String deReporterNick, String deReporterId, String deReportedNick,
			String deReportedId, String deContent, String deStatus, int boNum, String deDate, String deCate, int boGroup) {
		super();
		this.deNum = deNum;
		this.deReporterNick = deReporterNick;
		this.deReporterId = deReporterId;
		this.deReportedNick = deReportedNick;
		this.deReportedId = deReportedId;
		this.deContent = deContent;
		this.deStatus = deStatus;
		this.boNum = boNum;
		this.deDate = deDate;
		this.deCate = deCate;
		this.boGroup = boGroup;
	}

	public int getDeNum() {
		return deNum;
	}

	public void setDeNum(int deNum) {
		this.deNum = deNum;
	}

	public String getDeReporterNick() {
		return deReporterNick;
	}

	public void setDeReporterNick(String deReporterNick) {
		this.deReporterNick = deReporterNick;
	}

	public String getDeReporterId() {
		return deReporterId;
	}

	public void setDeReporterId(String deReporterId) {
		this.deReporterId = deReporterId;
	}

	public String getDeReportedNick() {
		return deReportedNick;
	}

	public void setDeReportedNick(String deReportedNick) {
		this.deReportedNick = deReportedNick;
	}

	public String getDeReportedId() {
		return deReportedId;
	}

	public void setDeReportedId(String deReportedId) {
		this.deReportedId = deReportedId;
	}

	public String getDeContent() {
		return deContent;
	}

	public void setDeContent(String deContent) {
		this.deContent = deContent;
	}

	public String getDeStatus() {
		return deStatus;
	}

	public void setDeStatus(String deStatus) {
		this.deStatus = deStatus;
	}

	public int getBoNum() {
		return boNum;
	}

	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}

	public String getDeDate() {
		return deDate;
	}

	public void setDeDate(String deDate) {
		this.deDate = deDate;
	}

	public String getDeCate() {
		return deCate;
	}

	public void setDeCate(String deCate) {
		this.deCate = deCate;
	}

	public int getBoGroup() {
		return boGroup;
	}

	public void setBoGroup(int boGroup) {
		this.boGroup = boGroup;
	}

	@Override
	public String toString() {
		return "Declaration [deNum=" + deNum + ", deReporterNick=" + deReporterNick + ", deReporterId=" + deReporterId
				+ ", deReportedNick=" + deReportedNick + ", deReportedId=" + deReportedId + ", deContent=" + deContent
				+ ", deStatus=" + deStatus + ", boNum=" + boNum + ", deDate=" + deDate + ", deCate=" + deCate
				+ ", boGroup=" + boGroup + "]";
	}
	
}
