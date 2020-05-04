package com.kh.WDWD.pointShop.model.vo;

public class PointShop {
	private int psId;
	private String psName;
	private int psPrice;
	private String psSummary;
	private String psContent;
	private String psDate;
	private int psStatus;
	private String psImages;
	private int psClicks;
	private int psReviews;

	public PointShop() {}

	public PointShop(int psId, String psName, int psPrice, String psSummary, String psContent, String psDate,
			int psStatus, String psImages, int psClicks, int psReviews) {
		super();
		this.psId = psId;
		this.psName = psName;
		this.psPrice = psPrice;
		this.psSummary = psSummary;
		this.psContent = psContent;
		this.psDate = psDate;
		this.psStatus = psStatus;
		this.psImages = psImages;
		this.psClicks = psClicks;
		this.psReviews = psReviews;
	}

	public int getPsId() {
		return psId;
	}

	public void setPsId(int psId) {
		this.psId = psId;
	}

	public String getPsName() {
		return psName;
	}

	public void setPsName(String psName) {
		this.psName = psName;
	}

	public int getPsPrice() {
		return psPrice;
	}

	public void setPsPrice(int psPrice) {
		this.psPrice = psPrice;
	}

	public String getPsSummary() {
		return psSummary;
	}

	public void setPsSummary(String psSummary) {
		this.psSummary = psSummary;
	}

	public String getPsContent() {
		return psContent;
	}

	public void setPsContent(String psContent) {
		this.psContent = psContent;
	}

	public String getPsDate() {
		return psDate;
	}

	public void setPsDate(String psDate) {
		this.psDate = psDate;
	}

	public int getPsStatus() {
		return psStatus;
	}

	public void setPsStatus(int psStatus) {
		this.psStatus = psStatus;
	}

	public String getPsImages() {
		return psImages;
	}

	public void setPsImages(String psImages) {
		this.psImages = psImages;
	}

	public int getPsClicks() {
		return psClicks;
	}

	public void setPsClicks(int psClicks) {
		this.psClicks = psClicks;
	}

	public int getPsReviews() {
		return psReviews;
	}

	public void setPsReviews(int psReviews) {
		this.psReviews = psReviews;
	}

	@Override
	public String toString() {
		return "PointShop [psId=" + psId + ", psName=" + psName + ", psPrice=" + psPrice + ", psSummary=" + psSummary
				+ ", psContent=" + psContent + ", psDate=" + psDate + ", psStatus=" + psStatus + ", psImages="
				+ psImages + ", psClicks=" + psClicks + ", psReviews=" + psReviews + "]";
	}
	
}
