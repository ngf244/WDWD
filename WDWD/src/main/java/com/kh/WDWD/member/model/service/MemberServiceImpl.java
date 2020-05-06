package com.kh.WDWD.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.board.model.vo.Scrap;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.dao.MemberDAO;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;
import com.kh.WDWD.request.model.vo.Request;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Autowired	
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectMember(String userId) {
		return mDAO.selectMember(sqlSession, userId);
	}

	@Override
	public Member loginMember(Member m) {
		return mDAO.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int updateProfileImg(Member m) {
		return mDAO.updateProfileImg(sqlSession, m);
	}

	@Override
	public int insertContents(Contents c) {
		return mDAO.insertContents(sqlSession, c);
	}

	@Override
	public ArrayList<Reply> selectRecentlyReply(String userId) {
		return mDAO.selectRecentlyReply(sqlSession, userId);
	}

	@Override
	public int selectReqOneStepCount(String userId) {
		return mDAO.selectReqOneStepCount(sqlSession, userId);
	}

	@Override
	public int selectReqTwoStepCount(String userId) {
		return mDAO.selectReqTwoStepCount(sqlSession, userId);
	}

	@Override
	public int selectReqThreeStepCount(String userId) {
		return mDAO.selectReqThreeStepCount(sqlSession, userId);
	}

	@Override
	public int selectWorkOneStepCount(String userId) {
		return mDAO.selectWorkOneStepCount(sqlSession, userId);
	}

	@Override
	public int selectWorkTwoStepCount(String userId) {
		return mDAO.selectWorkTwoStepCount(sqlSession, userId);
	}

	@Override
	public int selectWorkThreeStepCount(String userId) {
		return mDAO.selectWorkThreeStepCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Board> selectRecentlyPBoard(String userId) {
		return mDAO.selectRecentlyPBoard(sqlSession, userId);
	}

	@Override
	public ArrayList<CBoard> selectRecentlyCBoard(String userId) {
		return mDAO.selectRecentlyCBoard(sqlSession, userId);
	}

	@Override
	public ArrayList<PointNCash> selectRecentlyCashChange(String userId) {
		return mDAO.selectRecentlyCashChange(sqlSession, userId);
	}

	@Override
	public int userIdCheck(String user_id) {
		return mDAO.selectuserIdcheck(sqlSession, user_id);
	}

	@Override
	public int getMyPagePortCount(String userId) {
		return mDAO.getMyPagePortCount(sqlSession, userId);
	}

	@Override
	public ArrayList<PortpolioContents> selectMyPagePortList(PageInfo pi, String userId) {
		return mDAO.selectMyPagePortList(sqlSession, pi, userId);
	}

	@Override
	public ArrayList<PortpolioReply> selectPoReply(int poNum) {
		return mDAO.selectPoReply(sqlSession, poNum);
	}

	@Override
	public ArrayList<PortpolioContents> selectAttachFile(int poNum) {
		return mDAO.selectAttachFile(sqlSession, poNum);
	}

	@Override
	public int getMyScrapCount(String userId) {
		return mDAO.getMyScrapCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Scrap> selectMyScrapList(String userId, PageInfo pi) {
		return mDAO.selectMyScrapList(sqlSession, userId, pi);
	}

	@Override
	public ArrayList<Scrap> selectRecentlyScrap(String userId) {
		return mDAO.selectRecentlyScrap(sqlSession, userId);
	}

	@Override
	public int nickCheck(Member m) {
		return mDAO.nickCheck(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int insertGrade(Request r) {
		return mDAO.insertGrade(sqlSession, r);
	}

	@Override
	public String selectUserId(Request r) {
		return mDAO.selectUserId(sqlSession, r);
	}

	@Override
	public String selectSecretYn(Member m) {
		return mDAO.selectSecretYn(sqlSession, m);
	}

	@Override
	public int updateSecretToggle(String userId) {
		return mDAO.updateSecretToggle(sqlSession, userId);
	}

	@Override
	public int recentlyBoard(Member m) {
		return mDAO.recentlyBoard(sqlSession, m);
	}

	@Override
	public ArrayList<Board> recentlyBoardList(Member loginUser) {
		return mDAO.recentlyBoardList(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Board> recentlyScrapList(Member loginUser) {
		return mDAO.recentlyScrapList(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Member> getMemberList() {
		return mDAO.getMemberList(sqlSession);
	}

	@Override
	public int[] callTodayData() {
		return mDAO.callTodayData(sqlSession);
  }
  
  @Override
	public int updateSecretToggle2(String userId) {
		return mDAO.updateSecretToggle2(sqlSession, userId);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return mDAO.selectMemberByEmail(sqlSession, email);
	}
}

