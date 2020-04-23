package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cBoard.model.vo.Chat;
import com.kh.WDWD.contents.model.vo.Contents;
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
		
		int boNum = sqlSession.selectOne("cBoardMapper.cBoardSelect");
		
		if(result1 > 0 && result2 > 0) {
			return boNum;
		} else {
			return 0;
		}
	}

	public CBoard cBoardDetailView(SqlSessionTemplate sqlSession, int boNum) {
		CBoard b = sqlSession.selectOne("cBoardMapper.cBoardDetail", boNum);
		if(b.getCbStep() > 1) {
			b.setReId((String)sqlSession.selectOne("cBoardMapper.cBoardReId", boNum));
		}
		
		return b;
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

	public int getMyWorkListCount(SqlSessionTemplate sqlSession, Request request) {
		return sqlSession.selectOne("cBoardMapper.getMyWorkListCount", request);
	}


	public ArrayList<Request> selectMyWorkList(SqlSessionTemplate sqlSession, PageInfo pi, Request request) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectMyWorkList", request, rowBounds);
	}

	public int contentsInsert(SqlSessionTemplate sqlSession, Contents c) {
		return sqlSession.insert("cBoardMapper.contentsInsert", c);
	}

	public ArrayList<Contents> fileList(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.fileList", boNum);
	}

	public Board cBoardReqView(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.selectOne("cBoardMapper.cBoardReqView", boNum);
	}


	public int registWrite(SqlSessionTemplate sqlSession, Board b, int boardNum) {
		int result = sqlSession.insert("cBoardMapper.registWrite1", b);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.registWrite2", boardNum);
		}
		
		return result;
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

	public Chat sendChat(SqlSessionTemplate sqlSession, Chat c) {
		int result = sqlSession.insert("cBoardMapper.sendChat", c);
		
		if(result > 0) {
			return sqlSession.selectOne("cBoardMapper.receiveChat");
		}
		return null; 
	}

	public ArrayList<Chat> chatList(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.chatList", boNum);
	}

	public int registDelete(SqlSessionTemplate sqlSession, int boNum) {
		int result = sqlSession.update("cBoardMapper.registDelete1", boNum);
		
		if(result > 0) {
			result = sqlSession.delete("cBoardMapper.registDelete2", boNum);
			result =  sqlSession.delete("cBoardMapper.registDelete3", boNum);
			return 1;
		}
		return 0;
	}

	public int go3stage(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.update("cBoardMapper.go3stage", boNum);
	}

	public ArrayList<CBoard> checkTime(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.checkTime");
	}

	public int timeOut(SqlSessionTemplate sqlSession, int boNum) {
		Request r = sqlSession.selectOne("cBoardMapper.getCbCash", boNum);
		
		System.out.println(boNum + ":" +  r);
		
		if(r == null) {
			sqlSession.update("cBoardMapper.endTime", boNum);
		} else {
			if(sqlSession.update("cBoardMapper.okCash1", r) <= 0 || sqlSession.update("cBoardMapper.okCash2", r) <= 0) {
				return 0;
			}
		}
		
		return 0;
	}  

}