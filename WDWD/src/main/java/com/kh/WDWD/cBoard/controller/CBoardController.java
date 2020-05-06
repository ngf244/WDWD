package com.kh.WDWD.cBoard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.WDWD.author.model.vo.Dispute;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.cBoard.model.exception.BoardException;
import com.kh.WDWD.cBoard.model.exception.CBoardException;
import com.kh.WDWD.cBoard.model.service.CBoardService;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cBoard.model.vo.Chat;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.service.MemberService;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.request.model.vo.Request;

@Controller
public class CBoardController {

	@Autowired
	private CBoardService cBoardService;
	
	@Autowired
	private MemberService mService;

	@RequestMapping("reqList.my")
	public ModelAndView reqListView(@ModelAttribute CBoard cboard,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = cBoardService.getMyReqListCount(cboard);
		PageInfo pi = Pagination.getReqWorkListPageInfo(currentPage, listCount);

		ArrayList<CBoard> list = cBoardService.selectMyReqList(pi, cboard);
		for(CBoard cb : list) {
			String thumbnail = cBoardService.selectThumbnail(cb.getBoNum());
			cb.setThumbnail(thumbnail);
		}
		
		System.out.println("reqList : " + list);
		
		if (list != null) {
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .addObject("cboard", cboard);

			switch (cboard.getCbStep()) {
			case 1:
				mv.setViewName("requestOneStepList");
				break;
			case 2:
				mv.setViewName("requestTwoStepList");
				break;
			case 3:
				mv.setViewName("requestThreeStepList");
				break;
			}

		} else {
			throw new BoardException("내 의뢰 리스트 조회에 실패하였습니다.");
		}

		return mv;
	}

	// 자유게시판 조회 컨트롤러
	@RequestMapping("actionList.ch")
	public ModelAndView actionList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
									@RequestParam(value = "searchCate", required = false) String searchCate,
									@RequestParam(value = "searchWord", required = false) String searchWord,
									@RequestParam(value = "boCategory", required = false) String boCategory,
									@ModelAttribute CBoard cBoard) {
		
		String boGroup1 = "1";
		
		System.out.println("boCate??? " + boCategory);
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("boCategory", boCategory);
		searchMap.put("searchCate", searchCate);
		searchMap.put("searchWord", searchWord);
			
		// 자유게시판 페이징
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = cBoardService.getListCount(searchMap);
		int listCount2 = cBoardService.getListCount2(cBoard);

		// 자유게시판 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo piCash = Pagination.getCashBoardEternalPageInfo(currentPage, listCount2);

		ArrayList<CBoard> list = cBoardService.selectBoardList(searchMap, pi);
		//System.out.println("list에 searchCate, word담기니?" + list);
		//System.out.println("list에 searchWord, word담기니?" + list);
		CBoard CBoard = new CBoard();
		CBoard.setBoGroup("2");
		ArrayList<CBoard> list2 = cBoardService.selectCashOneList(CBoard, piCash);

		if (list != null) {

			mv.addObject("list", list);
			mv.addObject("boCategory", boCategory);
			mv.addObject("searchCate", searchCate);
			mv.addObject("searchWord", searchWord);
			System.out.println("searchCate 이거 뭐니??" + searchCate);
			System.out.println("searchWord 이거 뭐니??" + searchWord);
			mv.addObject("list2", list2);
			mv.addObject("pi", pi);
			System.out.println("piCash : " + piCash);
			mv.addObject("piCash", piCash);
			mv.setViewName("board/boardlist");
		} else {

			throw new BoardException("자유게시판 조회에 실패하였습니다.");
		}

		return mv;
	}

	// 1:1 조회 컨트롤러
