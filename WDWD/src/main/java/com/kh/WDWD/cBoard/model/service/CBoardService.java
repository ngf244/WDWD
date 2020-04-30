package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cBoard.model.vo.Chat;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.request.model.vo.Request;

public interface CBoardService {

		//자유게시판 개수
	int getListCount(HashMap<String, String> searchMap);
	//자유게시판 page와 함께 갖고오기
	ArrayList<CBoard> selectBoardList(HashMap<String, String> searchMap, PageInfo pi);

	CBoard cBoardInsert(CBoard b);

	CBoard cBoardDetailView(int boNum);

	int doRequest(Request r);

	ArrayList<Request> reqList(int boNum);

	int cancleRequest(Request r);

	int go2stage(Request r);

	int getMyReqListCount(CBoard cboard);

	ArrayList<CBoard> selectMyReqList(PageInfo pi, CBoard cboard);

	int getMyWorkListCount(Request request);

	ArrayList<Request> selectMyWorkList(PageInfo pi, Request request);

	int contentsInsert(Contents c);

	ArrayList<Contents> fileList(int boNum);

	Board cBoardReqView(int boNum);
	
	Board cBoardReqView(Request r);

	int registWrite(Board b, Request r);

	int getListCount2(CBoard cBoard);

	ArrayList<CBoard> selectCashOneList(CBoard cBoard);
	
	int getCateListCount2(HashMap searchMap);
	
	ArrayList<CBoard> selectCashOneCateList(HashMap searchMap);
	
	//int getCateListCount2(CBoard cBoard, String searchCate, String searchText);

	//ArrayList<CBoard> selectCashOneCateList(CBoard cBoard, String searchCate, String searchText);
	
	Chat sendChat(Chat c);

	ArrayList<Chat> chatList(int boNum);
	
	int registDelete(Request r);
	
	int go3stage(int boNum);
	
	ArrayList<CBoard> checkTime();
	
	int timeOut(int boNum);
	
	ArrayList<CBoard> reqBList(int boNum);
	
	int go3stageContest(Request r);
	
	ArrayList<Contents> fileListContest(int boNum);
	
	int minusCash(CBoard board);
	
	String getProfileImg(String boWriter);
	

	



}