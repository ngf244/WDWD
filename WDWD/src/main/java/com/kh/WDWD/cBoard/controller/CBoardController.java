package com.kh.WDWD.cBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.exception.CBoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.member.model.vo.Member;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cBoardService;
	
	@RequestMapping("reqOneList.my")
	public ModelAndView reqOneStepListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		
		mv.setViewName("requestOneStepList");
		
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
	public String cBoardInsertView(@RequestParam("boardType") int boardType, Model model) {
		model.addAttribute("boardType", boardType);
		return "cashboard/cBoardWrite";
	}
	
	@RequestMapping("insert.ch")
	public String cBoardInsert(@ModelAttribute CBoard b, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());
		
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
				case 1: mv.setViewName("cashboard/1stage"); break;
				case 2: mv.setViewName("cashboard/2stage"); break;
				case 3: mv.setViewName("cashboard/3stage"); break;
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
