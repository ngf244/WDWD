package com.kh.WDWD.cBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.exception.CBoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.request.model.vo.Request;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cBoardService;
	
	@RequestMapping("reqList.my")
	public ModelAndView reqListView(@RequestParam(value="boWriter", required=false) String boWriter, @RequestParam(value="cbStep", required=false) Integer cbStep, @RequestParam(value="boGroup", required=false) String boGroup, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		CBoard cboard = new CBoard();
		
		if(boWriter != null) {
			cboard.setBoWriter(boWriter);
		}
		
		if(cbStep != null) {
			cboard.setCbStep(cbStep);
		}
		
		if(boGroup != null) {
			cboard.setBoGroup(boGroup);
		}
		
		int listCount = cBoardService.getMyReqListCount(cboard);
		PageInfo pi = Pagination.getReqListPageInfo(currentPage, listCount);		
		
		ArrayList<CBoard> list = cBoardService.selectMyReqList(pi, cboard);
		
		if(list != null) {
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .addObject("cboard", cboard);
			
			switch(cboard.getCbStep()) {
			case 1: mv.setViewName("requestOneStepList"); break;
			case 2: mv.setViewName("requestTwoStepList"); break;
			case 3: mv.setViewName("requestThreeStepList"); break; 
			}
			
		} else {
			throw new BoardException("내 의뢰 1단계 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
		// 자유게시판  조회 컨트롤러
	@RequestMapping("actionList.ch")
	public ModelAndView actionList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		String boGroup1 = "1"; //자유게시판

		
		//자유게시판 페이징
		int currentPage = 1;
		if(page != null) { 
			currentPage = page;
		}
		
		int listCount =  cBoardService.getListCount(boGroup1);

		
		// 자유게시판 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boGroup1);
		
		ArrayList<CBoard> list = cBoardService.selectBoardList(boGroup1, pi);
		
		
		if(list != null) {
			mv.addObject("list", list); 
			mv.addObject("pi", pi);
			mv.setViewName("board/boardlist"); 
		} else {
			
			throw new BoardException("자유게시판 조회에 실패하였습니다."); 
		}
		
		
		return mv;
	}

		
	// 1:1 조회 컨트롤러
	@RequestMapping("actionOneList.ch")
	@ResponseBody
	public ModelAndView actionOneList(@RequestParam(value = "boGroup2", required = false) String boGroup2, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		String boCategory = "";
		System.out.println("boGroup2 : " + boGroup2); //1:1게시판
		System.out.println("boCategory : " + boCategory); //1:1게시판
		
		Board b = new Board(boGroup2, boCategory);

		int listCount2 = cBoardService.getListCount2(b);
		ArrayList<CBoard> list2 = cBoardService.selectCashOneList(b);


		System.out.println("list2" + list2);
		if(list2 != null) {
			mv.addObject("list2", list2);
			if(boGroup2.equals("2")) {
				mv.setViewName("cashboard/oneBoardList"); 
			} else if(boGroup2.equals("3")) {
				mv.setViewName("cashboard/auctionBoardList"); 
			} else if(boGroup2.equals("4")) {
				mv.setViewName("cashboard/contestBoardList"); 
				
				
			}
				
		} else {
			throw new BoardException("자유게시판 조회에 실패하였습니다."); 
		}
		


		
		return mv;
	}
	
	
	// 1:1 조회 컨트롤러
	@RequestMapping("actionOneCateList.ch")
	@ResponseBody
	public ModelAndView actionOneCateList(@RequestParam(value="boGroup2", required=false) String boGroup2, @RequestParam(value="boCategory", required=false) String boCategory, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		

		
		System.out.println("boCategory 넘어온값은? : " + boCategory); //1:1게시판
		
		Board b = new Board(boGroup2, boCategory);
		
		
		int listCount2 = cBoardService.getCateListCount2(b);
		ArrayList<CBoard> list2 = cBoardService.selectCashOneCateList(b);


		System.out.println("list2" + list2);
		if(list2 != null) {
			mv.addObject("list2", list2);
			if(boGroup2.equals("2")) {
				mv.setViewName("cashboard/oneBoardList"); 
			} else if(boGroup2.equals("3")) {
				mv.setViewName("cashboard/auctionBoardList"); 
			} else if(boGroup2.equals("4")) {
				mv.setViewName("cashboard/contestBoardList"); 
				
				
			}
				
			System.out.println("boCategory현재 값은? : " + b.getBoCategory());
			System.out.println("list2 : " + list2 );
		} else {
			
			throw new BoardException("자유게시판 조회에 실패하였습니다."); 
		}
	
		return mv;
	}	
		
	
	
	@RequestMapping("oneView.ch")
		public String oneView() {
		return "cashboard/oneBoard/onBoardRequestView";
	}

	@RequestMapping("oneForm.ch")
	public String oneForm() {
		return "cashboard/oneBoard/onBoardRequestForm";
	}
	
	
	
	
	
	@RequestMapping("writeView.ch")
	public String cBoardInsertView(@RequestParam("boardType") int boardType, Model model) {
		model.addAttribute("boardType", boardType);
		return "cashboard/cBoardWrite";
	}
	
	@RequestMapping("insert.ch")
	public String cBoardInsert(@ModelAttribute CBoard b, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());
		
		if(b.getCbDate() == null) {
			b.setCbDate("0");
		}
		
		int result = cBoardService.cBoardInsert(b);
		
		if(result != 0) {
			// 나중에 경로 수정
			return "cashboard/cBoardWrite";
		} else {
			throw new CBoardException("캐쉬게시글 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("detailView.ch")
	public ModelAndView cBoardDetailView(@RequestParam("boNum") int boNum, ModelAndView mv) {
		
		CBoard b = cBoardService.cBoardDetailView(boNum);
		
		if(b != null) {
			mv.addObject("cBoard", b);
			switch(b.getCbStep()) {
				case 1: 
					ArrayList<Request> list = cBoardService.reqList(boNum);
					mv.addObject("list", list);
					mv.setViewName("cashboard/1stage");
					break;
				case 2: mv.setViewName("cashboard/2stage"); break;
				case 3: mv.setViewName("cashboard/3stage"); break;
			}
		} else {
			throw new BoardException("게시글 상세 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("reqList.ch")
	public void reqList(@RequestParam("bId") int bId, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Request> list = cBoardService.reqList(bId);
		
		JSONArray jArr = new JSONArray();
		for(Request req: list) {
			JSONObject jUser = new JSONObject();
			jUser.put("reNum", req.getReNum());
			jUser.put("reId", req.getReId());
			jUser.put("reCash", req.getReCash());
			jUser.put("rePlz", req.getRePlz());
			jUser.put("reRefNum", req.getReRefNum());
			jUser.put("reDate", req.getReDate());
			
			jArr.add(jUser);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jArr);
		
		try {
			PrintWriter out = response.getWriter();
			out.println(sendJson);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("doRequest.ch")
	public void doRequest(@ModelAttribute Request r, HttpServletResponse response) {
		int result = cBoardService.doRequest(r);
		
		try {
			PrintWriter out = response.getWriter();
			
			if(result > 0) {
				out.append("ok");
				out.flush();
			} else {
				out.append("fail");
				out.flush();
			}
			
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("cancleRequest.ch")
	public void cancleRequest(@ModelAttribute Request r, HttpServletResponse response) {
		int result = cBoardService.cancleRequest(r);
		
		try {
			PrintWriter out = response.getWriter();
			
			if(result > 0) {
				out.append("ok");
				out.flush();
			} else {
				out.append("fail");
				out.flush();
			}
			
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("go2stage.ch")
	public String go2stage(@ModelAttribute Request r) {
		int result = cBoardService.go2stage(r);
		
		if(result != 0) {
			return "redirect:detailView.ch?boNum=" + r.getReNum();
		} else {
			throw new CBoardException("에디터 선택에 실패하였습니다.");
		}
	}
	
	@RequestMapping("stage1.ch")
	public String stage1() {
		return "cashboard/1stage";
	}
	
	@RequestMapping("stage2.ch")
	public String stage2() {
		return "cashboard/2stage";
	}
	
	@RequestMapping("stage3.ch")
	public String stage3() {
		return "cashboard/3stage";
	}
	
}