package com.kh.WDWD.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.dao.MemberDAO;
import com.kh.WDWD.member.model.vo.Member;

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

}
