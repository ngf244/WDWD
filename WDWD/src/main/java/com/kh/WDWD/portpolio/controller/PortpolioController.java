package com.kh.WDWD.portpolio.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.exception.MemberException;
import com.kh.WDWD.member.model.vo.Member;
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
	
	
	
}
