package com.kh.WDWD.board.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;

public interface BoardService {

	int getMyReplyCount(String userId);
	
	ArrayList<Reply> selectMyReplyList(String userId, PageInfo pi);

}
