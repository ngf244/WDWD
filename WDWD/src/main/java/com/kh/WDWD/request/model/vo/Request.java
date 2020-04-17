package com.kh.WDWD.request.model.vo;

import com.kh.WDWD.cBoard.model.vo.CBoard;

public class Request extends CBoard {
	private int reNum;
	private String reId;
	private int reCash;
	private String rePlz;
	private int reRefNum;
	private String reDate;
	
	public Request() {}

	public Request(int reNum, String reId, int reCash, String rePlz, int reRefNum, String reDate) {
		super();
		this.reNum = reNum;
		this.reId = reId;
		this.reCash = reCash;
		this.rePlz = rePlz;
		this.reRefNum = reRefNum;
		this.reDate = reDate;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public String getReId() {
		return reId;
	}

	public void setReId(String reId) {
		this.reId = reId;
	}

	public int getReCash() {
		return reCash;
	}

	public void setReCash(int reCash) {
		this.reCash = reCash;
	}

	public String getRePlz() {
		return rePlz;
	}

	public void setRePlz(String rePlz) {
		this.rePlz = rePlz;
	}

	public int getReRefNum() {
		return reRefNum;
	}

	public void setReRefNum(int reRefNum) {
		this.reRefNum = reRefNum;
	}

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	@Override
	public String toString() {
		return "Request [reNum=" + reNum + ", reId=" + reId + ", reCash=" + reCash + ", rePlz=" + rePlz + ", reRefNum="
				+ reRefNum + ", reDate=" + reDate + "]";
	}
	
}
