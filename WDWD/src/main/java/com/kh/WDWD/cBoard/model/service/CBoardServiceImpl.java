package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.cBoard.model.dao.CBoardDAO;
import com.kh.WDWD.cBoard.model.vo.CBoard;

@Service("CBoardService")
public class CBoardServiceImpl implements CBoardService {

	@Autowired
	private CBoardDAO cBoardDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(int boGroup1) {
		return cBoardDAO.getListCount(sqlSession, boGroup1);
	}

	@Override
	public ArrayList<CBoard> selectList(int boGroup1) {
		return cBoardDAO.getBoardList(sqlSession, boGroup1);
	}

	@Override
	public int cBoardInsert(CBoard b) {
		return cBoardDAO.cBoardInsert(sqlSession, b);
	}

	@Override
	public CBoard cBoardDetailView(int boNum) {
		return cBoardDAO.cBoardDetailView(sqlSession, boNum);
	}
	
}
