package com.kh.WDWD.portpolio.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;

@Repository("pDAO")
public class PortpolioDAO {

	public int enrollPortpolio(SqlSessionTemplate sqlSession, Portpolio p) {
		return sqlSession.insert("portpolioMapper.enrollPortpolio", p);
	}

	public int insertPortpolioContents(SqlSessionTemplate sqlSession, ArrayList<PortpolioContents> pcArr) {
		int count = 0;
		for (PortpolioContents pc : pcArr) {
			int result = sqlSession.insert("portpolioMapper.insertPortpolioContents", pc);
			count += result;
		}
		
		return count;
	}

	public int getPortpolioCount(SqlSessionTemplate sqlSession, Portpolio p) {
		return sqlSession.selectOne("portpolioMapper.getPortpolioCount", p);
		
	}

	public ArrayList<PortpolioContents> selectPortpolioList(SqlSessionTemplate sqlSession, PageInfo pi, Portpolio p) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("portpolioMapper.selectPortpolioList", p, rowBounds);
	}

	public int enrollPoReply(SqlSessionTemplate sqlSession, PortpolioReply pr) {
		return sqlSession.insert("portpolioMapper.enrollPoReply", pr);
	}

	public ArrayList<PortpolioReply> selectPoReply(SqlSessionTemplate sqlSession, PortpolioReply pr) {
		return (ArrayList)sqlSession.selectList("portpolioMapper.selectPoReply", pr);
	}

}
