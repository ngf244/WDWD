package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int getListCount(Integer boGroup) {
		return cBoardDAO.getListCount(sqlSession, boGroup);
	}

	@Override
	public ArrayList<CBoard> selectList(Integer boGroup, PageInfo pi) {
		return cBoardDAO.getBoardList(sqlSession, boGroup, pi);
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
	public int getMyReqListCount(CBoard cboard) {
		return cBoardDAO.getMyReqListCount(sqlSession, cboard);
	}

	@Override
	public ArrayList<CBoard> selectMyReqList(PageInfo pi, CBoard cboard) {
		return cBoardDAO.selectMyReqList(sqlSession, pi, cboard);
	}
	
}