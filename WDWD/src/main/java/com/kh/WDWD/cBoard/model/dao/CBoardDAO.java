package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.request.model.vo.Request;

@Repository("cBoardDAO")
public class CBoardDAO {
	
	
	
	public int getListCount(SqlSessionTemplate sqlSession, String boGroup) {
		return sqlSession.selectOne("cBoardMapper.getListCount", boGroup);
	}
	
	public ArrayList<CBoard> selectBoardList(SqlSessionTemplate sqlSession, String boGroup1, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectBoardList", boGroup1, rowBounds);
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
		int result = sqlSession.insert("cBoardMapper.doRequest", r);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.reqCountUp", r);
		}
		return result;
	}

	public ArrayList<Request> reqList(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.reqList", bId);
	}

	public int cancleRequest(SqlSessionTemplate sqlSession, Request r) {
		int result = sqlSession.delete("cBoardMapper.cancleRequest", r);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.reqCountDown", r);
		}
		return result;
	}

	public int go2stage(SqlSessionTemplate sqlSession, Request r) {
		int result = sqlSession.update("cBoardMapper.go2stage1", r);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.go2stage2", r);
		}
		
		return result;
  }   

	public int getMyReqListCount(SqlSessionTemplate sqlSession, CBoard cboard) {
		return sqlSession.selectOne("cBoardMapper.getMyReqListCount", cboard);
	}


	public ArrayList<CBoard> selectMyReqList(SqlSessionTemplate sqlSession, PageInfo pi, CBoard cboard) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectMyReqList", cboard, rowBounds);
	}
  
  	public int getListCount2(SqlSessionTemplate sqlSession, CBoard cBoard) {
  		
		return sqlSession.selectOne("cBoardMapper.getListCount2", cBoard);
	}

	public ArrayList<CBoard> selectCashOneList(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectList2", b);
	}

	public int getCateListCount2(SqlSessionTemplate sqlSession, CBoard cBoard) {
		
		return sqlSession.selectOne("cBoardMapper.getCateListCount2", cBoard);
	}

	public ArrayList<CBoard> selectCashOneCateList(SqlSessionTemplate sqlSession, CBoard cBoard) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectCashOneCateList",  cBoard);
	}
  
  
  
}