package com.kh.WDWD.guideboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.guideboard.model.service.GuideService;
import com.kh.WDWD.guideboard.model.vo.Guideboard;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;

	// 게시글 목록
	@RequestMapping("list.guide")
	public ModelAndView list() {
		List<Guideboard> list = gService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("list", list);
		return mav;
	}

	// 게시글 작성화면
	@RequestMapping(value="writeview.guide", method=RequestMethod.GET)
	public String write() {
		return "board/write";
	}


	// 게시글 작성처리
	@RequestMapping(value="write.guide", method=RequestMethod.GET)
	public String insert(@ModelAttribute Guideboard vo) {
		gService.create(vo);
		return "redirect:list.guide";
	}


	@RequestMapping(value="view.guide", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) {

		// 요것은 조회수 증가 처리
		gService.increaseViewcnt(bno, session);

		// 모델(데이터) + 뷰 (화면) 전달하는 객체
		ModelAndView mav = new ModelAndView();

		// 뷰의 이름
		mav.setViewName("board/view");

		// 뷰에 전달할 데이터
		mav.addObject("dto", gService.read(bno));

		return mav;

	}


	// 게시글 수정

	@RequestMapping(value="update.guide", method=RequestMethod.POST)
	public String update(@ModelAttribute Guideboard vo) {
		gService.update(vo);
		return "redirect:list.guide";
	}


	// 게시글 삭제
	@RequestMapping("delect.guide")
	public String delete(@RequestParam int bno) {
		gService.delete(bno);
		return "redirect:list.guide";

	}
}

