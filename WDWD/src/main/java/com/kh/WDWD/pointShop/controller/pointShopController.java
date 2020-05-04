package com.kh.WDWD.pointShop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.WDWD.pointShop.model.service.PointShopService;

@Controller
public class pointShopController {
	@Autowired
	private PointShopService pointShopService;
	

	@RequestMapping("pointShop.ps")	
	public String pointShopMain() {
		return "pointShop/shopIndex";
	}
	
	
}
