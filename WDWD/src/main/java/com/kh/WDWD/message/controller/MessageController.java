package com.kh.WDWD.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.message.model.exception.MessageException;
import com.kh.WDWD.message.model.service.MessageService;
import com.kh.WDWD.message.model.vo.Message;

@Controller
public class MessageController {
	@Autowired
	private MessageService MessageService;
	
	@RequestMapping("messageList.ms")
	public ModelAndView messageSend(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value = "messageCate", required = false) String messageCate, 
									@RequestParam(value = "keyword", required = false) String keyword) {
		
		
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		
		HashMap searchMap = new HashMap(); 
		searchMap.put("loginUser", loginUser);
		searchMap.put("messageCate", messageCate);
		searchMap.put("keyword", keyword);
		
		
		
		System.out.println("messageCate : " + messageCate);
		System.out.println("keyword : " + keyword);
			System.out.println("loginUser : " + loginUser);
			
			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}
			
			
			//쪽지 개수
			int listCount = MessageService.getListCount(searchMap);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	
			System.out.println("messageList Count: " + listCount);
			ArrayList<Message> list = MessageService.selectMessageList(searchMap, pi);
			
			if (list != null) {
	
				System.out.println("messageList : " + list);
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("message/messageList");
			} else {
	
				throw new MessageException("쪽지함 조회에 실패하였습니다.");
			}
		
		return mv;
	}
	
	
	
	
	@RequestMapping("messageSendList.ms")
	public ModelAndView messageSendList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, 
										HttpServletResponse response, HttpServletRequest request,
										@RequestParam(value = "messageCate", required = false) String messageCate, 
										@RequestParam(value = "keyword", required = false) String keyword) {
		
		
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		
		HashMap searchMap = new HashMap(); 
		searchMap.put("loginUser", loginUser);
		searchMap.put("messageCate", messageCate);
		searchMap.put("keyword", keyword);
		
		
		
		System.out.println("messageCate : " + messageCate);
		System.out.println("keyword : " + keyword);
			System.out.println("loginUser : " + loginUser);
			
			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}
			
			
			//쪽지 개수
			int listCount = MessageService.getSendListCount(searchMap);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			PrintWriter out;
			System.out.println("messageList Count: " + listCount);
			ArrayList<Message> list = MessageService.selectSendMessageList(searchMap, pi);
			
			if (list != null) {
				//System.out.println("messageList : " + list);
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("message/messageSendList");
			} else if(list.isEmpty()) {
				
				mv.addObject("message", "검색 결과가 없습니다.");

			}
		
		return mv;
	}
	

	@RequestMapping("deleteMessages.ms")
	public void deleteMessages(@RequestParam(value="checkArr") String[] checkArr, HttpServletResponse response, HttpServletRequest request) {
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		System.out.println("삭제할 리스트 번호 : " + checkArr);
		int[] checkArrs = new int[checkArr.length];
		for(int i = 0; i < checkArr.length; i++) {
			checkArrs[i] = Integer.parseInt(checkArr[i]); 
		}
		
		int result = MessageService.deleteMessages(checkArr);
		System.out.println("쪽지삭제 result " + result);		
		try {
			new Gson().toJson(result, response.getWriter());

		} catch (JsonIOException | IOException e) {
			throw new MessageException("쪽지 실패");
		}
	}
	
	@RequestMapping("deleteSendMessages.ms")
	public void deleteSendMessages(@RequestParam(value="checkArr") String[] checkArr, HttpServletResponse response, HttpServletRequest request) {
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		System.out.println("삭제할 리스트 번호 : " + checkArr);
		int[] checkArrs = new int[checkArr.length];
		for(int i = 0; i < checkArr.length; i++) {
			checkArrs[i] = Integer.parseInt(checkArr[i]); 
		}
		
		int result = MessageService.deleteSendMessages(checkArr);
		System.out.println("쪽지삭제 result " + result);		
		System.out.println("쪽지삭제 result " + checkArrs);		
		try {
			new Gson().toJson(result, response.getWriter());

		} catch (JsonIOException | IOException e) {
			throw new MessageException("쪽지 실패");
		}
	}

	
	@RequestMapping("messageDetail.ms")
	public ModelAndView messageDetail(@RequestParam(value = "msgNum", required = false) int msgNum ,ModelAndView mv, HttpServletRequest request) {
		
		
		System.out.println("넘어온 쪽지 번호 : " + msgNum);
		
		
		ArrayList<Message> ms = MessageService.getMessageDetail(msgNum);

		Message message = new Message();
			
		if (ms != null) {

			System.out.println("messageDeatil은?? : " + ms);
			mv.addObject("ms", ms);
			mv.addObject("message", message);
			mv.setViewName("message/messageDetail");
			return mv;
		} else {

			throw new MessageException("쪽지 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("messageSendDetail.ms")
	public ModelAndView messageSendDetail(@RequestParam(value = "msgNum", required = false) int msgNum ,ModelAndView mv, HttpServletRequest request) {
		
		
		System.out.println("넘어온 쪽지 번호 : " + msgNum);
		
		
		ArrayList<Message> ms = MessageService.getMessageSendDetail(msgNum);

		Message message = new Message();
			
		if (ms != null) {

			System.out.println("messageDeatil은?? : " + ms);
			mv.addObject("ms", ms);
			mv.addObject("message", message);
			mv.setViewName("message/messageSendDetail");
			return mv;
		} else {

			throw new MessageException("쪽지 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("messageSendView.ms")
	public String messageSendView(@RequestParam("rsgId") String rsgId, @RequestParam("rsgNick") String rsgNick, Model model) {
		model.addAttribute("rsgId", rsgId);
		model.addAttribute("rsgNick", rsgNick);
		
		System.out.println("받는 사람 id : " + rsgId); 
		System.out.println("받는 사람 nick: " + rsgNick); 
		return "message/messageSendForm";
    }
	
	
	@RequestMapping("messageSend.ms")
	public void messageSend(HttpServletResponse response, HttpServletRequest request,
							@RequestParam("msRsgId") String msRsgId, 
							@RequestParam("msTitle") String msTitle, 
							@RequestParam("msContent") String msContent) {
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		
		HashMap sendMap = new HashMap(); 
		sendMap.put("loginUser", loginUser);
		sendMap.put("rsgId", msRsgId);
		sendMap.put("title", msTitle);
		sendMap.put("content", msContent);
		
		System.out.println("쪽지 보내는 사람 : " + loginUser);
		System.out.println("쪽지 받는 사람 : " + msRsgId);
		System.out.println("쪽지 제목 : " + msTitle);
		System.out.println("쪽지 내용 : " + msContent);
		
		int result = MessageService.insertSendMessages(sendMap);
		System.out.println("쪽지 성공 :  " + result);		
		
		try {
			new Gson().toJson(result, response.getWriter());

		} catch (JsonIOException | IOException e) {
			throw new MessageException("쪽지 전송 실패");
		}
	}
		
	@RequestMapping("reSendMessage.ms")
	public ModelAndView reSendMessage(@RequestParam(value = "msgNum", required = false) int msgNum, ModelAndView mv, HttpServletRequest request) {
		System.out.println("답장 넘어온 쪽지 번호 : " + msgNum);
		ArrayList<Message> ms = MessageService.getMessageDetail(msgNum);
		Message message = new Message();
		if (ms != null) {
			System.out.println("messageDeatil은?? : " + ms);
			mv.addObject("ms", ms);
			mv.addObject("message", message);
			mv.setViewName("message/messageReSendForm");
			return mv;
		} else {

			throw new MessageException("쪽지 조회에 실패하였습니다.");
		}
    }
	
	@RequestMapping("messageListAlert.ms")
	public void messageListAlert(HttpServletRequest request){
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String loginUser = m.getUserId();
		System.out.println("누구의 id인가요?" + m);
		int listCount = MessageService.getMessageListCount(loginUser);
		
		System.out.println("누구의 listCount인가요?" + listCount);
	}
	
}
