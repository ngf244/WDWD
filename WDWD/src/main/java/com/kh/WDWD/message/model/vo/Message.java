package com.kh.WDWD.message.model.vo;


public class Message {
	private int msgNum;
	private String ssgId;
	private String rsgId;
	private String ssgNick;
	private String rsgNick;
	private String msgTitle;
	private String msgDate;
	private String msgCon;
	private String ssgDel;
	private String rsgDel;
	private String ssgStatus;
	private String rsgStatus;
	
	public Message() {}

	public Message(int msgNum, String ssgId, String rsgId, String ssgNick, String rsgNick, String msgTitle,
			String msgDate, String msgCon, String ssgDel, String rsgDel, String ssgStatus, String rsgStatus) {
		super();
		this.msgNum = msgNum;
		this.ssgId = ssgId;
		this.rsgId = rsgId;
		this.ssgNick = ssgNick;
		this.rsgNick = rsgNick;
		this.msgTitle = msgTitle;
		this.msgDate = msgDate;
		this.msgCon = msgCon;
		this.ssgDel = ssgDel;
		this.rsgDel = rsgDel;
		this.ssgStatus = ssgStatus;
		this.rsgStatus = rsgStatus;
	}

	public int getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}

	public String getSsgId() {
		return ssgId;
	}

	public void setSsgId(String ssgId) {
		this.ssgId = ssgId;
	}

	public String getRsgId() {
		return rsgId;
	}

	public void setRsgId(String rsgId) {
		this.rsgId = rsgId;
	}

	public String getSsgNick() {
		return ssgNick;
	}

	public void setSsgNick(String ssgNick) {
		this.ssgNick = ssgNick;
	}

	public String getRsgNick() {
		return rsgNick;
	}

	public void setRsgNick(String rsgNick) {
		this.rsgNick = rsgNick;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	public String getMsgCon() {
		return msgCon;
	}

	public void setMsgCon(String msgCon) {
		this.msgCon = msgCon;
	}

	public String getSsgDel() {
		return ssgDel;
	}

	public void setSsgDel(String ssgDel) {
		this.ssgDel = ssgDel;
	}

	public String getRsgDel() {
		return rsgDel;
	}

	public void setRsgDel(String rsgDel) {
		this.rsgDel = rsgDel;
	}

	public String getSsgStatus() {
		return ssgStatus;
	}

	public void setSsgStatus(String ssgStatus) {
		this.ssgStatus = ssgStatus;
	}

	public String getRsgStatus() {
		return rsgStatus;
	}

	public void setRsgStatus(String rsgStatus) {
		this.rsgStatus = rsgStatus;
	}

	@Override
	public String toString() {
		return "Message [msgNum=" + msgNum + ", ssgId=" + ssgId + ", rsgId=" + rsgId + ", ssgNick=" + ssgNick
				+ ", rsgNick=" + rsgNick + ", msgTitle=" + msgTitle + ", msgDate=" + msgDate + ", msgCon=" + msgCon
				+ ", ssgDel=" + ssgDel + ", rsgDel=" + rsgDel + ", ssgStatus=" + ssgStatus + ", rsgStatus=" + rsgStatus
				+ "]";
	}


}
