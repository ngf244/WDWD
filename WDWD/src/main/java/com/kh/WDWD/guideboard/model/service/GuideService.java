package com.kh.WDWD.guideboard.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.guideboard.model.vo.Guideboard;

public interface GuideService {

	int insertBoard(Guideboard g);

	Board selectBoard(int bno);

	int updateBoard(Guideboard g);

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);
	
		
	}
