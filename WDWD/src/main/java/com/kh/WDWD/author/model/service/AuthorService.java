package com.kh.WDWD.author.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.WDWD.author.model.vo.Ban;
import com.kh.WDWD.author.model.vo.BanList;
import com.kh.WDWD.author.model.vo.Declaration;
import com.kh.WDWD.author.model.vo.Dispute;
import com.kh.WDWD.member.model.vo.Member;

public interface AuthorService {

	String getId(String deReportedNick);

	int insertReport(Declaration d);

	ArrayList<BanList> getBanUserList();

	ArrayList<Declaration> getReportList(ArrayList<BanList> banArr);
	
	ArrayList<Member> getBanPageUserList(ArrayList<BanList> banArr);

	int updateDeclaration(HashMap map);

	int insertBan(Ban b);

	ArrayList<Ban> getBanList();

	int deleteBan(String userId);

	ArrayList<Dispute> getCancelList();

	ArrayList<Dispute> getDisputeList();

	int updateDispute(HashMap map);

}
