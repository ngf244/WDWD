package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.dao.CBoardDAO;
import com.kh.WDWD.cBoard.model.vo.CBoard;

@Service("CBoardService")
public class CBoardServiceImpl implements CBoardService {

	@Autowired
	private CBoardDAO cBoardDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(String boGroup1) {
		return cBoardDAO.getListCount(sqlSession, boGroup1);
	}

	@Override
	public ArrayList<CBoard> selectBoardList(String boGroup1, PageInfo pi) {
		return cBoardDAO.selectBoardList(sqlSession, boGroup1, pi);
	}
	
	@Override
	public int getMyReqOneStepListCount(String userId) {
		return cBoardDAO.getMyReqOneStepListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<CBoard> selectMyReqOneStepList(PageInfo pi, String userId) {
		return cBoardDAO.selectMyReqOneStepList(sqlSession, pi, userId);
	}	
	
	@Override
	public int cBoardInsert(CBoard b) {
		return cBoardDAO.cBoardInsert(sqlSession, b);
	}

	@Override
	public CBoard cBoardDetailView(int boNum) {
		return cBoardDAO.cBoardDetailView(sqlSession, boNum);
	}

	@Override
	public int getListCount2(Board b) {
		return cBoardDAO.getListCount2(sqlSession,  b);
	}

	@Override
	public ArrayList<CBoard> selectCashOneList(Board b) {
		return cBoardDAO.selectCashOneList(sqlSession,  b);
	}

	@Override
	public int getCateListCount2(Board b) {
		return cBoardDAO.getCateListCount2(sqlSession,  b);
	}

	@Override
	public ArrayList<CBoard> selectCashOneCateList(Board b) {
		return cBoardDAO.selectCashOneCateList(sqlSession,  b);
	}
	
}