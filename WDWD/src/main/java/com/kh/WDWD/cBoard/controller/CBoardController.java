package com.kh.WDWD.cBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.exception.CBoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.vo.Member;

@Controller
public class CBoardController {

	@Autowired
	private CBoardService cBoardService;

	@RequestMapping("reqOneList.my")
	public ModelAndView reqOneStepListView(@RequestParam("userId") String userId,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "boGroup", required = false) Integer boGroup, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = cBoardService.getMyReqOneStepListCount(userId);
		PageInfo pi = Pagination.getReqOneStepListPageInfo(currentPage, listCount);

		System.out.println("의뢰1단계리스트 개수 : " + listCount);
		ArrayList<CBoard> list = cBoardService.selectMyReqOneStepList(pi, userId);

		System.out.println("의뢰1단계리스트 toString : " + list);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).addObject("userId", userId)
					.setViewName("requestOneStepList");
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
		
		
	/*
	 * @RequestMapping("actionList.ch") public ModelAndView
	 * actionList(@RequestParam(value="boGroup1", required=false) String boGroup1,
	 * 
	 * @RequestParam("boGroup2") String boGroup2, @RequestParam("boGroup3") String
	 * boGroup3,@RequestParam("boGroup4") String
	 * boGroup4, @RequestParam(value="page", required=false) Integer
	 * page, @RequestParam(value="selectCate", required=false) String boCategory,
	 * ModelAndView mv) {
	 * 
	 * System.out.println("boGroup1은? " + boGroup1);
	 * System.out.println("boGroup2은? " + boGroup2);
	 * System.out.println("boCategory? " + boCategory);
	 * 
	 * System.out.println("boGroup3은? " + boGroup3);
	 * System.out.println("boGroup4은? " + boGroup4);
	 * 
	 * //System.out.println(boGroup2);
	 * 
	 * String boGroup2 = "2"; int currentPage = 1; if(page != null) { currentPage =
	 * page; System.out.println("currentPage : " + currentPage);
	 * System.out.println("page : " + page); } int listCount =
	 * cBoardService.getListCount(boGroup1); int listCount2 =
	 * cBoardService.getListCount2(boGroup2);
	 * 
	 * PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boGroup1);
	 * 
	 * Board b = new Board(boGroup2, boCategory);
	 * 
	 * 
	 * System.out.println("boGroup1 게시글 개수 : " + listCount);
	 * 
	 * ArrayList<CBoard> list = cBoardService.selectList(boGroup1, pi);
	 * ArrayList<CBoard> list2 = cBoardService.selectCashList(b); if(list != null &&
	 * list2 != null) { mv.addObject("list", list); mv.addObject("list2", list2);
	 * mv.addObject("b", b); mv.addObject("pi", pi);
	 * System.out.println("list 값 : "+list); System.out.println("list2 값 : "+list2);
	 * System.out.println("pi : " + pi); mv.setViewName("board/boardlist"); } else {
	 * throw new BoardException("자유게시판 조회에 실패하였습니다."); }
	 * 
	 * 
	 * 
	 * return mv;
	 * 
	 * 
	 * 
	 * 
	 * }
	 */

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
		Member m = (Member) session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());

		int result = cBoardService.cBoardInsert(b);

		if (result != 0) {
			// 나중에 경로 수정
			return "cashboard/cBoardWrite";
		} else {
			throw new CBoardException("캐쉬게시글 작성에 실패하였습니다.");
		}
	}

	@RequestMapping("detailView.ch")
	public ModelAndView cBoardDetailView(@RequestParam("boNum") int boNum, ModelAndView mv) {

		CBoard b = cBoardService.cBoardDetailView(boNum);

		if (b != null) {
			mv.addObject("cBoard", b);
			switch (b.getCbStep()) {
			case 1:
				mv.setViewName("cashboard/1stage");
				break;
			case 2:
				mv.setViewName("cashboard/2stage");
				break;
			case 3:
				mv.setViewName("cashboard/3stage");
				break;
			}
		} else {
			throw new BoardException("게시글 상세 조회에 실패하였습니다.");
		}

		return mv;
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