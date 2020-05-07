package com.kh.WDWD.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.message.model.dao.MessageDAO;
import com.kh.WDWD.message.model.vo.Message;

@Service("MessageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDAO MessageDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount(HashMap searchMap) {
		return MessageDAO.getListCount(sqlSession, searchMap);
	}

	@Override
	public ArrayList<Message> selectMessageList(HashMap searchMap, PageInfo pi) {
		return MessageDAO.selectMessageList(sqlSession, searchMap, pi);
	}

	@Override
	public ArrayList<Message> getMessageDetail(int msgNum) {
		return MessageDAO.getMessageDetail(sqlSession, msgNum);
	}

	@Override
	public int getSendListCount(HashMap searchMap) {
		return MessageDAO.getSendListCount(sqlSession, searchMap);
	}

	@Override
	public ArrayList<Message> selectSendMessageList(HashMap searchMap, PageInfo pi) {
		return MessageDAO.selectSendMessageList(sqlSession, searchMap, pi);
	}

	@Override
	public int deleteMessages(String[] checkArr) {
		return MessageDAO.deleteMessages(sqlSession, checkArr);
	}

	@Override
	public int deleteSendMessages(String[] checkArr) {
		return MessageDAO.deleteSendMessages(sqlSession, checkArr);
	}

	@Override
	public int insertSendMessages(HashMap sendMap) {
		return MessageDAO.insertSendMessages(sqlSession, sendMap);
	}

	@Override
	public ArrayList<Message> getMessageSendDetail(int msgNum) {
		return MessageDAO.getMessageSendDetail(sqlSession, msgNum);
	}

	@Override
	public int getMessageListCount(String loginUser) {
		return MessageDAO.getMessageListCount(sqlSession, loginUser);
	}

	@Override
	public int addAlert(HashMap sendMap) {
		return MessageDAO.addAlert(sqlSession, sendMap);
	}

	@Override
	public ArrayList<Message> getMessageList(String loginUser) {
		return MessageDAO.getMessageList(sqlSession, loginUser);
	}


}
