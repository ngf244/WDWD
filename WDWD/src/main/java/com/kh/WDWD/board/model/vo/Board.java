package com.kh.WDWD.board.model.vo;

public class Board {

	private int boNum;
	private String boGroup;
	private String boTitle;
	private String boContent;
	private int boView;
	private String boDate;
	private String boUpdate;
	private String boDel;
	private String boWriter;
	private int boGood;
	private String boCategory;
	private int boReNum;
	
	public Board() {}

	public Board(int boNum, String boGroup, String boTitle, String boContent, int boView, String boDate,
			String boUpdate, String boDel, String boWriter, int boGood, String boCategory, int boReNum) {
		super();
		this.boNum = boNum;
		this.boGroup = boGroup;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.boView = boView;
		this.boDate = boDate;
		this.boUpdate = boUpdate;
		this.boDel = boDel;
		this.boWriter = boWriter;
		this.boGood = boGood;
		this.boCategory = boCategory;
		this.boReNum = boReNum;
	}

	public Board(String boGroup, String boCategory) {
		super();
		this.boGroup = boGroup;
		this.boCategory = boCategory;
	}

	public int getBoNum() {
		return boNum;
	}

	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}

	public String getBoGroup() {
		return boGroup;
	}

	public void setBoGroup(String boGroup) {
		this.boGroup = boGroup;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoContent() {
		return boContent;
	}

	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}

	public int getBoView() {
		return boView;
	}

	public void setBoView(int boView) {
		this.boView = boView;
	}

	public String getBoDate() {
		return boDate;
	}

	public void setBoDate(String boDate) {
		this.boDate = boDate;
	}

	public String getBoUpdate() {
		return boUpdate;
	}

	public void setBoUpdate(String boUpdate) {
		this.boUpdate = boUpdate;
	}

	public String getBoDel() {
		return boDel;
	}

	public void setBoDel(String boDel) {
		this.boDel = boDel;
	}

	public String getBoWriter() {
		return boWriter;
	}

	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}

	public int getBoGood() {
		return boGood;
	}

	public void setBoGood(int boGood) {
		this.boGood = boGood;
	}

	public String getBoCategory() {
		return boCategory;
	}

	public void setBoCategory(String boCategory) {
		this.boCategory = boCategory;
	}

	public int getBoReNum() {
		return boReNum;
	}

	public void setBoReNum(int boReNum) {
		this.boReNum = boReNum;
	}

	@Override
	public String toString() {
		return "Board [boNum=" + boNum + ", boGroup=" + boGroup + ", boTitle=" + boTitle + ", boContent=" + boContent
				+ ", boView=" + boView + ", boDate=" + boDate + ", boUpdate=" + boUpdate + ", boDel=" + boDel
				+ ", boWriter=" + boWriter + ", boGood=" + boGood + ", boCategory=" + boCategory + ", boReNum="
				+ boReNum + "]";
	}
	
}
