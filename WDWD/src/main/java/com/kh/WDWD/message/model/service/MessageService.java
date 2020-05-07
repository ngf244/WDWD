package com.kh.WDWD.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.message.model.vo.Message;

public interface MessageService {

	int getListCount(HashMap searchMap);

	ArrayList<Message> selectMessageList(HashMap searchMap, PageInfo pi);

	ArrayList<Message> getMessageDetail(int msgNum);

	int getSendListCount(HashMap searchMap);

	ArrayList<Message> selectSendMessageList(HashMap searchMap, PageInfo pi);

	int deleteMessages(String[] checkArr);

	int deleteSendMessages(String[] checkArr);

	int insertSendMessages(HashMap sendMap);

	ArrayList<Message> getMessageSendDetail(int msgNum);

	int getMessageListCount(String loginUser);

	int addAlert(HashMap sendMap);

	ArrayList<Message> getMessageList(String loginUser);

	
}
