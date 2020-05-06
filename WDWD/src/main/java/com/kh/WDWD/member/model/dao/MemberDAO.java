package com.kh.WDWD.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.board.model.vo.Scrap;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;
import com.kh.WDWD.request.model.vo.Request;

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

	// 회원가입시 유저 아이디 체크
	public int selectuserIdcheck(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("memberMapper.selectMember", user_id);
	}

	public ArrayList<CBoard> selectRecentlyCBoard(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyCBoard", userId);
	}

	public ArrayList<PointNCash> selectRecentlyCashChange(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyCashChange", userId);
	}

	public int getMyPagePortCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("portpolioMapper.getMyPagePortCount", userId);
	}

	public ArrayList<PortpolioContents> selectMyPagePortList(SqlSessionTemplate sqlSession, PageInfo pi,
			String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("portpolioMapper.selectMyPagePortList", userId, rowBounds);
	}

	public ArrayList<PortpolioReply> selectPoReply(SqlSessionTemplate sqlSession, int poNum) {
		return (ArrayList)sqlSession.selectList("portpolioMapper.selectPoReplyFirst", poNum);
	}

	public ArrayList<PortpolioContents> selectAttachFile(SqlSessionTemplate sqlSession, int poNum) {
		return (ArrayList)sqlSession.selectList("portpolioMapper.selectAttachFile", poNum);
	}

	public int getMyScrapCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.getMyScrapCount", userId);
	}

	public ArrayList<Scrap> selectMyScrapList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("memberMapper.selectMyScrapList", userId, rowBounds);
	}

	public ArrayList<Scrap> selectRecentlyScrap(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentlyScrap", userId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.nickCheck", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int insertGrade(SqlSessionTemplate sqlSession, Request r) {
		return sqlSession.update("memberMapper.insertGrade", r);
	}

	public String selectUserId(SqlSessionTemplate sqlSession, Request r) {
		return sqlSession.selectOne("memberMapper.selectUserId", r);
	}

	public String selectSecretYn(SqlSessionTemplate sqlSession, Member m) {
		String result = sqlSession.selectOne("memberMapper.selectSecretYn", m);
		System.out.println("result : " + result);
		return sqlSession.selectOne("memberMapper.selectSecretYn", m);
	}

	public int updateSecretToggle(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.updateSecretToggle", userId);
	}

	public int recentlyBoard(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.recentlyBoard", m);
	}

	public ArrayList<Board> recentlyBoardList(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentlyBoardList", loginUser);
	}

	public int updateSecretToggle2(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.updateSecretToggle2", userId);
	}

	public Member selectMemberByEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail", email);
	}

}