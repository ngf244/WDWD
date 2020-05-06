package com.kh.WDWD.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.message.model.vo.Message;

@Repository("MessageDAO")
public class MessageDAO {

	public int getListCount(SqlSessionTemplate sqlSession, HashMap searchMap) {
		return sqlSession.selectOne("messageMapper.getListCount", searchMap);
	}

	public ArrayList<Message> selectMessageList(SqlSessionTemplate sqlSession, HashMap searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectMessageList", searchMap, rowBounds);
	}

	public ArrayList<Message> getMessageDetail(SqlSessionTemplate sqlSession, int msgNum) {
		return (ArrayList)sqlSession.selectList("messageMapper.getMessageDetail", msgNum);
	}

	public int getSendListCount(SqlSessionTemplate sqlSession, HashMap searchMap) {
		return sqlSession.selectOne("messageMapper.getSendListCount", searchMap);
	}

	public ArrayList<Message> selectSendMessageList(SqlSessionTemplate sqlSession, HashMap searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectSendMessageList", searchMap, rowBounds);
	}

	public int deleteMessages(SqlSessionTemplate sqlSession, String[] checkArr) {
		return sqlSession.update("messageMapper.deleteMessages", checkArr);
	}

	public int deleteSendMessages(SqlSessionTemplate sqlSession, String[] checkArr) {
		return sqlSession.update("messageMapper.deleteSendMessages", checkArr);
	}

	public int insertSendMessages(SqlSessionTemplate sqlSession, HashMap sendMap) {
		return sqlSession.insert("messageMapper.insertSendMessages", sendMap);
	}

	public ArrayList<Message> getMessageSendDetail(SqlSessionTemplate sqlSession, int msgNum) {
		return (ArrayList)sqlSession.selectList("messageMapper.getMessageSendDetail", msgNum);
	}

	public int getMessageListCount(SqlSessionTemplate sqlSession, String loginUser) {
		return sqlSession.selectOne("messageMapper.getMessageListCount", loginUser);
	}

}
