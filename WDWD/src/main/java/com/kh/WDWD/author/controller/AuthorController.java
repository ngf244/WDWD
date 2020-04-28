package com.kh.WDWD.author.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.WDWD.author.model.exception.AuthorException;
import com.kh.WDWD.author.model.service.AuthorService;
import com.kh.WDWD.author.model.vo.Ban;
import com.kh.WDWD.author.model.vo.BanList;
import com.kh.WDWD.author.model.vo.Declaration;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.member.model.vo.Member;


@Controller
public class AuthorController {
	
	// input type date를 받아오기 위한 timeStamp
	@InitBinder
	public void bindingPreparation(WebDataBinder binder) {
	  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	  CustomDateEditor orderDateEditor = new CustomDateEditor(dateFormat, true);
	  binder.registerCustomEditor(Date.class, orderDateEditor);
	}
	
	@Autowired
	private AuthorService aService; 
	
	@RequestMapping("aban.au")
	public String authorBan() {
		return "author/Ban";
	}
	
	@RequestMapping("trade.au")
	public String authorTrade() {
		return "author/TradeCare";
	}
	
	@RequestMapping("aunban.au")
	public String authorUnban() {
		return "author/Unban";
	}
	
	@RequestMapping("insertReport.au")
	public void insertReport(Declaration d, HttpServletResponse response) {
		String reportedId = aService.getId(d.getDeReportedNick());
		d.setDeReportedId(reportedId);
		
		int insertReportResult = aService.insertReport(d);
		
		if(insertReportResult > 0) {
			try {
				response.getWriter().println("전송완료");
			} catch (IOException e) {
				throw new AuthorException("신고 실패");
			}
		}
	}
	
	@RequestMapping("ban.au")
	public String banPage(Model model) {
		
		ArrayList<BanList> banArr = aService.getBanUserList();
		System.out.println(banArr);
		
		ArrayList<Declaration> deArr = aService.getReportList(banArr);
		System.out.println(deArr);
		
		ArrayList<Member> memArr = aService.getBanPageUserList(banArr);
		System.out.println(memArr);
		
		model.addAttribute("deArr", deArr);
		model.addAttribute("memArr", memArr);
		
		return "author/Ban";
	}
	
	@RequestMapping("updateDeclaration.au")
	public void updateDeclaration(int deNum, char type, HttpServletResponse response) throws IOException {
		System.out.println(deNum);
		System.out.println(type);
		
		HashMap map = new HashMap();
		map.put("deNum", deNum);
		map.put("type", type);
		
		int result = aService.updateDeclaration(map);
		if(result > 0) {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(result);
		} else {
			throw new AuthorException("신고 status 업데이트 실패");
		}
	}
	
	@RequestMapping("insertBan.au")
	public void insertBan(Ban b, HttpServletResponse response, @ModelAttribute("banTerm") Date Term) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String banTerm = sdf.format(Term);
		
		String BanUserId = aService.getId(b.getBanUserNick());
		b.setBanUserId(BanUserId);
		b.setBanTerm(banTerm);
		
		int insertBanResult = aService.insertBan(b);
		System.out.println("insertBanResult : " + insertBanResult);
		
		try {
			response.getWriter().print(insertBanResult);
		} catch (IOException e) {
			throw new BoardException("insertBan fail");
		}
	}
	
	@RequestMapping("unban.au")
	public String unbanPage(Model model) {
		ArrayList<Ban> banList = aService.getBanList();
		
		model.addAttribute("banList", banList);
		
		return "author/Unban";
	}
	
	@RequestMapping("deleteBan.au")
	public void deleteBan(String userId, HttpServletResponse response) throws IOException {
		System.out.println(userId);
		
		int deleteBanResult = aService.deleteBan(userId);
		
		response.getWriter().println(deleteBanResult);
		
	}
	
}
