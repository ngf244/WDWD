package com.kh.WDWD.cash.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cash.model.vo.PointNCash;

@Repository("cDAO")
public class CashDAO {

	public int getCashChangeCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("cashMapper.getCashChangeCount", userId);
	}

	public ArrayList<PointNCash> selectMyCashChangeList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		
		return (ArrayList)sqlSession.selectList("cashMapper.selectMyCashChangeList", userId, rowBounds);
	}

	public int insertCP(SqlSessionTemplate sqlSession, PointNCash pc) {
		return sqlSession.insert("cashMapper.insertCP", pc);
	}

}
