package com.kh.WDWD.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;

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



}
