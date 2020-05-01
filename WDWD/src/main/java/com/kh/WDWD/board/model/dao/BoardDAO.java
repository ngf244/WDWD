package com.kh.WDWD.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.contents.model.vo.Contents;

@Repository("bDAO")
public class BoardDAO {

	public int getMyReplyCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("boardMapper.getMyReplyCount", userId);
	}	
	
	public ArrayList<Reply> selectMyReplyList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyReplyList", userId, rowBounds);
	}

	public int boardWriting(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.boardWriting", b);
	}

	public int insertContents(SqlSessionTemplate sqlSession, ArrayList<Contents> contentArr) {
		int count = 0;
		for (Contents content : contentArr) {
			int result = sqlSession.insert("boardMapper.insertContents", content);
			count += result;
		}
		
		return count;
	}

	public Board freeDetail(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.selectOne("boardMapper.freeDetail", boNum);
	}

	public ArrayList<Contents> getContents(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("contentsMapper.getContents", boNum);
	}
	
	public int plusViewCount(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("boardMapper.plusViewCount", boNum);
	}

	// 추천 관련 DAO
	public int checkRecommendExist(SqlSessionTemplate sqlSession, HashMap recommendRequest) {
		return sqlSession.selectOne("boardMapper.checkRecommendExist", recommendRequest);
	}
	public int insertRecommend(SqlSessionTemplate sqlSession, HashMap recommendRequest) {
		return sqlSession.insert("boardMapper.insertRecommend", recommendRequest);
	}
	public int updateBoardRecommend(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("boardMapper.updateBoardRecommend", boNum);
	}

	// Scrapt 관련 DAO
	public int checkScrap(SqlSessionTemplate sqlSession, HashMap scraptToggle) {
		return sqlSession.selectOne("boardMapper.checkScrap", scraptToggle);
	}
	public int insertScrap(SqlSessionTemplate sqlSession, HashMap scraptToggle) {
		return sqlSession.insert("boardMapper.insertScrap", scraptToggle);
	}
	public int deleteScrap(SqlSessionTemplate sqlSession, HashMap scraptToggle) {
		return sqlSession.delete("boardMapper.deleteScrap", scraptToggle);
	}

	public ArrayList<Reply> getReplyList(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("replyMapper.getReplyList", boNum);
	}
	public ArrayList<Reply> getReplyList2(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("replyMapper.getReplyList2", boNum);
	}

	public ArrayList<Contents> getReplyContents(SqlSessionTemplate sqlSession, ArrayList<Reply> replyArr) {
		ArrayList<Contents> replyContents = new ArrayList<Contents>();
		for(Reply r : replyArr) {
			replyContents.add((Contents)sqlSession.selectOne("contentsMapper.getReplyContents", r));
		}
		return replyContents;
	}
	public ArrayList<Contents> getReply2Contents(SqlSessionTemplate sqlSession, ArrayList<Reply> replyArr) {
		ArrayList<Contents> reply2Contents = new ArrayList<Contents>();
		for(Reply r : replyArr) {
			reply2Contents.add((Contents)sqlSession.selectOne("contentsMapper.getReplyContents", r));
		}
		return reply2Contents;
	}

	public int insertOneContent(SqlSessionTemplate sqlSession, Contents c) {
		return sqlSession.insert("contentsMapper.insertOneContent", c);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertReply", r);
	}

	public int plusReplyCount(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("boardMapper.plusReplyCount", boNum);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int reNum) {
		return sqlSession.update("replyMapper.deleteReply", reNum);
	}

	public int deleteContent(SqlSessionTemplate sqlSession, String conCop) {
		return sqlSession.update("contentsMapper.deleteContent", conCop);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("boardMapper.deleteBoard", boNum);
	}

	public int deleteContents(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("contentsMapper.deleteContents", boNum);
	}

	public int deleteBoardContents(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.delete("contentsMapper.deleteBoardContents", boNum);
	}

	public int boardUpdate(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.boardUpdate", b);
	}

	public ArrayList<Board> getTopBoard1(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getTopBoard1");
	}

	public ArrayList<Board> getTopBoard2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getTopBoard2");
	}

	public ArrayList<Board> getTopBoard(SqlSessionTemplate sqlSession, int number) {
		return (ArrayList)sqlSession.selectList("boardMapper.getTopBoard", number);
	}


}
