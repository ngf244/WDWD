package com.kh.WDWD.pointShop.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("PointShopDAO")
public class PointShopDAO {

	public int getListCount(SqlSessionTemplate sqlSession, HashMap searchMap) {
		return sqlSession.selectOne("messageMapper.getListCount", searchMap);
	}


}
