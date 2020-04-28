package com.kh.WDWD.author.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.author.model.dao.AuthorDAO;
import com.kh.WDWD.author.model.service.AuthorService;
import com.kh.WDWD.author.model.vo.Ban;
import com.kh.WDWD.author.model.vo.BanList;
import com.kh.WDWD.author.model.vo.Declaration;
import com.kh.WDWD.member.model.vo.Member;

@Service("aService")
public class AuthorServiceImpl implements AuthorService{

	@Autowired
	private AuthorDAO aDAO;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String getId(String deReportedNick) {
		return aDAO.getId(sqlSession, deReportedNick);
	}

	@Override
	public int insertReport(Declaration d) {
		return aDAO.insertReport(sqlSession, d);
	}
	
	@Override
	public ArrayList<BanList> getBanUserList() {
		return aDAO.getBanUserList(sqlSession);
	}

	@Override
	public ArrayList<Declaration> getReportList(ArrayList<BanList> banArr) {
		return aDAO.getReportList(sqlSession, banArr);
	}

	@Override
	public ArrayList<Member> getBanPageUserList(ArrayList<BanList> banArr) {
		return aDAO.getBanPageUserList(sqlSession, banArr);
	}

	@Override
	public int updateDeclaration(HashMap map) {
		return aDAO.updateDeclaration(sqlSession, map);
	}

	@Override
	public int insertBan(Ban b) {
		return aDAO.insertBan(sqlSession, b);
	}

	@Override
	public ArrayList<Ban> getBanList() {
		return aDAO.getBanList(sqlSession);
	}

	@Override
	public int deleteBan(String userId) {
		return aDAO.deleteBan(sqlSession, userId);
	}
	
}
