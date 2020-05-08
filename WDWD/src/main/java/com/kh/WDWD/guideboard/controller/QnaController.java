package com.kh.WDWD.guideboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.guideboard.model.exception.QnaException;
import com.kh.WDWD.guideboard.model.service.QnaService;
import com.kh.WDWD.guideboard.model.vo.PageInfo;
import com.kh.WDWD.guideboard.model.vo.Qna;
import com.kh.WDWD.member.model.service.MemberService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qService;
	

	//메인 홈페이지 가이드 클릭시 guidemain으로 이동
	@RequestMapping("qnalist.guide")
	public String goguideview() {
		return "guide/guidemain";
	}
	
	//리스트 불러오는것
	@RequestMapping("qlist.guide")
	public ModelAndView qnaList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		int listCount = qService.getListCount();

		PageInfo pi = Pagination.Pagination(currentPage, listCount);

		ArrayList<Qna> list = qService.selectList(pi);


		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("qnalistView");
		} else {
			throw new QnaException("게시글 전체 조회에 실패하셨습니다.");
		}

		return mv;

		}

		@RequestMapping("qinsertView.guide")
		public String QnaInsertView() {
			return "qnawriting";

		}

		@RequestMapping("qinsert.guide")
		public ModelAndView QnaInsert(@ModelAttribute Qna q, HttpServletRequest request, ModelAndView mv) {

			int result = qService.insertQna(q);

			if(result >  0) {

				mv.addObject("page", 2);
				mv.setViewName("redirect:qlist.guide");
				return mv;

			} else {
				throw new QnaException("게시글 등록에 실패 하셨습니다");
			}
		}

	@RequestMapping("qdetail.guide")
	public ModelAndView QnaDetailView(@RequestParam("bno") int bno, @RequestParam("page") int page, ModelAndView mv) {

		Qna qna = qService.detailQna(bno);

		mv.addObject("qnaboard", qna)
		  .addObject("page", page)
		  .setViewName("qnaUpdate");

		return mv;

	}

	@RequestMapping("qupdate.guide")
	public ModelAndView qnaUpdate(@ModelAttribute Qna b, @RequestParam("page")int page, HttpServletRequest request, ModelAndView mv) {

		int result = qService.updateQna(b);
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:qdetial.guide?bno=" + b.getBoNum());
		}else {
			throw new QnaException("게시글 수정에 실패하셨습니다");

		}
		return mv;
	}

	@RequestMapping("qdelete.guide")
	public ModelAndView QnaDelete(@RequestParam("bno")int bno, HttpServletRequest request, ModelAndView mv) {
		int result = qService.deleteQna(bno);

		if(result > 0 ) {
			mv.setViewName("redirect:qlist.guide");
		}else {
			throw new QnaException("게시글 삭제에 실패하셨습니다");
		}

		return mv;
	}
} 