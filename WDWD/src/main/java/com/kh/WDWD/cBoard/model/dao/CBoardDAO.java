package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;

@Repository("cBoardDAO")
public class CBoardDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession, int boGroup1) {
		return sqlSession.selectOne("cBoardMapper.getListCount", boGroup1);
		
	}

	public ArrayList<CBoard> getBoardList(SqlSessionTemplate sqlSession, int boGroup1) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.getBoardList", boGroup1);
	}

	public int getMyReqOneStepListCount(SqlSessionTemplate sqlSession, String userId) {
		int result = sqlSession.selectOne("cBoardMapper.getMyReqOneStepListCount", userId);
		System.out.println("의뢰1단계 개수 : " + result);
		return sqlSession.selectOne("cBoardMapper.getMyReqOneStepListCount", userId);
	}

	public ArrayList<CBoard> selectMyReqOneStepList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectMyReqOneStepList", userId, rowBounds);
	}

}
