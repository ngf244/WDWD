package com.kh.WDWD.portpolio.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.portpolio.model.dao.PortpolioDAO;
import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;

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
	public ArrayList<Portpolio> selectPortpolioList(PageInfo pi, Portpolio p) {
		return pDAO.selectPortpolioList(sqlSession, pi, p);
	}

}
