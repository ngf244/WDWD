package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.dao.CBoardDAO;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cBoard.model.vo.Chat;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.request.model.vo.Request;

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

	@Override
	public int go2stage(Request r) {
		return cBoardDAO.go2stage(sqlSession, r);
  }
  
	@Override
	public int getMyReqListCount(CBoard cboard) {
		return cBoardDAO.getMyReqListCount(sqlSession, cboard);
	}

	@Override
	public ArrayList<CBoard> selectMyReqList(PageInfo pi, CBoard cboard) {
		return cBoardDAO.selectMyReqList(sqlSession, pi, cboard);
	}

	@Override
	public int getMyWorkListCount(Request request) {
		return cBoardDAO.getMyWorkListCount(sqlSession, request);
	}

	@Override
	public ArrayList<Request> selectMyWorkList(PageInfo pi, Request request) {
		return cBoardDAO.selectMyWorkList(sqlSession, pi, request);
	}
  
	@Override
	public int contentsInsert(Contents c) {
		return cBoardDAO.contentsInsert(sqlSession, c);
	}

	@Override
	public ArrayList<Contents> fileList(int boNum) {
		return cBoardDAO.fileList(sqlSession, boNum);
	}

	@Override
	public Board cBoardReqView(int boNum) {
		return cBoardDAO.cBoardReqView(sqlSession, boNum);
	}

	@Override
	public int registWrite(Board b) {
		return cBoardDAO.registWrite(sqlSession, b);
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

	@Override
	public Chat sendChat(Chat c) {
		return cBoardDAO.sendChat(sqlSession, c);
	}

	@Override
	public ArrayList<Chat> chatList(int boNum) {
		return cBoardDAO.chatList(sqlSession, boNum);
	}

	@Override
	public int registDelete(int boNum) {
		return cBoardDAO.registDelete(sqlSession, boNum);
	}

}