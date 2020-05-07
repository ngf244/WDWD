package com.kh.WDWD.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.WDWD.board.model.exception.BoardException;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.board.model.vo.Scrap;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.kakaoAPI.model.service.KakaoAPI;
import com.kh.WDWD.member.model.exception.MemberException;
import com.kh.WDWD.member.model.service.MemberService;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;
import com.kh.WDWD.request.model.vo.Request;


@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private KakaoAPI kakao;
	
	@RequestMapping(value="login.me",method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
		System.out.println(m);
		
		Member loginUser = mService.loginMember(m);
		
		System.out.println(loginUser);

		if(loginUser != null) {
			// 로그인 성공 시 세션에 정보를 담아야 하기 때문에 세션이 필요
			model.addAttribute("loginUser", loginUser);
			return "redirect:/index.home";
		}else {
			model.addAttribute("msg","로그인 실패하셨습니다!");
			return "common/errorPage";
		}
	}

	// 로그아웃 컨트롤
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:index.home";
	}
	
	@RequestMapping("main.my")
	public ModelAndView myPageView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		Member member = mService.selectMember(userId);
		ArrayList<Reply> rList = mService.selectRecentlyReply(userId);		
		ArrayList<Board> pList = mService.selectRecentlyPBoard(userId);
		ArrayList<CBoard> cList = mService.selectRecentlyCBoard(userId);
		ArrayList<Scrap> scList = mService.selectRecentlyScrap(userId);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyPagePortCount(userId);
		PageInfo pi = Pagination.getMypageMainPortListPageInfo(currentPage, listCount);
		
		ArrayList<PortpolioContents> pcList = mService.selectMyPagePortList(pi, userId);
		
		for(PortpolioContents pc : pcList) {
			ArrayList<PortpolioReply> portReply = mService.selectPoReply(pc.getPoNum());
			pc.setPortReply(portReply);
			
			ArrayList<PortpolioContents> portContents = mService.selectAttachFile(pc.getPoNum());
			pc.setPortContents(portContents);
		}
		
		ArrayList<PointNCash> ccList = mService.selectRecentlyCashChange(userId);		
		
		int rCount1 = mService.selectReqOneStepCount(userId);
		int rCount2 = mService.selectReqTwoStepCount(userId);
		int rCount3 = mService.selectReqThreeStepCount(userId);
		int WCount1 = mService.selectWorkOneStepCount(userId);
		int WCount2 = mService.selectWorkTwoStepCount(userId);	
		int WCount3 = mService.selectWorkThreeStepCount(userId);
		
		int[] rwCount = {rCount1, rCount2, rCount3, WCount1, WCount2, WCount3};
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.");
				
		Calendar time = Calendar.getInstance();
		       
		String nowDay = format.format(time.getTime());
		
		if(member != null) {
			mv.addObject("member", member)
			  .addObject("rList", rList)
			  .addObject("rwCount", rwCount)
			  .addObject("pList", pList)
			  .addObject("cList", cList)
			  .addObject("scList", scList)
			  .addObject("pi", pi)
			  .addObject("pcList", pcList)
			  .addObject("nowDay", nowDay)
			  .addObject("ccList", ccList)
			  .setViewName("mypageMain");
			
		} else {
			throw new MemberException("마이페이지 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("directReq.my")
	public String directRequestForm() {
		return "directRequestForm";
	}
	
	// 회원가입  controller
	@RequestMapping("signUp.me")
	public String memberInsert(@ModelAttribute Member m) {
		
//		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encPwd);
		
//		System.out.print(m);
		
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:index.home";
		}else {
			throw new MemberException("회원가입에 실패하셨습니다.");
		}
	}
	
	@RequestMapping(value="uProfileImg.my", method=RequestMethod.POST)
	public @ResponseBody void updateProfileImage(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartFile profileImgFile = request.getFile("profileImg");
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		String renameFileName = "";
		
		if(profileImgFile != null && !profileImgFile.isEmpty()) {
			renameFileName = saveFile(profileImgFile, request);
		}
		
		if(!renameFileName.equals("")&&!renameFileName.isEmpty()) {
			int result = mService.updateProfileImg(m);
			
			if(result > 0) {
				response.setContentType("application/json; charset=UTF-8");
				new Gson().toJson(renameFileName, response.getWriter());
			} else {
				throw new MemberException("프로필 이미지 변경에 실패하셨습니다.");
			}
		}
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
	  
		String savePath = root + "/profile_Image";
		
		File folder = new File(savePath);
  
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		int ranNum = (int)(Math.random() * 100000);
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    String originFileName = file.getOriginalFilename();
	    String renameFileName 
	    	= sdf.format(new Date(System.currentTimeMillis())) + ranNum
	    	+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
	  
	    String renamePath = folder + "\\" + renameFileName;
	  
	    try {
	    	file.transferTo(new File(renamePath));
	    } catch (Exception e) {
	    	System.out.println("파일 전송 에러 : " + e.getMessage());
	    	e.printStackTrace();
	    }
	    
	    Contents c = new Contents(originFileName, renameFileName, savePath);
	    int result = mService.insertContents(c);
	    
	    if(result > 0) {
	    	return renameFileName;
	    } else {
	    	throw new MemberException("프로필 이미지 DB저장에 실패하셨습니다.");
	    }
	}

	 // 로그인 버튼 클릭시 새로운창에 로그인창 뜨기
	 @RequestMapping("gologin.me")
	 public String loginview() {
		 return "login/loginform";
	 }

	// 회원가입 클릭시 새로운창에 회원가입창 뜨기
	@RequestMapping("gosignUp.me")
	public String signupview() {
		return "login/signup";

		}
	
	// 회원가입에서 취소 클릭시 메인페이지로 이동
	@RequestMapping("gomain.me")
	public String gomainview() {
		return "common/mainHeader";
  }
	
	@RequestMapping("mainPortPaging.my")
	public @ResponseBody void myPageMainPortPaging(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletResponse response) throws Exception{
		
		response.setContentType("application/json; charset=utf-8");
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyPagePortCount(userId);
		PageInfo pi = Pagination.getMypageMainPortListPageInfo(currentPage, listCount);
		
		ArrayList<PortpolioContents> pcList = mService.selectMyPagePortList(pi, userId);
		
		for(PortpolioContents pc : pcList) {
			ArrayList<PortpolioReply> portReply = mService.selectPoReply(pc.getPoNum());
			pc.setPortReply(portReply);
			
			ArrayList<PortpolioContents> portContents = mService.selectAttachFile(pc.getPoNum());
			pc.setPortContents(portContents);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();				
		map.put("pcList", pcList);
		map.put("pi", pi);
		
		new Gson().toJson(map, response.getWriter());
	}
	
	@RequestMapping("scrapList.my")
	public ModelAndView scrapListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyScrapCount(userId);
		
		PageInfo pi = Pagination.getMyReplyPageInfo(currentPage, listCount);		
		ArrayList<Scrap> scList = mService.selectMyScrapList(userId, pi);
		
		if(scList != null) {
			mv.addObject("scList", scList)
			  .addObject("pi", pi)
			  .addObject("userId", userId)
			  .setViewName("scrapList");
		} else {
			throw new BoardException("내 댓글 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("nickCheck.my")
	public @ResponseBody void nickCheck(@ModelAttribute Member m, HttpServletResponse response) throws Exception {
		System.out.println("m : " + m);
		
		int result = mService.nickCheck(m);
		
		response.setCharacterEncoding("UTF-8");
		
		if(result >= 1) {
			new Gson().toJson(true, response.getWriter());
		} else {
			new Gson().toJson(false, response.getWriter());
		}
		
	}
	
	@RequestMapping("uMember.my")
	public String updateMember(@ModelAttribute Member m) {
		System.out.println("Member : " + m);
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			return "redirect:main.my?userId=" + m.getUserId();
		} else {
			throw new MemberException("프로필 정보 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("iGrade.my")
	public String insertGrade(@ModelAttribute Request r, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		System.out.println("Request : " + r);
		
		String boWriter = ((Member)session.getAttribute("loginUser")).getUserId();
		String reId = mService.selectUserId(r);
		
		r.setReId(reId);
		
		int result = mService.insertGrade(r);
		
		if(result > 0) {
			return "redirect:reqList.my?boWriter=" + boWriter + "&cbStep=3&page=" + page;
		} else {
			throw new MemberException("평점 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("secretToggle.my")
	public @ResponseBody void secretToggle(@ModelAttribute Member m, HttpServletResponse response) {
		
		System.out.println("userId : " + m.getUserId());
		
		String userId = m.getUserId();
		response.setCharacterEncoding("UTF-8");
		String secretYn = mService.selectSecretYn(m);
		
		PrintWriter out = null;
		
		try {
			if(secretYn.equals("N")) {
				
				out  = response.getWriter();
				int result1 = mService.updateSecretToggle(userId);
				
				if(result1 > 0) {
					out.println("updateY");
				} else {
					out.println("update 실패!");
				}
		
			} else {
				out = response.getWriter();
				int result2 = mService.updateSecretToggle2(userId);
				
				if(result2 > 0) {
					out.println("updateN");
				} else {
					out.println("update 실패!");
				}
			}
		} catch (IOException e) {
			throw new MemberException(e.getMessage());
		} finally {
			out.flush();
			out.close();
		}
		
	}
	
	@RequestMapping("sessionUpdate.me")
	public void sessionUpdate(@RequestParam("userId") String userId, Model model, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		Member loginUser = mService.selectMember(userId);
		model.addAttribute("loginUser", loginUser);
		
		ArrayList<Board> recentlyList = mService.recentlyBoardList(loginUser);
		
		JSONArray jArr = new JSONArray();

		JSONObject updateUser = new JSONObject();
		updateUser.put("point", loginUser.getPoint());
		updateUser.put("cash", loginUser.getCash());
		updateUser.put("profileImg", loginUser.getProfileImg());
		updateUser.put("recent1", loginUser.getRecent1());
		updateUser.put("recent2", loginUser.getRecent2());
		updateUser.put("recent3", loginUser.getRecent3());
		updateUser.put("recent4", loginUser.getRecent4());
		updateUser.put("recent5", loginUser.getRecent5());
		jArr.add(updateUser);
		
		for(Board b: recentlyList) {
			JSONObject jBoard = new JSONObject();
			jBoard.put("boNum", b.getBoNum());
			jBoard.put("boTitle", b.getBoTitle());
			jBoard.put("boGroup", b.getBoGroup());
			
			jArr.add(jBoard);
		}
		
		ArrayList<Board> recentlyScrapList = mService.recentlyScrapList(loginUser);
		
		for(Board b: recentlyScrapList) {
			JSONObject jBoard = new JSONObject();
			jBoard.put("boNum", b.getBoNum());
			jBoard.put("boTitle", b.getBoTitle());
			
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
	
	@RequestMapping("callTodayData.me")
	public void callTodayData(HttpServletResponse response) {
		int[] userId = mService.callTodayData();
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(userId, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
  	
  	@RequestMapping("kakaoLogin.my")
  	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpSession session, ModelAndView mv) {
  	    System.out.println("code : " + code);
  	    
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    Member m = new Member();
	    m.setNickName((String)userInfo.get("nickname"));
	    m.setEmail((String)userInfo.get("email"));
	    m.setProfileImg((String)userInfo.get("profileImg"));
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	    	Member member = mService.selectMemberByEmail((String)userInfo.get("email"));
	    	if(member != null) {
	    		session.setAttribute("loginUser", member);
	    		mv.addObject("member", member)
	    		  .setViewName("redirect:index.home");
	    	} else {
	    		mv.addObject("member", m);
		    	mv.setViewName("signup");
	    	}
	    	session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
  	    return mv;
  	}
  	
  	@RequestMapping(value="kakaoLogout.my")
  	public String kakaoLogout(HttpSession session) {
  	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
  	    session.removeAttribute("access_Token");
  	    session.removeAttribute("userId");
  	    return "redirect:index.home";
  	}
  	
  	@RequestMapping("checkId.me")
  	public void checkId(@RequestParam String user_id, HttpServletResponse response) throws IOException {
  		Member m = mService.userIdCheck(user_id);
  		
  		if(m != null) {
  			response.getWriter().println(1);
  		} else {
  			response.getWriter().println(0);
  		}
  	}

  	@RequestMapping("checkNick.my")
	public void checkNick(@ModelAttribute Member m, HttpServletResponse response) throws Exception {
		
		int result = mService.nickCheck(m);
		
		response.getWriter().println(result);
	}
 
	@RequestMapping("freeBoardList.my")
	public ModelAndView freeBoardList(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyFreeBoardListCount(userId);
		
		PageInfo pi = Pagination.getMyReplyPageInfo(currentPage, listCount);		
		ArrayList<Board> fList = mService.selectMyFreeBoardList(userId, pi);
		
		System.out.println("pi : " + pi);
		
		if(fList != null) {
			mv.addObject("fList", fList)
			  .addObject("pi", pi)
			  .addObject("userId", userId)
			  .setViewName("freeBoardList");
		} else {
			throw new BoardException("내 자유게시판 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("cashBoardList.my")
	public ModelAndView cashBoardList(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyCashBoardListCount(userId);
		
		PageInfo pi = Pagination.getMyReplyPageInfo(currentPage, listCount);		
		ArrayList<CBoard> cbList = mService.selectMyCashBoardList(userId, pi);
		
		System.out.println("pi : " + pi);
		
		if(cbList != null) {
			mv.addObject("cbList", cbList)
			  .addObject("pi", pi)
			  .addObject("userId", userId)
			  .setViewName("cashBoardList");
		} else {
			throw new BoardException("내 캐쉬게시판 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
  	
	@RequestMapping("selectUserIdByNick.my")
	public void selectUserId(String nick, HttpServletResponse response) throws JsonIOException, IOException {
		Request r = new Request();
		r.setReId(nick);
		
		String id = mService.selectUserId(r);
		
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(id, response.getWriter());
		
		
	}
}
	
	