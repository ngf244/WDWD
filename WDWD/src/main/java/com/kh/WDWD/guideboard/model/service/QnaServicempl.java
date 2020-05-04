package com.kh.WDWD.guideboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.guideboard.model.dao.QnaDAO;
import com.kh.WDWD.guideboard.model.vo.Qna;

@Service("qService")
public class QnaServicempl implements QnaService{

	@Autowired
	private QnaDAO qDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public int getListCount() {
		return qDAO.getListCount(sqlSession);
	}

	@Override
	public int insertQna(Qna q) {
		return qDAO.insertQna(sqlSession, q);
	}

	@Override
	public ArrayList<Qna> selectList(com.kh.WDWD.guideboard.model.vo.PageInfo pi) {
		return qDAO.selectList(sqlSession, pi);
	}

	@Override
	public Qna detailQna(int bno) {
		return qDAO.detailQna(sqlSession);
	}

	@Override
	public int updateQna(Qna q) {
		return qDAO.updateQna(sqlSession, q);
	}

	@Override
	public int deleteQna(int bno) {
		return qDAO.deleteQna(sqlSession, bno);
	}
} 