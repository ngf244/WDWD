package com.kh.WDWD.cBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	
	//자유게시판 글 수 
	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		return sqlSession.selectOne("cBoardMapper.getListCount", searchMap);
	}
	
	//자유게시판 갖고오기
	public ArrayList<CBoard> selectBoardList(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 몇번째 게시글부터 불러오는지
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); // 몇번째부터 몇번째까지인지 가져가는것
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectBoardList", searchMap, rowBounds);
	}
	

	public CBoard cBoardInsert(SqlSessionTemplate sqlSession, CBoard b) {
		int result1 = sqlSession.insert("cBoardMapper.cBoardInsert1", b);
		int result2 = sqlSession.insert("cBoardMapper.cBoardInsert2", b);
		
		CBoard board = sqlSession.selectOne("cBoardMapper.cBoardSelect");
		
		if(result1 > 0 && result2 > 0) {
			return board;
		} else {
			return null;
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
	
	public Board cBoardReqView(SqlSessionTemplate sqlSession, Request r) {
		return sqlSession.selectOne("cBoardMapper.cBoardReqView2", r);
	}  


	public int registWrite(SqlSessionTemplate sqlSession, Board b, Request r) {
		int result = sqlSession.insert("cBoardMapper.registWrite1", b);
		if(result > 0) {
			result = sqlSession.update("cBoardMapper.registWrite2", r);
		}
		
		return result;
	}
  
  public int getListCount2(SqlSessionTemplate sqlSession, CBoard cBoard) {
		return sqlSession.selectOne("cBoardMapper.getListCount2", cBoard);
	}

	public ArrayList<CBoard> selectCashOneList(SqlSessionTemplate sqlSession,  CBoard cBoard, PageInfo piCash) {
		int offset = (piCash.getCurrentPage() - 1) * piCash.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, piCash.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectList2", cBoard, rowBounds);
	}
	
	
	// CashBoard 무한페이징
	public int getCateListCount2(SqlSessionTemplate sqlSession, HashMap searchMap) {
		return sqlSession.selectOne("cBoardMapper.getCateListCount2", searchMap);
	}
	
	public ArrayList<CBoard> selectCashOneCateList(SqlSessionTemplate sqlSession, HashMap searchMap, PageInfo piCash) {
		int offset = (piCash.getCurrentPage() - 1) * piCash.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, piCash.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cBoardMapper.selectCashOneCateList", searchMap, rowBounds);
	}
	
//	public int getCateListCount2(SqlSessionTemplate sqlSession, CBoard cBoard, String searchCate, String searchText) {
//		return sqlSession.selectOne("cBoardMapper.getCateListCount2", cBoard, searchCate, searchText);
//	}
//
//	public ArrayList<CBoard> selectCashOneCateList(SqlSessionTemplate sqlSession, CBoard cBoard, String searchCate, String searchText) {
//		System.out.println(cBoard);
//		
//		
//		return (ArrayList)sqlSession.selectList("cBoardMapper.selectCashOneCateList",  cBoard, searchCate, searchText);
//	}

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

	public int registDelete(SqlSessionTemplate sqlSession, Request r) {
		int result = sqlSession.update("cBoardMapper.registDelete1", r);
		
		if(result > 0) {
			result = sqlSession.delete("cBoardMapper.registDelete2", r);
			result =  sqlSession.delete("cBoardMapper.registDelete3", r);
			return 1;
		}
		return 0;
	}

	public int go3stage(SqlSessionTemplate sqlSession, int boNum) {
		int result1 = sqlSession.update("cBoardMapper.go3stage", boNum);
		int result2 = sqlSession.update("cBoardMapper.PlusCash", boNum);
		int result3 = sqlSession.insert("cBoardMapper.PlusDetail", boNum);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public ArrayList<CBoard> checkTime(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.checkTime");
	}

	public int timeOut(SqlSessionTemplate sqlSession, int boNum) {
		Request r = sqlSession.selectOne("cBoardMapper.getCbCash", boNum);
		CBoard b = sqlSession.selectOne("cBoardMapper.cBoardDetail", boNum);
		
		if(r == null) {
			sqlSession.update("cBoardMapper.endTime", boNum);
		} else {
			sqlSession.update("cBoardMapper.okCash1", r);
			if(b.getBoGroup().equals("3")) {
				sqlSession.update("cBoardMapper.okCash2", r);
				b = sqlSession.selectOne("cBoardMapper.cBoardDetail", boNum);
				sqlSession.update("cBoardMapper.MinusCash", b);
				sqlSession.insert("cBoardMapper.MinusDetail", b);
			}
		}
		
		return 0;
	}

	public ArrayList<CBoard> reqBList(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.reqBList", boNum);
	}

	public int go3stageContest(SqlSessionTemplate sqlSession, Request r) {
		int result1 = sqlSession.update("cBoardMapper.go3stageContest1", r);
		int result2 = sqlSession.update("cBoardMapper.go3stageContest2", r);
		
		int boNum = r.getReNum();
		int result3 = sqlSession.update("cBoardMapper.PlusCash", boNum);
		int result4 = sqlSession.insert("cBoardMapper.PlusDetail", boNum);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public ArrayList<Contents> fileListContest(SqlSessionTemplate sqlSession, int boNum) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.fileListContest", boNum);
	}

	public int minusCash(SqlSessionTemplate sqlSession, CBoard board) {
		sqlSession.update("cBoardMapper.MinusCash", board);
		sqlSession.insert("cBoardMapper.MinusDetail", board);
		
		return 0;
	}

	public String getProfileImg(SqlSessionTemplate sqlSession, String boWriter) {
		return sqlSession.selectOne("cBoardMapper.getProfileImg", boWriter);
	}

	public void directRequest(SqlSessionTemplate sqlSession, Request r) {
		sqlSession.insert("cBoardMapper.directRequest", r);
	}

	public Request directWho(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.selectOne("cBoardMapper.directWho", boNum);
	}

	public int change2stage(SqlSessionTemplate sqlSession, int boNum) {
		int result1 = sqlSession.update("cBoardMapper.change2stage1", boNum);
		int result2 = sqlSession.update("cBoardMapper.change2stage2", boNum);
		int result3 = sqlSession.update("cBoardMapper.change2stage3", boNum);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public int directFalse(SqlSessionTemplate sqlSession, int boNum) {
		int result1 = sqlSession.update("cBoardMapper.directFalse1", boNum);
		int result2 = sqlSession.delete("cBoardMapper.directFalse2", boNum);
		
		if(result1 > 0 && result2 > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public String callmeId(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("cBoardMapper.callmeId", nickName);
	}

	public String selectThumbnail(SqlSessionTemplate sqlSession, int boNum) {
		return sqlSession.selectOne("cBoardMapper.selectThumbnail", boNum);
	}

	public ArrayList<CBoard> actionPremiumList(SqlSessionTemplate sqlSession, String boGroup) {
		return (ArrayList)sqlSession.selectList("cBoardMapper.actionPremiumList", boGroup);
	}
}