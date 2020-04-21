package com.kh.WDWD.contents.model.vo;

public class Contents {
	private int conNum;
	private String conOri;
	private String conCop;
	private String conUrl;
	private int conLevel;
	private String conStatus;
	private int conRef;
	
	public Contents() {}

	public Contents(int conNum, String conOri, String conCop, String conUrl, int conLevel, String conStatus,
			int conRef) {
		super();
		this.conNum = conNum;
		this.conOri = conOri;
		this.conCop = conCop;
		this.conUrl = conUrl;
		this.conLevel = conLevel;
		this.conStatus = conStatus;
		this.conRef = conRef;
	}

	public Contents(String conOri, String conCop, String conUrl, int conLevel) {
		super();
		this.conOri = conOri;
		this.conCop = conCop;
		this.conUrl = conUrl;
		this.conLevel = conLevel;
	}
	
	public Contents(String conOri, String conCop, String conUrl) {
		super();
		this.conOri = conOri;
		this.conCop = conCop;
		this.conUrl = conUrl;
	}

	public int getConNum() {
		return conNum;
	}

	public void setConNum(int conNum) {
		this.conNum = conNum;
	}

	public String getConOri() {
		return conOri;
	}

	public void setConOri(String conOri) {
		this.conOri = conOri;
	}

	public String getConCop() {
		return conCop;
	}

	public void setConCop(String conCop) {
		this.conCop = conCop;
	}

	public String getConUrl() {
		return conUrl;
	}

	public void setConUrl(String conUrl) {
		this.conUrl = conUrl;
	}

	public int getConLevel() {
		return conLevel;
	}

	public void setConLevel(int conLevel) {
		this.conLevel = conLevel;
	}

	public String getConStatus() {
		return conStatus;
	}

	public void setConStatus(String conStatus) {
		this.conStatus = conStatus;
	}

	public int getConRef() {
		return conRef;
	}

	public void setConRef(int conRef) {
		this.conRef = conRef;
	}

	@Override
	public String toString() {
		return "Contents [conNum=" + conNum + ", conOri=" + conOri + ", conCop=" + conCop + ", conUrl=" + conUrl
				+ ", conLevel=" + conLevel + ", conStatus=" + conStatus + ", conRef=" + conRef + "]";
	}
}
