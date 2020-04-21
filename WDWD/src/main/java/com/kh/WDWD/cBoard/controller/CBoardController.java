package com.kh.WDWD.cBoard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.exception.CBoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cBoard.model.vo.Chat;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.request.model.vo.Request;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cBoardService;
	
	@RequestMapping("reqList.my")
	public ModelAndView reqListView(@ModelAttribute CBoard cboard, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cBoardService.getMyReqListCount(cboard);
		PageInfo pi = Pagination.getReqWorkListPageInfo(currentPage, listCount);		
		
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
			throw new BoardException("내 의뢰 리스트 조회에 실패하였습니다.");
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
	public ModelAndView actionOneList(@ModelAttribute CBoard cBoard, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		String boCategory = "";
		System.out.println("boGroup2 : " + cBoard.getBoGroup()); //1:1게시판
		System.out.println("boCategory : " + boCategory); //1:1게시판
		

		int listCount2 = cBoardService.getListCount2(cBoard);
		System.out.println("리스트 갯수 : " + listCount2);
		ArrayList<CBoard> list2 = cBoardService.selectCashOneList(cBoard);

		System.out.println("ArrayList size : " + list2.size());
		System.out.println("list2 print : " + list2);
		if(list2 != null) {
			mv.addObject("list2", list2);
			if(cBoard.getBoGroup().equals("2")) {
				mv.setViewName("cashboard/oneBoardList"); 
			} else if(cBoard.getBoGroup().equals("3")) {
				mv.setViewName("cashboard/auctionBoardList"); 
			} else if(cBoard.getBoGroup().equals("4")) {
				mv.setViewName("cashboard/contestBoardList"); 
			}
		} else {
			throw new BoardException("자유게시판 조회에 실패하였습니다."); 
		}
		return mv;
		
	}
	
	
	// 1:1 조회 컨트롤러
	@RequestMapping("actionCateList.ch")
	@ResponseBody
	public ModelAndView actionCateList(@ModelAttribute CBoard cBoard, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		

		System.out.println("boGroup 넘어온값은? : " + cBoard.getBoGroup()); //1:1게시판
		System.out.println("cbStep 넘어온값은? : " + cBoard.getCbStep()); //1:1게시판
		System.out.println("boCategory 넘어온값은? : " + cBoard.getBoCategory()); //1:1게시판
		
		String boGroup = cBoard.getBoGroup();
		int cbStep = cBoard.getCbStep();
		String boCategory = cBoard.getBoCategory();
		
		
		int listCount2 = cBoardService.getCateListCount2(cBoard);
		ArrayList<CBoard> list2 = cBoardService.selectCashOneCateList(cBoard);


		System.out.println("list2" + list2);
		if(list2 != null) {
			mv.addObject("list2", list2);
			if(boGroup.equals("2")) {

				mv.setViewName("cashboard/oneBoardList"); 
			} else if(boGroup.equals("3")) {
				mv.setViewName("cashboard/auctionBoardList"); 
			} else if(boGroup.equals("4")) {
				mv.setViewName("cashboard/contestBoardList"); 
			}
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
	public String cBoardInsert(@ModelAttribute CBoard b, HttpSession session, HttpServletRequest request, 
			@RequestParam(value="conUrl", required=false) String[] conUrl, @RequestParam(value="conCop", required=false) String[] conCop, @RequestParam(value="conOri", required=false) String[] conOri) {
		Member m = (Member)session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());
		b.setBoContent(b.getBoContent().replace("<img src=\"/WDWD/resources/photo_upload/", "<img src=\"/WDWD/resources/real_photo/"));
		
		if(b.getCbDate() == null) {
			b.setCbDate("0");
		}
		
		int result = cBoardService.cBoardInsert(b);
		
		if(result != 0) {
			if(conUrl != null) {
				ArrayList<Contents> contentArr = new ArrayList<Contents>();
				
				for(int i = 0; i < conUrl.length; i++) {
					Contents c = new Contents(conOri[i], conCop[i], conUrl[i], i);
					
					copyFile(c, request);
					result = cBoardService.contentsInsert(c);
				}
			}
			
			// 나중에 경로 수정
			return "cashboard/cBoardWrite";
		} else {
			throw new CBoardException("캐쉬게시글 작성에 실패하였습니다.");
		}
	}
	
	public void copyFile(Contents c, HttpServletRequest request) {
		File folder1 = new File(request.getSession().getServletContext().getRealPath("resources") + "\\photo_upload");
		File folder2 = new File(request.getSession().getServletContext().getRealPath("resources") + "\\real_photo");
		if(!folder2.exists()) {
			folder2.mkdirs();
		}
		
		try {
			FileInputStream fis = new FileInputStream(folder1.getAbsolutePath() + File.separator + c.getConCop());
			FileOutputStream fos = new FileOutputStream(folder2.getAbsolutePath() + File.separator + c.getConCop());

			int data = 0;
			while((data=fis.read())!=-1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("registWrite.ch")
	public String registWrite(@ModelAttribute Board b, HttpSession session, HttpServletRequest request, @RequestParam("updateCheck") int updateCheck,
			@RequestParam(value="conUrl", required=false) String[] conUrl, @RequestParam(value="conCop", required=false) String[] conCop, @RequestParam(value="conOri", required=false) String[] conOri) {
		Member m = (Member)session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());
		b.setBoContent(b.getBoContent().replace("<img src=\"/WDWD/resources/photo_upload/", "<img src=\"/WDWD/resources/real_photo/"));
		
		int result = 0;
		if(updateCheck == 1) {
			result = cBoardService.registDelete(b.getBoNum());
		}
		result = cBoardService.registWrite(b);
		
		if(result != 0) {
			if(conUrl != null) {
				ArrayList<Contents> contentArr = new ArrayList<Contents>();
				
				for(int i = 0; i < conUrl.length; i++) {
					Contents c = new Contents(conOri[i], conCop[i], conUrl[i], i);
					
					copyFile(c, request);
					result = cBoardService.contentsInsert(c);
				}
			}
			
			return "redirect:detailView.ch?boNum=" + b.getBoNum();
		} else {
			throw new CBoardException("에디터 글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("detailView.ch")
	public ModelAndView cBoardDetailView(@RequestParam("boNum") int boNum, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		CBoard b = cBoardService.cBoardDetailView(boNum);
		ArrayList<Contents> fileList = cBoardService.fileList(boNum);
		
		if(b != null) {
			switch(b.getCbStep()) {
				case 1: 
					ArrayList<Request> list = cBoardService.reqList(boNum);
					mv.addObject("list", list);
					mv.addObject("cBoard", b);
					mv.addObject("fileList", fileList);
					mv.setViewName("cashboard/1stage");
					break;
				case 2:
					String userNick = "";
					if(session.getAttribute("loginUser") != null) {
						Member m = (Member)session.getAttribute("loginUser");
						userNick = m.getNickName();
					}
					
					if(userNick.equals(b.getBoWriter()) || userNick.equals(b.getReId())) {
						Board reqB = cBoardService.cBoardReqView(boNum);
						ArrayList<Contents> reqFileList = new ArrayList<>();
						if(reqB != null) {
							reqFileList = cBoardService.fileList(reqB.getBoNum());
						}
						ArrayList<Chat> chatList = cBoardService.chatList(boNum);
						
						mv.addObject("reqB", reqB);
						mv.addObject("reqFileList", reqFileList);
						mv.addObject("chatList", chatList);
						mv.addObject("cBoard", b);
						mv.addObject("fileList", fileList);
						mv.setViewName("cashboard/2stage");
					} else {
						String url = (String)request.getHeader("REFERER");
						int urlNum = url.lastIndexOf("/");
						String urlName = url.substring(urlNum + 1);
						if(urlName.equals("")) {
							urlName = "index.me";
						}
						mv.addObject("error", "1");
						mv.setViewName("redirect:" + urlName);
					}
					break;
				case 3: 
					mv.addObject("cBoard", b);
					mv.addObject("fileList", fileList);
					mv.setViewName("cashboard/3stage"); 
					break;
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
	
	@ResponseBody
	@RequestMapping("sendChat.ch")
	public void sendChat(@ModelAttribute Chat c, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		Chat result = cBoardService.sendChat(c);
		
		JSONObject chat = new JSONObject();
		
		chat.put("chatNum", result.getChatRefNum());
		chat.put("chatCon", result.getChatCon());
		chat.put("chatDate", result.getChatDate());
		chat.put("chatWriter", result.getChatWriter());
		
		try {
			PrintWriter out = response.getWriter();
			out.println(chat);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
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
	
  @RequestMapping("workList.my")
	public ModelAndView workListView(@ModelAttribute Request request, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cBoardService.getMyWorkListCount(request);
		PageInfo pi = Pagination.getReqWorkListPageInfo(currentPage, listCount);		
		
		ArrayList<Request> list = cBoardService.selectMyWorkList(pi, request);		
		
		if(list != null) {
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .addObject("request", request);
			
			switch(request.getCbStep()) {
			case 1: mv.setViewName("workOneStepList"); break;
			case 2: mv.setViewName("workTwoStepList"); break;
			case 3: mv.setViewName("workThreeStepList"); break; 
			}
			
		} else {
			throw new BoardException("내 작업 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}

}