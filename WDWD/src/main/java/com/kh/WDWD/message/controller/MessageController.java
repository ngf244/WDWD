package com.kh.WDWD.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.message.model.service.MessageService;
import com.kh.WDWD.message.model.vo.Message;

@Controller
public class MessageController {
	@Autowired
	private MessageService MessageService;
	
	@RequestMapping("messageList.ms")
	public ModelAndView messageSend(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, HttpServletRequest request) {
		
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		
		System.out.println("loginUser : " + loginUser);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		
		//쪽지 개수
		int listCount = MessageService.getListCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		System.out.println("messageList Count: " + listCount);
		ArrayList<Message> list = MessageService.selectMessageList(loginUser, pi);
		
		if (list != null) {

			System.out.println("messageList : " + list);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("message/messageList");
		} else {

			throw new BoardException("쪽지함 조회에 실패하였습니다.");
		}

		
		return mv;
	}
	
	@RequestMapping("deleteM.ms")
	public void deleteMessage(@RequestParam(value="checkArr") Integer[] checkArr) {
		System.out.println("삭제할 리스트 번호 : " + checkArr);
		for(int i = 0; i < checkArr.length; i++) {
			
		}
	}
		
	
}
