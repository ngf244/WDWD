package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.cBoard.model.vo.CBoard;

@Repository("cBoardDAO")
public class CBoardDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession, int boGroup1) {
		return sqlSession.selectOne("cBoardMapper.getListCount", boGroup1);
		
	}

	public ArrayList<CBoard> getBoardList(SqlSessionTemplate sqlSession, int boGroup1) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.getBoardList", boGroup1);
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

}
