package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;

@Repository("cBoardDAO")
public class CBoardDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession, Integer boGroup) {
		return sqlSession.selectOne("cBoardMapper.getListCount", boGroup);
		
	}

	
	public ArrayList<CBoard> getBoardList(SqlSessionTemplate sqlSession, Integer boGroup, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.getBoardList", boGroup, rowBounds);
	}

}
