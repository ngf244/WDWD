package com.kh.WDWD.message.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.message.model.vo.Message;

public interface MessageService {

	int getListCount(String loginUser);

	ArrayList<Message> selectMessageList(String loginUser, PageInfo pi);
	
}
