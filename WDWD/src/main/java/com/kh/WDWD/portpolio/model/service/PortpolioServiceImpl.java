package com.kh.WDWD.portpolio.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.portpolio.model.dao.PortpolioDAO;
import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;

@Service("pService")
public class PortpolioServiceImpl implements PortpolioService {

	@Autowired
	private PortpolioDAO pDAO;
	
	@Autowired	
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int enrollPortpolio(Portpolio p) {
		return pDAO.enrollPortpolio(sqlSession, p);
	}

	@Override
	public int insertPortpolioCotents(ArrayList<PortpolioContents> pcArr) {
		return pDAO.insertPortpolioContents(sqlSession, pcArr);
	}

	@Override
	public int getPortpolioCount(Portpolio p) {
		return pDAO.getPortpolioCount(sqlSession, p);
	}

	@Override
	public ArrayList<PortpolioContents> selectPortpolioList(PageInfo pi, Portpolio p) {
		return pDAO.selectPortpolioList(sqlSession, pi, p);
	}

	@Override
	public int enrollPoReply(PortpolioReply pr) {
		return pDAO.enrollPoReply(sqlSession, pr);
	}

	@Override
	public ArrayList<PortpolioReply> selectPoReply(PortpolioReply pr) {
		return pDAO.selectPoReply(sqlSession, pr);
	}

	@Override
	public ArrayList<PortpolioReply> selectPoReply(int poNum) {
		return pDAO.selectPoReply(sqlSession, poNum);
	}

	@Override
	public int deletePortpolio(Portpolio p) {
		return pDAO.deletePortpolio(sqlSession, p);
	}

	@Override
	public int updatePortCount(Portpolio p) {
		return pDAO.updatePortCount(sqlSession, p);
	}

}
