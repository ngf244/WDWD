package com.kh.WDWD.board.model.vo;

public class Reply {
	private int rpNum;
	private String rpContent;
	private String rpDate;
	private String rpStatus;
	private int refNum;
	private String rpWriter;
	private int rpConNum;
	private int rpRp;
	private String rpWriterNick;
	private String profileImg;
	
	public Reply() {}

	public Reply(int rpNum, String rpContent, String rpDate, String rpStatus, int refNum, String rpWriter, int rpConNum,
			int rpRp, String rpWriterNick, String profileImg) {
		super();
		this.rpNum = rpNum;
		this.rpContent = rpContent;
		this.rpDate = rpDate;
		this.rpStatus = rpStatus;
		this.refNum = refNum;
		this.rpWriter = rpWriter;
		this.rpConNum = rpConNum;
		this.rpRp = rpRp;
		this.rpWriterNick = rpWriterNick;
		this.profileImg = profileImg;
	}

	public int getRpNum() {
		return rpNum;
	}

	public void setRpNum(int rpNum) {
		this.rpNum = rpNum;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	public String getRpDate() {
		return rpDate;
	}

	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}

	public String getRpStatus() {
		return rpStatus;
	}

	public void setRpStatus(String rpStatus) {
		this.rpStatus = rpStatus;
	}

	public int getRefNum() {
		return refNum;
	}

	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}

	public String getRpWriter() {
		return rpWriter;
	}

	public void setRpWriter(String rpWriter) {
		this.rpWriter = rpWriter;
	}

	public int getRpConNum() {
		return rpConNum;
	}

	public void setRpConNum(int rpConNum) {
		this.rpConNum = rpConNum;
	}

	public int getRpRp() {
		return rpRp;
	}

	public void setRpRp(int rpRp) {
		this.rpRp = rpRp;
	}

	public String getRpWriterNick() {
		return rpWriterNick;
	}

	public void setRpWriterNick(String rpWriterNick) {
		this.rpWriterNick = rpWriterNick;
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "Reply [rpNum=" + rpNum + ", rpContent=" + rpContent + ", rpDate=" + rpDate + ", rpStatus=" + rpStatus
				+ ", refNum=" + refNum + ", rpWriter=" + rpWriter + ", rpConNum=" + rpConNum + ", rpRp=" + rpRp
				+ ", rpWriterNick=" + rpWriterNick + ", profileImg=" + profileImg + "]";
	}
	
}
