package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;

public interface CBoardService {
	
	//자유게시판 개수
	int getListCount(String boGroup1);
	//자유게시판 page와 함께 갖고오기
	ArrayList<CBoard> selectBoardList(String boGroup1, PageInfo pi);

	int getMyReqOneStepListCount(String userId);

	ArrayList<CBoard> selectMyReqOneStepList(PageInfo pi, String userId);

	int cBoardInsert(CBoard b);

	CBoard cBoardDetailView(int boNum);

	
	
	int getListCount2(Board b);

	ArrayList<CBoard> selectCashOneList(Board b);
	
	int getCateListCount2(Board b);
	
	ArrayList<CBoard> selectCashOneCateList(Board b);

	

}