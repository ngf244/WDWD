package com.kh.WDWD.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.WDWD.board.model.exception.BoardException;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.board.model.vo.Scrap;
import com.kh.WDWD.cBoard.model.vo.CBoard;
import com.kh.WDWD.cash.model.vo.PointNCash;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
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
	
	@RequestMapping(value="login.me",method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
		System.out.println(m);
		
		Member loginUser = mService.loginMember(m);
		
		System.out.println(loginUser);

		if(loginUser != null) {
			// 로그인 성공 시 세션에 정보를 담아야 하기 때문에 세션이 필요
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
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
		System.out.println(member);
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
		
		System.out.println("pcList : " + pcList);
		
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
		
		System.out.println("renameFileName : " + renameFileName);
		
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
		
		System.out.println("result : " + result);
		
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
	public String insertGrade(@ModelAttribute Request r, HttpSession session) {
		System.out.println("Request : " + r);
		
		String boWriter = ((Member)session.getAttribute("loginUser")).getUserId();
		String reId = mService.selectUserId(r);
		
		r.setReId(reId);
		
		int result = mService.insertGrade(r);
		
		if(result > 0) {
			return "redirect:reqList.my?boWriter=" + boWriter + "&cbStep=3";
		} else {
			throw new MemberException("평점 등록에 실패하였습니다.");
		}
	}
}
	
	
	