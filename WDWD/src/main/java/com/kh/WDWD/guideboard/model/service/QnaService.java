package com.kh.WDWD.guideboard.model.service;

import java.util.ArrayList;

import com.kh.WDWD.guideboard.model.vo.PageInfo;
import com.kh.WDWD.guideboard.model.vo.Qna;

public interface QnaService {

	int getListCount();

	int insertQna(com.kh.WDWD.guideboard.model.vo.Qna q);

	ArrayList<Qna> selectList(PageInfo pi);

	Qna detailQna(int bno);

	int updateQna(Qna q);

	int deleteQna(int bno);



}