//	@RequestMapping("actionOneList.ch")
//	public ModelAndView actionOneList(@ModelAttribute CBoard cBoard,  HttpServletResponse response, ModelAndView mv) {
//
//		System.out.println("boGroup2 : " + cBoard.getBoGroup()); //1:1게시판
////		System.out.println("boCategory : " + boCategory); //1:1게시판
//
////		System.out.println("리스트 갯수 : " + listCount2);
//		
//		ArrayList<CBoard> list2 = cBoardService.selectCashOneList(cBoard);
//
////		System.out.println("ArrayList size : " + list2.size());
//		System.out.println("list2 print : " + list2);
//		response.setContentType("application/json; charset=UTF-8");
//			try {
//				new Gson().toJson(list2, response.getWriter());
//				mv.addObject("list2", list2);
//				mv.setViewName("../cashboard/oneBoardList");
//				return mv;
//			} catch (JsonIOException | IOException e) {
//				throw new BoardException("리스트 가져오기 실패");
//			}
//		}


	// 1:1 조회 컨트롤러
	@RequestMapping("actionCateList.ch")
	public void actionCateList(@ModelAttribute CBoard cBoard, @RequestParam(value="searchText", required = false) String searchText,
			@RequestParam(value="searchCate", required = false) String searchCate, @RequestParam(value = "page", required = false) Integer page, HttpServletResponse response) {

		System.out.println("boGroup 넘어온값은? : " + cBoard.getBoGroup()); // 1:1게시판
		System.out.println("cbStep 넘어온값은? : " + cBoard.getCbStep()); // 1:1게시판
		System.out.println("boCategory 넘어온값은? : " + cBoard.getBoCategory()); // 1:1게시판
		System.out.println("검색 기능은? " + searchText);
		System.out.println("검색 기능은??? " + searchCate);
		System.out.println();
		
		String boGroup = cBoard.getBoGroup();
		int cbStep = cBoard.getCbStep();
		String boCategory = cBoard.getBoCategory();
		
		HashMap searchMap = new HashMap();  
		searchMap.put("cBoard", cBoard);
		searchMap.put("searchCate", searchCate);
		searchMap.put("searchText", searchText);
		
		
		int listCount2 = cBoardService.getCateListCount2(searchMap);
		System.out.println("listCount2 : " + listCount2);
		//CashBoard 무한 페이징
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		PageInfo piCash = Pagination.getCashBoardEternalPageInfo(currentPage, listCount2);

		
		ArrayList<CBoard> list2 = cBoardService.selectCashOneCateList(searchMap, piCash);
		
		System.out.println("list2 : " + list2);
		System.out.println("piCash : " + piCash);

		//int listCount2 = cBoardService.getCateListCount2(cBoard, searchCate, searchText);
		//ArrayList<CBoard> list2 = cBoardService.selectCashOneCateList(cBoard, searchCate, searchText);

		//System.out.println("list2" + list2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list2", list2);
		map.put("piCash", piCash);

		response.setContentType("application/json; charset=UTF-8");
		try {
			new Gson().toJson(map, response.getWriter());

		} catch (JsonIOException | IOException e) {
			throw new BoardException("리스트 가져오기 실패");
		}
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
	public String cBoardInsertView(@RequestParam("boardType") int boardType, @RequestParam(value = "reqId", required = false) String reqId, Model model) {
		model.addAttribute("boardType", boardType);
		model.addAttribute("reqId", reqId);
		return "cashboard/cBoardWrite";
	}

	@RequestMapping("insert.ch")
	public String cBoardInsert(@ModelAttribute CBoard b, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "reqId", required = false) String reqId,
			@RequestParam(value = "conUrl", required = false) String[] conUrl,
			@RequestParam(value = "conCop", required = false) String[] conCop,
			@RequestParam(value = "conOri", required = false) String[] conOri) {
		Member m = (Member) session.getAttribute("loginUser");
		b.setBoWriter(m.getUserId());
		b.setBoContent(b.getBoContent().replace("<img src=\"/WDWD/resources/photo_upload/",
				"<img src=\"/WDWD/resources/real_photo/"));

		if (b.getCbDate() == null) {
			b.setCbDate("0");
		}
		
		CBoard board = cBoardService.cBoardInsert(b);
		
		if(board.getBoGroup().equals("7")) {
			Request r = new Request(board.getBoNum(), reqId, board.getCbCash(), "N", 0, null, 0);
			cBoardService.directRequest(r);
		}
		
		if(!board.getBoGroup().equals("3")) {
			cBoardService.minusCash(board);
		}
		
		if(board != null) {
			if(conUrl != null) {
				ArrayList<Contents> contentArr = new ArrayList<Contents>();

				for (int i = 0; i < conUrl.length; i++) {
					Contents c = new Contents(conOri[i], conCop[i], conUrl[i], i);

					copyFile(c, request);
					int result = cBoardService.contentsInsert(c);
				}
			}
			return "redirect:detailView.ch?sysMsg=3&boNum=" + board.getBoNum();
		} else {
			throw new CBoardException("캐쉬게시글 작성에 실패하였습니다.");
		}
	}

	public void copyFile(Contents c, HttpServletRequest request) {
		File folder1 = new File(request.getSession().getServletContext().getRealPath("resources") + "\\photo_upload");
		File folder2 = new File(request.getSession().getServletContext().getRealPath("resources") + "\\real_photo");
		if (!folder2.exists()) {
			folder2.mkdirs();
		}

		try {
			FileInputStream fis = new FileInputStream(folder1.getAbsolutePath() + File.separator + c.getConCop());
			FileOutputStream fos = new FileOutputStream(folder2.getAbsolutePath() + File.separator + c.getConCop());

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("registWrite.ch")
	public String registWrite(@ModelAttribute Board b, HttpSession session, HttpServletRequest request, @RequestParam("updateCheck") int updateCheck, @RequestParam("boardNum") int boardNum,
			@RequestParam(value="conUrl", required=false) String[] conUrl, @RequestParam(value="conCop", required=false) String[] conCop, @RequestParam(value="conOri", required=false) String[] conOri) {
		Member m = (Member)session.getAttribute("loginUser");

		b.setBoWriter(m.getUserId());
		b.setBoContent(b.getBoContent().replace("<img src=\"/WDWD/resources/photo_upload/",
				"<img src=\"/WDWD/resources/real_photo/"));
		
		Request r = new Request();
		r.setReNum(boardNum);
		r.setReRefNum(b.getBoNum());
		r.setReId(m.getUserId());

		int result = 0;
	
		if(updateCheck == 1) {
			result = cBoardService.registDelete(r);
		}
		result = cBoardService.registWrite(b, r);
		
		if(result != 0) {
			if(conUrl != null) {
				for(int i = 0; i < conUrl.length; i++) {
					Contents c = new Contents(conOri[i], conCop[i], conUrl[i], i);

					copyFile(c, request);
					result = cBoardService.contentsInsert(c);
				}
			}
			
			return "redirect:detailView.ch?sysMsg=3&boNum=" + boardNum;

		} else {
			throw new CBoardException("에디터 글 등록에 실패하였습니다.");
		}
	}

	@RequestMapping("detailView.ch")
	public ModelAndView cBoardDetailView(@RequestParam("boNum") int boNum, ModelAndView mv, HttpServletRequest request,
			HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			if(boNum != m.getRecent1()) {
				if(boNum != m.getRecent2()) {
					if(boNum == m.getRecent3()) {
						m.setRecent3(m.getRecent2());
					} else if(boNum == m.getRecent4()) {
						m.setRecent4(m.getRecent3());
						m.setRecent3(m.getRecent2());
					} else {
						m.setRecent5(m.getRecent4());
						m.setRecent4(m.getRecent3());
						m.setRecent3(m.getRecent2());
					}
				}
				m.setRecent2(m.getRecent1());
				m.setRecent1(boNum);
			}
			mService.recentlyBoard(m);
		}

		CBoard b = cBoardService.cBoardDetailView(boNum);
		ArrayList<Contents> fileList = cBoardService.fileList(boNum);
		
		if(b != null) {
			mv.addObject("cBoard", b);
			mv.addObject("fileList", fileList);
			
			if(b.getBoGroup().equals("7")) {
				String userNick = "";
				if(m != null) {
					userNick = m.getNickName();
				}
				
				Request r = cBoardService.directWho(b.getBoNum());
				
				if(userNick.equals(b.getBoWriter()) || m.getUserId().equals(r.getReId())) {
					mv.setViewName("cashboard/directRequest");
				} else {
					String url = (String)request.getHeader("REFERER");
					int urlNum = url.lastIndexOf("/");
					String urlName = url.substring(urlNum + 1);
					if(urlName.equals("")) {
						urlName = "index.home";
					}
					mv.addObject("sysMsg", "1");
					mv.setViewName("redirect:" + urlName);
				}
			} else if(b.getBoGroup().equals("4")) {
				ArrayList<Request> reqMList = cBoardService.reqList(boNum);
				ArrayList<CBoard> reqBList = cBoardService.reqBList(boNum);
				
				for(int i = 0; i < reqBList.size(); i++) {
					reqBList.get(i).setProfileImg(cBoardService.getProfileImg(reqBList.get(i).getBoWriter()));
				}
				
				mv.addObject("reqMList", reqMList);
				mv.addObject("reqBList", reqBList);
				
				if(b.getCbStep() != 3) {
					mv.setViewName("cashboard/contest_1stage");
					
					for(int i = 0; i < reqMList.size(); i++) {
						if(m != null) {
							if(reqMList.get(i).getReId().equals(m.getNickName())) {
								Request r = new Request();
								r.setReNum(boNum);
								r.setReId(m.getUserId());
								
								Board reqB = cBoardService.cBoardReqView(r);
								
								ArrayList<Contents> reqFileList = new ArrayList<>();
								if(reqB != null) {
									reqFileList = cBoardService.fileList(reqB.getBoNum());
								}
								
								mv.addObject("reqB", reqB);
								mv.addObject("reqFileList", reqFileList);
								mv.setViewName("cashboard/contest_2stage");
								break;
							}
						}
					}
				} else {
					ArrayList<Contents> reqFileList = cBoardService.fileListContest(boNum);
					mv.addObject("reqFileList", reqFileList);
					mv.setViewName("cashboard/contest_3stage");
				}
			} else {
				switch(b.getCbStep()) {
					case 1: 
						ArrayList<Request> list = cBoardService.reqList(boNum);
						mv.addObject("list", list);
						mv.setViewName("cashboard/1stage");
						break;
					case 2:
						String userNick = "";
						if(m != null) {
							userNick = m.getNickName();
						}
						
						if(userNick.equals(b.getBoWriter()) || userNick.equals(b.getReId()) || userNick.equals("운영자")) {
							Board reqB = cBoardService.cBoardReqView(boNum);
							ArrayList<Contents> reqFileList = new ArrayList<>();
							if(reqB != null) {
								reqFileList = cBoardService.fileList(reqB.getBoNum());
							}
							ArrayList<Chat> chatList = cBoardService.chatList(boNum);
							ArrayList<Dispute> dpList = cBoardService.dpList(boNum);
							
							mv.addObject("reqB", reqB);
							mv.addObject("reqFileList", reqFileList);
							mv.addObject("chatList", chatList);
							mv.addObject("dpList", dpList);
							mv.setViewName("cashboard/2stage");
						} else {
							String url = (String)request.getHeader("REFERER");
							int urlNum = url.lastIndexOf("/");
							String urlName = url.substring(urlNum + 1);
							if(urlName.equals("")) {
								urlName = "index.home";
							}
							mv.addObject("sysMsg", "1");
							mv.setViewName("redirect:" + urlName);
						}
						break;
					case 3: 
						Board reqB = cBoardService.cBoardReqView(boNum);
						ArrayList<Contents> reqFileList = new ArrayList<>();
						if(reqB != null) {
							reqFileList = cBoardService.fileList(reqB.getBoNum());
						}
						mv.addObject("reqB", reqB);
						mv.addObject("reqFileList", reqFileList);
						mv.setViewName("cashboard/3stage"); 
						break;
				}
			}
		} else {
			throw new BoardException("게시글 상세 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("checkTime.ch")
	public void checkTime(HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<CBoard> list = cBoardService.checkTime();
		
		JSONArray jArr = new JSONArray();
		for(CBoard b: list) {
			JSONObject jBoard = new JSONObject();
			jBoard.put("boNum", b.getBoNum());
			jBoard.put("cbDate", b.getCbDate());
			
			jArr.add(jBoard);
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
	
	@RequestMapping("timeOut.ch")
	public void timeOut(@RequestParam("boNum") int boNum, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		int result = cBoardService.timeOut(boNum);
		
	}
	
	@RequestMapping("doRequest.ch")
	public void doRequest(@ModelAttribute Request r, HttpServletResponse response) {
		int result = cBoardService.doRequest(r);

		try {
			PrintWriter out = response.getWriter();

			if (result > 0) {
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

			if (result > 0) {
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
	
	@RequestMapping("doReqContest.ch")
	public String doReqContest(@ModelAttribute Request r) {
		int result = cBoardService.doRequest(r);
		
		if(result > 0) {
			return "redirect:detailView.ch?sysMsg=4&boNum=" + r.getReNum();
		} else {
			throw new CBoardException("에디터 등록에 실패하였습니다.");
		}
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
	
	@RequestMapping("go2stage.ch")
	public String go2stage(@ModelAttribute Request r) {
		int result = cBoardService.go2stage(r);
		
		if(result != 0) {
			return "redirect:detailView.ch?sysMsg=2&boNum=" + r.getReNum();
		} else {
			throw new CBoardException("에디터 선택에 실패하였습니다.");
		}
	}
	
	@RequestMapping("change2stage.ch")
	public String change2stage(@RequestParam("boNum") int boNum) {
		int result = cBoardService.change2stage(boNum);
		
		if(result != 0) {
			return "redirect:detailView.ch?sysMsg=2&boNum=" + boNum;
		} else {
			throw new CBoardException("수락에 실패하였습니다.");
		}
	}
	
	@RequestMapping("directFalse.ch")
	public String directFalse(@RequestParam("boNum") int boNum) {
		int result = cBoardService.directFalse(boNum);
		
		if(result != 0) {
			return "redirect:detailView.ch?sysMsg=5&boNum=" + boNum;
		} else {
			throw new CBoardException("거절에 실패하였습니다.");
		}
	}
	
	@RequestMapping("go3stage.ch")
	public String go3stage(@RequestParam("boNum") int boNum) {
		int result = cBoardService.go3stage(boNum);
		
		if(result != 0) {
			return "redirect:detailView.ch?sysMsg=2&boNum=" + boNum;
		} else {
			throw new CBoardException("에디터 선택에 실패하였습니다.");
		}
	}
	
	@RequestMapping("go3stageContest.ch")
	public String go3stageContest(@ModelAttribute Request r) {
		int result = cBoardService.go3stageContest(r);
		
		if(result != 0) {
			return "redirect:detailView.ch?sysMsg=2&boNum=" + r.getReNum();
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
	
	@RequestMapping(value = "callmeId.ch")
	public void topList(@RequestParam("nickName") String nickName, HttpServletResponse response) {
		String userId = cBoardService.callmeId(nickName);
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(userId, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("goDispute.ch")
	public String goDispute(@ModelAttribute Dispute d) {
		int check = 0;
		int result = 0;
		
		if(d.getDiStatus() == 1 || d.getDiStatus() == 2) {
			ArrayList<Dispute> dpList = cBoardService.dpList(d.getDiRef());
			for(Dispute dp : dpList) {
				if(dp.getDiStatus() == 1 || dp.getDiStatus() == 2) {
					check = 1;
					break;
				}
			}
		}
		
		if(check == 0) {
			result = cBoardService.goDispute(d);
		} else {
			result = cBoardService.endDispute(d);
		}
		
		if(result > 0) {
			return "redirect:detailView.ch?boNum=" + d.getDiRef();
		} else {
			throw new CBoardException("게시글 문의에 실패하였습니다.");
		}
	}
	
	@RequestMapping("cancleDispute.ch")
	public String cancleDispute(@ModelAttribute Dispute d) {
		int result = cBoardService.cancleDispute(d);
		
		if(result > 0) {
			return "redirect:detailView.ch?boNum=" + d.getDiRef();
		} else {
			throw new CBoardException("게시글 문의취소에 실패하였습니다.");
		}
	}
	
  @RequestMapping("workList.my")
	public ModelAndView workListView(@ModelAttribute Request request, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = cBoardService.getMyWorkListCount(request);
		PageInfo pi = Pagination.getReqWorkListPageInfo(currentPage, listCount);

		ArrayList<Request> list = cBoardService.selectMyWorkList(pi, request);

		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).addObject("request", request);

			switch (request.getCbStep()) {
			case 1:
				mv.setViewName("workOneStepList");
				break;
			case 2:
				mv.setViewName("workTwoStepList");
				break;
			case 3:
				mv.setViewName("workThreeStepList");
				break;
			}

		} else {
			throw new BoardException("내 작업 리스트 조회에 실패하였습니다.");
		}

		return mv;
	}
  
  
  @RequestMapping("actionPremiumList.ch")
	public void actionPremiumList(HttpServletRequest request, HttpServletResponse response) {
	  	String boGroup = request.getParameter("boGroup");
	  	System.out.println("boGroup??" + boGroup);
		ArrayList<CBoard> list = cBoardService.actionPremiumList(boGroup);
		response.setContentType("application/json; charset=UTF-8");
		System.out.println("list는?" + list);
		try {
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			throw new BoardException("리스트 가져오기 실패");
		}
	}

}