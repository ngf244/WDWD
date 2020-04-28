package com.kh.WDWD.guideboard.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.guideboard.model.exception.GuideException;
import com.kh.WDWD.guideboard.model.service.GuideService;
import com.kh.WDWD.guideboard.model.vo.Guideboard;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;
	
	
	// 메인헤더 에서 가이드 클릭시 넘어가기
	@RequestMapping("guide.guide")
	public String guideinsertView() {
		return "/guide/guidemain";
		
	}
	
	// QnA 리스트 부분
	@RequestMapping("glist.guide")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
	// 페이징 처리 부분
		int currentPage = 1;
			if(page !=null) {
				currentPage = page;
				
			}
			
			int listCount = gService.getListCount();
			
			PageInfo gi = Pagination.getPageInfo(currentPage, listCount, "6");
			
			ArrayList<Board> list = gService.selectList(gi);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("gi", gi);
				mv.setViewName("guiderboardlist");
			}else {
				throw new GuideException("게시글 조회 실패하셨습니다");
			}
			
			return mv;
		
	}
	
	
	// Qna 게시글 보는 부분
	@RequestMapping("ginsertView.guide")
	public String guideInsertView() {
		return "guideboardInsert";
	}
	
	// QnA 게시글 등록
	@RequestMapping("gwrite.guide")
	public String boardInsert(@ModelAttribute Guideboard g, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {

		
		int result = gService.insertBoard(g);

		if(result > 0 ) {
			return "redirect:glist.guide";
		}else {
			throw new GuideException("게시글 등록에 실패하였습니다");
		}

	}

	
	// 게시글 조회
	@RequestMapping("gdetail.guide")
	public ModelAndView boardDetail(@RequestParam("bno") int bno, @RequestParam("page")int page, ModelAndView mv) {

	Board board = gService.selectBoard(bno);

	if(board != null) {
		mv.addObject("board", board);
		mv.addObject("page", page);
		mv.setViewName("boardDetailView");
	}else {
		throw new GuideException("게시글 전체 조회에 실패하였습니다.");
	}
	return mv;

	}

	// 게시글 View
	@RequestMapping("gView.guide")
	public ModelAndView boardUpdateView(@RequestParam("bno") int bno, @RequestParam("page") int page, ModelAndView mv) {

	Board board = gService.selectBoard(bno);

	mv.addObject("board", board)
	.addObject("page", page)
	.setViewName("boardUpdateForm");

	return mv;
	
	}
	

	// Qna update 수정
	@RequestMapping("gupdate.guide")
	public ModelAndView boardUpdate(@ModelAttribute Guideboard g, @RequestParam("reloadFile") MultipartFile reloadFile,
			@RequestParam("page") int page, HttpServletRequest request, ModelAndView mv){
			
		int result = gService.updateBoard(g);
		
		if(result > 0) {
			mv.addObject("page", page)
			  .setViewName("redirect:gdetail.guide?bno=" + g.getBno());
		} else {
			throw new GuideException("게시글 등록을 실패하셨읍니다.");
		}
		
		return mv;
	
		
	}
	
	// 가이드에서 이미지 클릭시 QnA게시판으로 이동
	@RequestMapping("guidelist.guide")
	public String goguidelist() {
		return "guide/guideboardlist";
	}
}


