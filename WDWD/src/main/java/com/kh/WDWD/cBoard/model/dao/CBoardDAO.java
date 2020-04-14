package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.request.model.vo.Request;

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


	public int doRequest(SqlSessionTemplate sqlSession, Request r) {
		/*ArrayList<Request> list = null;*/
		
		int result = sqlSession.insert("cBoardMapper.doRequest", r);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.reqCountUp", r);
			/*if(result > 0) {
				int bId = r.getReNum();
				list = (ArrayList)sqlSession.selectList("cBoardMapper.reqList", bId);
			}*/
		}
		
		return result;
	}

	public ArrayList<Request> reqList(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.reqList", bId);
	}
}