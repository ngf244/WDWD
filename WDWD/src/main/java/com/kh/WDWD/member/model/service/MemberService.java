package com.kh.WDWD.member.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;

public interface MemberService {

	Member selectMember(String userId);
  
    Member loginMember(Member m);

	int insertMember(Member m);

	int updateProfileImg(Member m);

	int insertContents(Contents c);

	ArrayList<Reply> selectRecentlyReply(String userId);

	int selectReqOneStepCount(String userId);

	int selectReqTwoStepCount(String userId);

	int selectReqThreeStepCount(String userId);

	int selectWorkOneStepCount(String userId);

	int selectWorkTwoStepCount(String userId);

	int selectWorkThreeStepCount(String userId);

	ArrayList<Board> selectRecentlyPBoard(String userId);

	ArrayList<CBoard> selectRecentlyCBoard(String userId);

	ArrayList<PointNCash> selectRecentlyCashChange(String userId);

	int checkIdDup(String id);

	int getMyPagePortCount(String userId);

	ArrayList<PortpolioContents> selectMyPagePortList(PageInfo pi, String userId);

	ArrayList<PortpolioReply> selectPoReply(int poNum);

	ArrayList<PortpolioContents> selectAttachFile(int poNum);

}

