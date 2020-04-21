package com.kh.WDWD.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.dao.BoardDAO;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.contents.model.vo.Contents;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getMyReplyCount(String userId) {
		return bDAO.getMyReplyCount(sqlSession, userId);
	}
	
	@Override
	public ArrayList<Reply> selectMyReplyList(String userId, PageInfo pi) {
		return bDAO.selectMyReplyList(sqlSession, userId, pi);
	}

	@Override
	public int boardWriting(Board b) {
		return bDAO.boardWriting(sqlSession, b);
	}

	@Override
	public int insertContents(ArrayList<Contents> contentArr) {
		return bDAO.insertContents(sqlSession, contentArr);
	}

	@Override
	public Board freeDetail(int boNum) {
		return bDAO.freeDetail(sqlSession, boNum);
	}

	@Override
	public ArrayList<Contents> getContents(int boNum) {
		return bDAO.getContents(sqlSession, boNum);
	}
	
	//recommend
	@Override
	public int checkRecommendExist(HashMap recommendRequest) {
		return bDAO.checkRecommendExist(sqlSession, recommendRequest);
	}
	@Override
	public int insertRecommend(HashMap recommendRequest) {
		return bDAO.insertRecommend(sqlSession, recommendRequest);
	}
	@Override
	public int updateBoardRecommend(int boNum) {
		return bDAO.updateBoardRecommend(sqlSession, boNum);
	}

	// scrap
	@Override
	public int checkScrap(HashMap scraptToggle) {
		return bDAO.checkScrap(sqlSession, scraptToggle);
	}
	@Override
	public int insertScrap(HashMap scraptToggle) {
		return bDAO.insertScrap(sqlSession, scraptToggle);
	}
	@Override
	public int deleteScrap(HashMap scraptToggle) {
		return bDAO.deleteScrap(sqlSession, scraptToggle);
	}

	@Override
	public ArrayList<Reply> getReplyList(int boNum) {
		return bDAO.getReplyList(sqlSession, boNum);
	}
	@Override
	public ArrayList<Reply> getReplyList2(int boNum) {
		return bDAO.getReplyList2(sqlSession, boNum);
	}
}
