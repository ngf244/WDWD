package com.kh.WDWD.portpolio.model.vo;

public class PortpolioReply {
	private int porNum;
	private int porRef;
	private String porWriter;
	private String porContent;
	private String porEnrollDate;
	private String porStatus;
	
	public PortpolioReply() {}
	
	public PortpolioReply(int porNum, int porRef, String porWriter, String porContent, String porEnrollDate,
			String porStatus) {
		super();
		this.porNum = porNum;
		this.porRef = porRef;
		this.porWriter = porWriter;
		this.porContent = porContent;
		this.porEnrollDate = porEnrollDate;
		this.porStatus = porStatus;
	}

	public int getPorNum() {
		return porNum;
	}

	public void setPorNum(int porNum) {
		this.porNum = porNum;
	}

	public int getPorRef() {
		return porRef;
	}

	public void setPorRef(int porRef) {
		this.porRef = porRef;
	}

	public String getPorWriter() {
		return porWriter;
	}

	public void setPorWriter(String porWriter) {
		this.porWriter = porWriter;
	}

	public String getPorContent() {
		return porContent;
	}

	public void setPorContent(String porContent) {
		this.porContent = porContent;
	}

	public String getPorEnrollDate() {
		return porEnrollDate;
	}

	public void setPorEnrollDate(String porEnrollDate) {
		this.porEnrollDate = porEnrollDate;
	}

	public String getPorStatus() {
		return porStatus;
	}

	public void setPorStatus(String porStatus) {
		this.porStatus = porStatus;
	}

	@Override
	public String toString() {
		return "PortpolioReply [porNum=" + porNum + ", porRef=" + porRef + ", porWriter=" + porWriter + ", porContent="
				+ porContent + ", porEnrollDate=" + porEnrollDate + ", porStatus=" + porStatus + "]";
	}
	
	
	
	
}
