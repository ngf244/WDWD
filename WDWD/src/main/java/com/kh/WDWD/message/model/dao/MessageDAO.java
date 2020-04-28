package com.kh.WDWD.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.message.model.vo.Message;

@Repository("MessageDAO")
public class MessageDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String loginUser) {
		return sqlSession.selectOne("messageMapper.getListCount", loginUser);
	}

	public ArrayList<Message> selectMessageList(SqlSessionTemplate sqlSession, String loginUser, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectMessageList", loginUser, rowBounds);
	}

}
