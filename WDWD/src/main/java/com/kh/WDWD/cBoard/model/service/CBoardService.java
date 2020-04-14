package com.kh.WDWD.cBoard.model.service;

import java.util.ArrayList;

import com.kh.WDWD.cBoard.model.vo.CBoard;

public interface CBoardService {

	int getListCount(int boGroup1);

	ArrayList<CBoard> selectList(int boGroup1);

	int cBoardInsert(CBoard b);

	CBoard cBoardDetailView(int boNum);




}
