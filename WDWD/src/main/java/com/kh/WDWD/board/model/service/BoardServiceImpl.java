package com.kh.WDWD.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.dao.BoardDAO;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getMyReplyCount(String userId) {
		return bDAO.getMyReplyCount(sqlSession, userId);
	}
	
	@Override
	public ArrayList<Reply> selectMyReplyList(String userId, PageInfo pi) {
		return bDAO.selectMyReplyList(sqlSession, userId, pi);
	}


}
