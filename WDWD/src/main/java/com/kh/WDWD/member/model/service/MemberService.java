package com.kh.WDWD.member.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.board.model.vo.Scrap;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;
import com.kh.WDWD.request.model.vo.Request;

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

	// 회원가입시 유저 아이디 체크
	int userIdCheck(String user_id);
	
	int getMyPagePortCount(String userId);

	ArrayList<PortpolioContents> selectMyPagePortList(PageInfo pi, String userId);

	ArrayList<PortpolioReply> selectPoReply(int poNum);

	ArrayList<PortpolioContents> selectAttachFile(int poNum);

	int getMyScrapCount(String userId);

	ArrayList<Scrap> selectMyScrapList(String userId, PageInfo pi);

	ArrayList<Scrap> selectRecentlyScrap(String userId);

	int nickCheck(Member m);

	int updateMember(Member m);

	int insertGrade(Request r);

	String selectUserId(Request r);

	String selectSecretYn(String userId);

	int updateSecretToggle(String userId);
	
  int recentlyBoard(Member m);

	ArrayList<Board> recentlyBoardList(Member loginUser);

	ArrayList<Board> recentlyScrapList(Member loginUser);

}

