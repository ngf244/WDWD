package com.kh.WDWD.cash.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cash.model.vo.PointNCash;

public interface CashService {

	int getCashChangeCount(String userId);

	ArrayList<PointNCash> selectMyCashChangeList(String userId, PageInfo pi);
	
}
