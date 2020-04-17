package com.kh.WDWD.member.model.vo;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String nickName;
	private String email;
	private String intro;
	private String enrollDate;
	private String easy;
	private String account;
	private String bank;
	private int point;
	private int cash;
	private String uStatus;
	private int grade;
	private int recent1;
	private int recent2;
	private int recent3;
	private int recent4;
	private int recent5;
	private int profileImg;
	
	public Member() {}

	public Member(String userId, String userPwd, String userName, String phone, String nickName, String email,
			String intro, String enrollDate, String easy, String account, String bank, int point, int cash,
			String uStatus, int grade, int recent1, int recent2, int recent3, int recent4, int recent5,
			int profileImg) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.nickName = nickName;
		this.email = email;
		this.intro = intro;
		this.enrollDate = enrollDate;
		this.easy = easy;
		this.account = account;
		this.bank = bank;
		this.point = point;
		this.cash = cash;
		this.uStatus = uStatus;
		this.grade = grade;
		this.recent1 = recent1;
		this.recent2 = recent2;
		this.recent3 = recent3;
		this.recent4 = recent4;
		this.recent5 = recent5;
		this.profileImg = profileImg;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getEasy() {
		return easy;
	}

	public void setEasy(String easy) {
		this.easy = easy;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public String getuStatus() {
		return uStatus;
	}

	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getRecent1() {
		return recent1;
	}

	public void setRecent1(int recent1) {
		this.recent1 = recent1;
	}

	public int getRecent2() {
		return recent2;
	}

	public void setRecent2(int recent2) {
		this.recent2 = recent2;
	}

	public int getRecent3() {
		return recent3;
	}

	public void setRecent3(int recent3) {
		this.recent3 = recent3;
	}

	public int getRecent4() {
		return recent4;
	}

	public void setRecent4(int recent4) {
		this.recent4 = recent4;
	}

	public int getRecent5() {
		return recent5;
	}

	public void setRecent5(int recent5) {
		this.recent5 = recent5;
	}

	public int getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(int profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", phone=" + phone
				+ ", nickName=" + nickName + ", email=" + email + ", intro=" + intro + ", enrollDate=" + enrollDate
				+ ", easy=" + easy + ", account=" + account + ", bank=" + bank + ", point=" + point + ", cash=" + cash
				+ ", uStatus=" + uStatus + ", grade=" + grade + ", recent1=" + recent1 + ", recent2=" + recent2
				+ ", recent3=" + recent3 + ", recent4=" + recent4 + ", recent5=" + recent5 + ", profileImg="
				+ profileImg + "]";
	}
	
	
}

