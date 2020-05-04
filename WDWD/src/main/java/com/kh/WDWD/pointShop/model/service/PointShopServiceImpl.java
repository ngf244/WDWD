package com.kh.WDWD.pointShop.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.pointShop.model.dao.PointShopDAO;

@Service("PointShopServiceService")
public class PointShopServiceImpl implements PointShopService{

	@Autowired
	private PointShopDAO PointShopDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(HashMap searchMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	


}
