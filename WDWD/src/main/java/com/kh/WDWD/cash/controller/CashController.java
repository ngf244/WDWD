package com.kh.WDWD.cash.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cash.model.exception.CashException;
import com.kh.WDWD.cash.model.service.CashService;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.service.MemberService;
import com.kh.WDWD.member.model.vo.Member;

@Controller
public class CashController {
	
	@Autowired
	private CashService cService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("cashChange.my")
	public ModelAndView cashChangeListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		Member member = mService.selectMember(userId);
		
		System.out.println("member : " + member);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getCashChangeCount(userId);
		
		PageInfo pi = Pagination.getMyCashChangePageInfo(currentPage, listCount);		
		ArrayList<PointNCash> pcList = cService.selectMyCashChangeList(userId, pi);
		
		if(pcList != null) {
			mv.addObject("pcList", pcList)
			  .addObject("pi", pi)
			  .addObject("member", member)
			  .setViewName("cashChangeList");
		} else {
			throw new CashException("캐쉬 변동 내역 조회에 실패하였습니다.");
		}		
		
		return mv;
	}
	
	@RequestMapping("insertCP.my")
	public void insertCash(PointNCash pc, HttpServletResponse response, HttpSession session) {
		
		int insertCashResult = cService.insertCP(pc);
		
		if(insertCashResult > 0) {
			try {
				Member mem = (Member)session.getAttribute("loginUser");
				
				if(pc.getPcDiv().equals("C")) {
					mem.setCash(mem.getCash() + pc.getPcAmount());
				} else {
					mem.setPoint(mem.getPoint() + pc.getPcAmount());
				}
				
				response.getWriter().println(insertCashResult);
			} catch (IOException e) {
				throw new CashException(e.getMessage());
			}
		} else {
			throw new CashException("캐쉬 충전 실패");
		}
	}
}
