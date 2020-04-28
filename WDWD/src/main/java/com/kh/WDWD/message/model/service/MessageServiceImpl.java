package com.kh.WDWD.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.message.model.dao.MessageDAO;
import com.kh.WDWD.message.model.vo.Message;

@Service("MessageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDAO MessageDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount(String loginUser) {
		return MessageDAO.getListCount(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Message> selectMessageList(String loginUser, PageInfo pi) {
		return MessageDAO.selectMessageList(sqlSession, loginUser, pi);
	}

}
