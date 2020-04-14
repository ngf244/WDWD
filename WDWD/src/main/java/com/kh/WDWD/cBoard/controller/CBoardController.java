package com.kh.WDWD.cBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.common.Pagination;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cBoardService;
	
	@RequestMapping("reqOneList.my")
	public ModelAndView reqOneStepListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		
		mv.setViewName("requestOneStepList");
		
		return mv;
	}
	
	
	
	
	//자유게시판 및 1:1 조회 컨트롤러
	@RequestMapping("actionList.ch")
	public ModelAndView actionList(@RequestParam(value="boGroup1", required=false) Integer boGroup,
			/* @RequestParam("boGroup2") int boGroup2, */ @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
	   System.out.println("boGroup1은? " + boGroup);
	   //System.out.println(boGroup2);
	   boGroup = 1;
       int currentPage = 1;
       if(page != null) {
         currentPage = page;
         System.out.println("currentPage : " + currentPage);
         System.out.println("page : " + page);
       }
       int listCount = cBoardService.getListCount(boGroup);
      
       PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boGroup);   
	   

       System.out.println("boGroup1 게시글 개수 : " + listCount);
       
       ArrayList<CBoard> list = cBoardService.selectList(boGroup, pi);
	       if(list != null) {
	    	   Board b = new Board();
	    	   
	           mv.addObject("list", list);
	           mv.addObject("pi", pi);
	           System.out.println("list 값 : "+list);
	           System.out.println("pi : " + pi);
	           mv.setViewName("board/boardlist");
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
	public String cBoardInsertView() {
		return "cashboard/cBoardWrite";
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
