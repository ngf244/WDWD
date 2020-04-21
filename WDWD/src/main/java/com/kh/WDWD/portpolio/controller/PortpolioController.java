package com.kh.WDWD.portpolio.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.portpolio.model.service.PortpolioService;
import com.kh.WDWD.portpolio.model.vo.Portpolio;

@Controller
public class PortpolioController {
	
	@Autowired
	private PortpolioService pService;
	
	@RequestMapping("portEnrollView.my")
	public String portEnrollView() {
		return "portpolioEnroll";
	}
	
	@RequestMapping("portEnroll.my")
	public ModelAndView EnrollPortpolio(@ModelAttribute Portpolio p, MultipartHttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		
		return mv;
	}
	
	
	
	
}
