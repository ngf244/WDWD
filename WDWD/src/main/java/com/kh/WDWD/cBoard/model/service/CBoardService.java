package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;

public interface CBoardService {

	int getListCount(Integer boGroup1);

	ArrayList<CBoard> selectList(Integer boGroup, PageInfo pi);

	int cBoardInsert(CBoard b);

	CBoard cBoardDetailView(int boNum);

	int getMyReqListCount(CBoard cboard);

	ArrayList<CBoard> selectMyReqList(PageInfo pi, CBoard cboard);

	

}