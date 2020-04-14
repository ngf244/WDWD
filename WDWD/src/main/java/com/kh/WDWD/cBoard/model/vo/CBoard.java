package com.kh.WDWD.cBoard.model.vo;

import com.kh.WDWD.board.model.vo.Board;

public class CBoard extends Board{

	private int cbStep;
	private String cbSecret;
	private int cbCash;
	private int cbCate;
	private int cbStep1;
	private int cbStep2;
	private int cbStep3;
	private int cbStep4;
	private int cbStep5;
	private String cbDate;
	private String cbPrimium;
	
	public CBoard() {}

	public CBoard(int cbStep, String cbSecret, int cbCash, int cbCate, int cbStep1, int cbStep2, int cbStep3,
			int cbStep4, int cbStep5, String cbDate, String cbPrimium) {
		super();
		this.cbStep = cbStep;
		this.cbSecret = cbSecret;
		this.cbCash = cbCash;
		this.cbCate = cbCate;
		this.cbStep1 = cbStep1;
		this.cbStep2 = cbStep2;
		this.cbStep3 = cbStep3;
		this.cbStep4 = cbStep4;
		this.cbStep5 = cbStep5;
		this.cbDate = cbDate;
		this.cbPrimium = cbPrimium;
	}

	public int getCbStep() {
		return cbStep;
	}

	public void setCbStep(int cbStep) {
		this.cbStep = cbStep;
	}

	public String getCbSecret() {
		return cbSecret;
	}

	public void setCbSecret(String cbSecret) {
		this.cbSecret = cbSecret;
	}

	public int getCbCash() {
		return cbCash;
	}

	public void setCbCash(int cbCash) {
		this.cbCash = cbCash;
	}

	public int getCbCate() {
		return cbCate;
	}

	public void setCbCate(int cbCate) {
		this.cbCate = cbCate;
	}

	public int getCbStep1() {
		return cbStep1;
	}

	public void setCbStep1(int cbStep1) {
		this.cbStep1 = cbStep1;
	}

	public int getCbStep2() {
		return cbStep2;
	}

	public void setCbStep2(int cbStep2) {
		this.cbStep2 = cbStep2;
	}

	public int getCbStep3() {
		return cbStep3;
	}

	public void setCbStep3(int cbStep3) {
		this.cbStep3 = cbStep3;
	}

	public int getCbStep4() {
		return cbStep4;
	}

	public void setCbStep4(int cbStep4) {
		this.cbStep4 = cbStep4;
	}

	public int getCbStep5() {
		return cbStep5;
	}

	public void setCbStep5(int cbStep5) {
		this.cbStep5 = cbStep5;
	}

	public String getCbDate() {
		return cbDate;
	}

	public void setCbDate(String cbDate) {
		this.cbDate = cbDate;
	}

	public String getCbPrimium() {
		return cbPrimium;
	}

	public void setCbPrimium(String cbPrimium) {
		this.cbPrimium = cbPrimium;
	}

	@Override
	public String toString() {
		return "CBoard [cbStep=" + cbStep + ", cbSecret=" + cbSecret + ", cbCash=" + cbCash + ", cbCate=" + cbCate
				+ ", cbStep1=" + cbStep1 + ", cbStep2=" + cbStep2 + ", cbStep3=" + cbStep3 + ", cbStep4=" + cbStep4
				+ ", cbStep5=" + cbStep5 + ", cbDate=" + cbDate + ", cbPrimium=" + cbPrimium + "]";
	}
	
	

}

