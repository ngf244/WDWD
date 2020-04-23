package com.kh.WDWD.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.contents.model.vo.Contents;

public interface BoardService {

	int getMyReplyCount(String userId);
	
	ArrayList<Reply> selectMyReplyList(String userId, PageInfo pi);
	
	int boardWriting(Board b);
	
	int insertContents(ArrayList<Contents> contentArr);

	Board freeDetail(int boNum);

	ArrayList<Contents> getContents(int boNum);

	
	int checkRecommendExist(HashMap recommendRequest);
	int insertRecommend(HashMap recommendRequest);
	int updateBoardRecommend(int boNum);

	
	int checkScrap(HashMap scraptToggle);
	int insertScrap(HashMap scraptToggle);
	int deleteScrap(HashMap scraptToggle);

	ArrayList<Reply> getReplyList(int boNum);

	ArrayList<Reply> getReplyList2(int boNum);

	ArrayList<Contents> getReplyContents(ArrayList<Reply> replyArr);

	ArrayList<Contents> getReply2Contents(ArrayList<Reply> replyArr);

	int insertOneContent(Contents c);

	int insertReply(Reply r);

	int plusViewCount(int boNum);

	int plusReplyCount(int boNum);
}
