package com.kh.WDWD.portpolio.model.vo;

public class PortpolioContents extends Portpolio {
	private int pocNum;
	private int pocRef;
	private String pocOrigin;
	private String pocModify;
	private String pocPath;
	private String pocStatus;
	private int pocLevel;
	
	public PortpolioContents() {}

	public PortpolioContents(int pocNum, int pocRef, String pocOrigin, String pocModify, String pocPath,
			String pocStatus, int pocLevel) {
		super();
		this.pocNum = pocNum;
		this.pocRef = pocRef;
		this.pocOrigin = pocOrigin;
		this.pocModify = pocModify;
		this.pocPath = pocPath;
		this.pocStatus = pocStatus;
		this.pocLevel = pocLevel;
	}

	public int getPocNum() {
		return pocNum;
	}

	public void setPocNum(int pocNum) {
		this.pocNum = pocNum;
	}

	public int getPocRef() {
		return pocRef;
	}

	public void setPocRef(int pocRef) {
		this.pocRef = pocRef;
	}

	public String getPocOrigin() {
		return pocOrigin;
	}

	public void setPocOrigin(String pocOrigin) {
		this.pocOrigin = pocOrigin;
	}

	public String getPocModify() {
		return pocModify;
	}

	public void setPocModify(String pocModify) {
		this.pocModify = pocModify;
	}

	public String getPocPath() {
		return pocPath;
	}

	public void setPocPath(String pocPath) {
		this.pocPath = pocPath;
	}

	public String getPocStatus() {
		return pocStatus;
	}

	public void setPocStatus(String pocStatus) {
		this.pocStatus = pocStatus;
	}

	public int getPocLevel() {
		return pocLevel;
	}

	public void setPocLevel(int pocLevel) {
		this.pocLevel = pocLevel;
	}

	@Override
	public String toString() {
		return "PortpolioContents [pocNum=" + pocNum + ", pocRef=" + pocRef + ", pocOrigin=" + pocOrigin
				+ ", pocModify=" + pocModify + ", pocPath=" + pocPath + ", pocStatus=" + pocStatus + ", pocLevel="
				+ pocLevel + ", toString()=" + super.toString() + "]";
	}

		
	
	
	
}
