package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.dao.CBoardDAO;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.request.model.vo.Request;

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
	public int doRequest(Request r) {
		return cBoardDAO.doRequest(sqlSession, r);
	}

	@Override
	public ArrayList<Request> reqList(int boNum) {
		return cBoardDAO.reqList(sqlSession, boNum);
	}

	@Override
	public int cancleRequest(Request r) {
		return cBoardDAO.cancleRequest(sqlSession, r);
	}
	
}