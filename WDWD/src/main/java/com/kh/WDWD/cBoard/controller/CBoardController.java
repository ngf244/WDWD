package com.kh.WDWD.cBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.common.Pagination;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cBoardService;
	
	@RequestMapping("reqOneList.my")
	public ModelAndView reqOneStepListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="boGroup", required=false) Integer boGroup, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cBoardService.getMyReqOneStepListCount(userId);
		PageInfo pi = Pagination.getReqOneStepListPageInfo(currentPage, listCount);		
		
		System.out.println("의뢰1단계리스트 개수 : " + listCount);
		ArrayList<CBoard> list = cBoardService.selectMyReqOneStepList(pi, userId);
		
		System.out.println("의뢰1단계리스트 toString : " + list);
		
		if(list != null) {
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .addObject("userId", userId)
			  .setViewName("requestOneStepList");
		} else {
			throw new BoardException("내 의뢰 1단계 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("actionList.ch")
	public ModelAndView actionList(@RequestParam("boGroup1") int boGroup1,
			/* @RequestParam("boGroup2") int boGroup2, */ ModelAndView mv) {
		/*
		 * System.out.println(group1); System.out.println(group2);
		 */
		
	   System.out.println(boGroup1);
       int listCount = cBoardService.getListCount(boGroup1);

       System.out.println("게시글 개수 : " + listCount);

       ArrayList<CBoard> list = cBoardService.selectList(boGroup1);
	       if(list != null) {
	           mv.addObject("list", list);
	           System.out.println("list 값 : "+list);
	           mv.setViewName("board/boardlist");
	        } else {
	           throw new BoardException("게시글 전체 조회에 실패하였습니다.");
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
