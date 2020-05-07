package com.kh.WDWD.author.model.vo;

public class ChangeRequest {
	private int pc_num;
	private int pc_use;
	private String pc_date;
	private String me_id;
	private String me_nick;
	private String me_account;
	private String me_bank;
	
	public ChangeRequest() {}

	public ChangeRequest(int pc_num, int pc_use, String pc_date, String me_id, String me_nick, String me_account, String me_bank) {
		super();
		this.pc_num = pc_num;
		this.pc_use = pc_use;
		this.pc_date = pc_date;
		this.me_id = me_id;
		this.me_nick = me_nick;
		this.me_account = me_account;
		this.me_bank = me_bank;
	}

	public int getPc_num() {
		return pc_num;
	}

	public void setPc_num(int pc_num) {
		this.pc_num = pc_num;
	}

	public int getPc_use() {
		return pc_use;
	}

	public void setPc_use(int pc_use) {
		this.pc_use = pc_use;
	}

	public String getPc_date() {
		return pc_date;
	}

	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}

	public String getMe_id() {
		return me_id;
	}

	public void setMe_id(String me_id) {
		this.me_id = me_id;
	}

	public String getMe_nick() {
		return me_nick;
	}

	public void setMe_nick(String me_nick) {
		this.me_nick = me_nick;
	}

	public String getMe_account() {
		return me_account;
	}

	public void setMe_account(String me_account) {
		this.me_account = me_account;
	}
	
	public String getMe_bank() {
		return me_bank;
	}

	public void setMe_bank(String me_bank) {
		this.me_bank = me_bank;
	}

	@Override
	public String toString() {
		return "ChangeRequest [pc_num=" + pc_num + ", pc_use=" + pc_use + ", pc_date=" + pc_date + ", me_id=" + me_id
				+ ", me_nick=" + me_nick + ", me_account=" + me_account + ", me_bank=" + me_bank + "]";
	}
	
}
