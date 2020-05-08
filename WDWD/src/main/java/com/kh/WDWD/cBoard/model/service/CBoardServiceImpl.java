package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.author.model.vo.Dispute;
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
	public int getListCount(HashMap<String, String> searchMap) {
		return cBoardDAO.getListCount(sqlSession, searchMap);
	}

	@Override
	public ArrayList<CBoard> selectBoardList(HashMap<String, String> searchMap, PageInfo pi) {
		return cBoardDAO.selectBoardList(sqlSession, searchMap, pi);
	}
	
	
	@Override
	public CBoard cBoardInsert(CBoard b) {
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
	public Board cBoardReqView(Request r) {
		return cBoardDAO.cBoardReqView(sqlSession, r);
	}

	@Override
	public int registWrite(Board b, Request r) {
		return cBoardDAO.registWrite(sqlSession, b, r);
	}
	
	@Override
	public ArrayList<CBoard> selectCashList(CBoard cBoard) {
		return cBoardDAO.selectCashList(sqlSession, cBoard);
	}

	@Override
	public int getCateListCount2(HashMap searchMap) {
		return cBoardDAO.getCateListCount2(sqlSession, searchMap);
	}
	
	@Override
	public ArrayList<CBoard> selectCashOneCateList(HashMap searchMap, PageInfo piCash) {
		return cBoardDAO.selectCashOneCateList(sqlSession, searchMap, piCash);
	}
//	@Override
//	public int getCateListCount2(CBoard cBoard, String searchCate, String searchText) {
//		return cBoardDAO.getCateListCount2(sqlSession, cBoard, searchCate, searchText);
//	}
//
//	@Override
//	public ArrayList<CBoard> selectCashOneCateList(CBoard cBoard, String searchCate, String searchText) {
//		return cBoardDAO.selectCashOneCateList(sqlSession, cBoard, searchCate, searchText);
//	}

	@Override
	public Chat sendChat(Chat c) {
		return cBoardDAO.sendChat(sqlSession, c);
	}

	@Override
	public ArrayList<Chat> chatList(int boNum) {
		return cBoardDAO.chatList(sqlSession, boNum);
	}

	@Override
	public int registDelete(Request r) {
		return cBoardDAO.registDelete(sqlSession, r);
	}

	@Override
	public int go3stage(int boNum) {
		return cBoardDAO.go3stage(sqlSession, boNum);
	}

	@Override
	public ArrayList<CBoard> checkTime() {
		return cBoardDAO.checkTime(sqlSession);
	}

	@Override
	public int timeOut(int boNum) {
		return cBoardDAO.timeOut(sqlSession, boNum);
	}

	@Override
	public ArrayList<CBoard> reqBList(int boNum) {
		return cBoardDAO.reqBList(sqlSession, boNum);
	}

	@Override
	public int go3stageContest(Request r) {
		return cBoardDAO.go3stageContest(sqlSession, r);
	}

	@Override
	public String selectThumbnail(int boNum) {
		return cBoardDAO.selectThumbnail(sqlSession, boNum);
  }
  
  @Override
  public ArrayList<Contents> fileListContest(int boNum) {
		return cBoardDAO.fileListContest(sqlSession, boNum);
	}

	@Override
	public int minusCash(CBoard board) {
		return cBoardDAO.minusCash(sqlSession, board);
	}

	@Override
	public String getProfileImg(String boWriter) {
		return cBoardDAO.getProfileImg(sqlSession, boWriter);
	}

	@Override
	public void directRequest(Request r) {
		cBoardDAO.directRequest(sqlSession, r);
	}

	@Override
	public Request directWho(int boNum) {
		return cBoardDAO.directWho(sqlSession, boNum);
	}

	@Override
	public int change2stage(int boNum) {
		return cBoardDAO.change2stage(sqlSession, boNum);
	}

	@Override
	public int directFalse(int boNum) {
		return cBoardDAO.directFalse(sqlSession, boNum);
	}

	@Override
	public String callmeId(String nickName) {
		return cBoardDAO.callmeId(sqlSession, nickName);
	}

	@Override
	public int goDispute(Dispute d) {
		return cBoardDAO.goDispute(sqlSession, d);
	}

	@Override
	public ArrayList<Dispute> dpList(int boNum) {
		return cBoardDAO.dpList(sqlSession, boNum);
	}
	
	@Override
	public int cancleDispute(Dispute d) {
		return cBoardDAO.cancleDispute(sqlSession, d);
	}
	
	@Override
	public int endDispute(Dispute d) {
		return cBoardDAO.endDispute(sqlSession, d);
	}
	
	@Override
	public ArrayList<CBoard> selectPrimiumList() {
		return cBoardDAO.selectPrimiumList(sqlSession);
	}

	@Override
	public ArrayList<CBoard> selectCashListSearch(HashMap<String, String> searchMap) {
		return cBoardDAO.selectCashListSearch(sqlSession, searchMap);
	}
	
}