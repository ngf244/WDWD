package com.kh.WDWD.pointShop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.WDWD.common.MailSend;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.pointShop.model.service.PointShopService;

@Controller
public class pointShopController {
	@Autowired
	private PointShopService pointShopService;
	

	@RequestMapping("pointShop.ps")	
	public String pointShopMain(HttpSession session, Model m) {
		
		Member mem = (Member)session.getAttribute("loginUser");
		
		m.addAttribute("mem", mem);
		
		return "pointShop/shopIndex";
	}
	
	@RequestMapping("sendPIN.ps")
	public void sendPIN(HttpServletRequest request, String email, HttpServletResponse response) {
		MailSend mailSend = new MailSend();
		int result = mailSend.sendPIN(request, email);
		
		try {
			response.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
