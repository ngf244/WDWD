package com.kh.WDWD.cash.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cash.model.dao.CashDAO;
import com.kh.WDWD.cash.model.vo.PointNCash;

@Service("cService")
public class CashServiceImpl implements CashService {

	@Autowired
	private CashDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCashChangeCount(String userId) {
		return cDAO.getCashChangeCount(sqlSession, userId);
	}

	@Override
	public ArrayList<PointNCash> selectMyCashChangeList(String userId, PageInfo pi) {
		return cDAO.selectMyCashChangeList(sqlSession, userId, pi);
	}

}
