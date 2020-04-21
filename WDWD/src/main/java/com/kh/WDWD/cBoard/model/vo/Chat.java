package com.kh.WDWD.cBoard.model.vo;

public class Chat {
	private int chatNum;
	private String chatCon;
	private String chatDate;
	private String chatRefNum;
	private String chatWriter;
	
	public Chat() {}

	public Chat(int chatNum, String chatCon, String chatDate, String chatRefNum, String chatWriter) {
		super();
		this.chatNum = chatNum;
		this.chatCon = chatCon;
		this.chatDate = chatDate;
		this.chatRefNum = chatRefNum;
		this.chatWriter = chatWriter;
	}

	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}

	public String getChatCon() {
		return chatCon;
	}

	public void setChatCon(String chatCon) {
		this.chatCon = chatCon;
	}

	public String getChatDate() {
		return chatDate;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	public String getChatRefNum() {
		return chatRefNum;
	}

	public void setChatRefNum(String chatRefNum) {
		this.chatRefNum = chatRefNum;
	}

	public String getChatWriter() {
		return chatWriter;
	}

	public void setChatWriter(String chatWriter) {
		this.chatWriter = chatWriter;
	}
	
	@Override
	public String toString() {
		return "Chat [chatNum=" + chatNum + ", chatCon=" + chatCon + ", chatDate=" + chatDate + ", chatRefNum="
				+ chatRefNum + ", chatWriter=" + chatWriter + "]";
	}
}
