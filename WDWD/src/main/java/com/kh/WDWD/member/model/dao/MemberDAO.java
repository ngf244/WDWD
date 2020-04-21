package com.kh.WDWD.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;

@Repository("uDAO")
public class MemberDAO {

	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return (Member)sqlSession.selectOne("memberMapper.selectMember", userId);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateProfileImg", m);
	}

	public int insertContents(SqlSessionTemplate sqlSession, Contents c) {
		return sqlSession.insert("memberMapper.insertContents", c);
	}

	public ArrayList<Reply> selectRecentlyReply(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyReply", userId);
	}

	public int selectReqOneStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectReqOneStepCount", userId);
	}

	public int selectReqTwoStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectReqTwoStepCount", userId);
	}

	public int selectReqThreeStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectReqThreeStepCount", userId);
	}

	public int selectWorkOneStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectWorkOneStepCount", userId);
	}

	public int selectWorkTwoStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectWorkTwoStepCount", userId);
	}

	public int selectWorkThreeStepCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectWorkThreeStepCount", userId);
	}

	public ArrayList<Board> selectRecentlyPBoard(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyPBoard", userId);
	}

	public ArrayList<CBoard> selectRecentlyCBoard(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyCBoard", userId);
	}

	public ArrayList<PointNCash> selectRecentlyCashChange(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyCashChange", userId);
	}
	
}
