package com.kh.WDWD.guideboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.guideboard.model.vo.PageInfo;
import com.kh.WDWD.guideboard.model.vo.Qna;

@Repository("qDAO")
public class QnaDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaboardMapper.getListCount");
	}

	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaboardMapper.insertBoard", q);
	}

	public ArrayList<Qna> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBOunds = new RowBounds(offset, pi.getBoardLimit());
		return null;
	}


	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("qnaboardMapper.updateBoard", q);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("qnaboardMapper.delete", bno);
	}

	public Qna detailQna(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("qnaboardMapper.detail", bno);
	}

	public Qna detailQna(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}
}