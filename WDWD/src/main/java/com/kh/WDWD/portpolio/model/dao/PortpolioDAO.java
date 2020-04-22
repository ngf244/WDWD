package com.kh.WDWD.portpolio.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;

@Repository("pDAO")
public class PortpolioDAO {

	public int enrollPortpolio(SqlSessionTemplate sqlSession, Portpolio p) {
		return sqlSession.insert("portpolioMapper.enrollPortpolio", p);
	}

	public int insertPortpolioContents(SqlSessionTemplate sqlSession, ArrayList<PortpolioContents> pcArr) {
		return sqlSession.insert("portpolioMapper.insertPortpolioContents", pcArr);
	}

}
