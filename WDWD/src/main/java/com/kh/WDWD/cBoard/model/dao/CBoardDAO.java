package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public int cBoardInsert(SqlSessionTemplate sqlSession, CBoard b) {
		int result1 = sqlSession.insert("cBoardMapper.cBoardInsert1", b);
		int result2 = sqlSession.insert("cBoardMapper.cBoardInsert2", b);
		
		if(result1 > result2) {
			return result2;
		} else {
			return result1;
		}
	}

	public CBoard cBoardDetailView(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.selectOne("cBoardMapper.cBoardDetail", boNum);
	}

	public int getMyReqListCount(SqlSessionTemplate sqlSession, CBoard cboard) {
		return sqlSession.selectOne("cBoardMapper.getMyReqListCount", cboard);
	}


	public ArrayList<CBoard> selectMyReqList(SqlSessionTemplate sqlSession, PageInfo pi, CBoard cboard) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectMyReqList", cboard, rowBounds);
	}
}