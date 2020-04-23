package com.kh.WDWD.portpolio.model.vo;

public class Portpolio {
	private int poNum;
	private String poTitle;
	private String poWriter;
	private String poDesc;
	private String poCategory;
	private String poEnrollDate;
	private String poModifyDate;
	private String poUseYn;
	private int poFee;
	private int poCount;
	private String poStatus;
	
	public Portpolio() {}

	public Portpolio(int poNum, String poTitle, String poWriter, String poDesc, String poCategory, String poEnrollDate,
			String poModifyDate, String poUseYn, int poFee, int poCount, String poStatus) {
		super();
		this.poNum = poNum;
		this.poTitle = poTitle;
		this.poWriter = poWriter;
		this.poDesc = poDesc;
		this.poCategory = poCategory;
		this.poEnrollDate = poEnrollDate;
		this.poModifyDate = poModifyDate;
		this.poUseYn = poUseYn;
		this.poFee = poFee;
		this.poCount = poCount;
		this.poStatus = poStatus;
	}

	public int getPoNum() {
		return poNum;
	}

	public void setPoNum(int poNum) {
		this.poNum = poNum;
	}

	public String getPoTitle() {
		return poTitle;
	}

	public void setPoTitle(String poTitle) {
		this.poTitle = poTitle;
	}

	public String getPoWriter() {
		return poWriter;
	}

	public void setPoWriter(String poWriter) {
		this.poWriter = poWriter;
	}

	public String getPoDesc() {
		return poDesc;
	}

	public void setPoDesc(String poDesc) {
		this.poDesc = poDesc;
	}

	public String getPoCategory() {
		return poCategory;
	}

	public void setPoCategory(String poCategory) {
		this.poCategory = poCategory;
	}

	public String getPoEnrollDate() {
		return poEnrollDate;
	}

	public void setPoEnrollDate(String poEnrollDate) {
		this.poEnrollDate = poEnrollDate;
	}

	public String getPoModifyDate() {
		return poModifyDate;
	}

	public void setPoModifyDate(String poModifyDate) {
		this.poModifyDate = poModifyDate;
	}

	public String getPoUseYn() {
		return poUseYn;
	}

	public void setPoUseYn(String poUseYn) {
		this.poUseYn = poUseYn;
	}

	public int getPoFee() {
		return poFee;
	}

	public void setPoFee(int poFee) {
		this.poFee = poFee;
	}

	public int getPoCount() {
		return poCount;
	}

	public void setPoCount(int poCount) {
		this.poCount = poCount;
	}

	public String getPoStatus() {
		return poStatus;
	}

	public void setPoStatus(String poStatus) {
		this.poStatus = poStatus;
	}

	@Override
	public String toString() {
		return "Portpolio [poNum=" + poNum + ", poTitle=" + poTitle + ", poWriter=" + poWriter + ", poDesc=" + poDesc
				+ ", poCategory=" + poCategory + ", poEnrollDate=" + poEnrollDate + ", poModifyDate=" + poModifyDate
				+ ", poUseYn=" + poUseYn + ", poFee=" + poFee + ", poCount=" + poCount + ", poStatus=" + poStatus + "]";
	}

	
	
}
