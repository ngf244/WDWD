package com.kh.WDWD.author.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.author.model.vo.Ban;
import com.kh.WDWD.author.model.vo.BanList;
import com.kh.WDWD.author.model.vo.Declaration;
import com.kh.WDWD.author.model.vo.Dispute;
import com.kh.WDWD.member.model.vo.Member;

@Repository("aDAO")
public class AuthorDAO {

	public String getId(SqlSession sqlSession, String deReportedNick) {
		return sqlSession.selectOne("authorMapper.getId", deReportedNick);
	}

	public int insertReport(SqlSession sqlSession, Declaration d) {
		return sqlSession.insert("authorMapper.insertReport", d);
	}
	
	public ArrayList<BanList> getBanUserList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("authorMapper.getBanUserList");
	}

	public ArrayList<Declaration> getReportList(SqlSession sqlSession, ArrayList<BanList> banArr) {
		return (ArrayList)sqlSession.selectList("authorMapper.getReportList", banArr);
	}

	public ArrayList<Member> getBanPageUserList(SqlSession sqlSession, ArrayList<BanList> banArr) {
		return (ArrayList)sqlSession.selectList("authorMapper.getBanPageUserList", banArr);
	}

	public int updateDeclaration(SqlSession sqlSession, HashMap map) {
		return sqlSession.update("authorMapper.updateDeclaration", map);
	}

	public int insertBan(SqlSession sqlSession, Ban b) {
		return sqlSession.insert("authorMapper.insertBan", b);
	}

	public ArrayList<Ban> getBanList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("authorMapper.getBanList");
	}

	public int deleteBan(SqlSession sqlSession, String userId) {
		return sqlSession.delete("authorMapper.deleteBan", userId);
	}

	public ArrayList<Dispute> getCancelList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("authorMapper.getCancelList");
	}

	public ArrayList<Dispute> getDisputeList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("authorMapper.getDisputeList");
	}

	public int updateDispute(SqlSession sqlSession, HashMap map) {
		return sqlSession.update("authorMapper.updateDispute", map);
	}

}
