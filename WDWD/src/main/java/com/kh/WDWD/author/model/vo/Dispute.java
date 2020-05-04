package com.kh.WDWD.author.model.vo;

public class Dispute {
	private int diNum;
	private int diRef;
	private char diRps;
	private int diStatus;
	private String diContent;
	private String diDate;
	private int cbCash;
	private String boGroup;
	
	public Dispute() {}

	public Dispute(int diNum, int diRef, char diRps, int diStatus, String diContent, String diDate, int cbCash,
			String boGroup) {
		super();
		this.diNum = diNum;
		this.diRef = diRef;
		this.diRps = diRps;
		this.diStatus = diStatus;
		this.diContent = diContent;
		this.diDate = diDate;
		this.cbCash = cbCash;
		this.boGroup = boGroup;
	}

	public int getDiNum() {
		return diNum;
	}

	public void setDiNum(int diNum) {
		this.diNum = diNum;
	}

	public int getDiRef() {
		return diRef;
	}

	public void setDiRef(int diRef) {
		this.diRef = diRef;
	}

	public char getDiRps() {
		return diRps;
	}

	public void setDiRps(char diRps) {
		this.diRps = diRps;
	}

	public int getDiStatus() {
		return diStatus;
	}

	public void setDiStatus(int diStatus) {
		this.diStatus = diStatus;
	}

	public String getDiContent() {
		return diContent;
	}

	public void setDiContent(String diContent) {
		this.diContent = diContent;
	}

	public String getDiDate() {
		return diDate;
	}

	public void setDiDate(String diDate) {
		this.diDate = diDate;
	}

	public int getCbCash() {
		return cbCash;
	}

	public void setCbCash(int cbCash) {
		this.cbCash = cbCash;
	}

	public String getBoGroup() {
		return boGroup;
	}

	public void setBoGroup(String boGroup) {
		this.boGroup = boGroup;
	}

	@Override
	public String toString() {
		return "Dispute [diNum=" + diNum + ", diRef=" + diRef + ", diRps=" + diRps + ", diStatus=" + diStatus
				+ ", diContent=" + diContent + ", diDate=" + diDate + ", cbCash=" + cbCash + ", boGroup=" + boGroup
				+ "]";
	}
}
