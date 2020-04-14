package com.kh.WDWD.cash.model.vo;

public class PointNCash {
	private int pcNum;
	private String pcContent;
	private int pcAmount;
	private String pcDate;
	private String pcDiv;
	private String pcId;
	
	public PointNCash() {}

	public PointNCash(int pcNum, String pcContent, int pcAmount, String pcDate, String pcDiv, String pcId) {
		super();
		this.pcNum = pcNum;
		this.pcContent = pcContent;
		this.pcAmount = pcAmount;
		this.pcDate = pcDate;
		this.pcDiv = pcDiv;
		this.pcId = pcId;
	}

	public int getPcNum() {
		return pcNum;
	}

	public void setPcNum(int pcNum) {
		this.pcNum = pcNum;
	}

	public String getPcContent() {
		return pcContent;
	}

	public void setPcContent(String pcContent) {
		this.pcContent = pcContent;
	}

	public int getPcAmount() {
		return pcAmount;
	}

	public void setPcAmount(int pcAmount) {
		this.pcAmount = pcAmount;
	}

	public String getPcDate() {
		return pcDate;
	}

	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}

	public String getPcDiv() {
		return pcDiv;
	}

	public void setPcDiv(String pcDiv) {
		this.pcDiv = pcDiv;
	}

	public String getPcId() {
		return pcId;
	}

	public void setPcId(String pcId) {
		this.pcId = pcId;
	}

	@Override
	public String toString() {
		return "PointNCash [pcNum=" + pcNum + ", pcContent=" + pcContent + ", pcAmount=" + pcAmount + ", pcDate="
				+ pcDate + ", pcDiv=" + pcDiv + ", pcId=" + pcId + "]";
	}
	
	
}
