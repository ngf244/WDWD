package com.kh.WDWD.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.WDWD.member.model.exception.MemberException;
import com.kh.WDWD.member.model.service.MemberService;
import com.kh.WDWD.member.model.vo.Member;


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
			return "index";
		}else {
			model.addAttribute("msg","로그인 실패하셨습니다!");
		}
		return "common/errorPage";
	}

	// 로그아웃 컨트롤
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:index.jsp";
	}
	
	@RequestMapping("main.my")
	public ModelAndView myPageView(@RequestParam("userId") String userId, ModelAndView mv) {
		
		Member member = mService.selectMember(userId);
		
		if(member != null) {
			mv.addObject("member", member)
			  .setViewName("mypageMain");
		} else {
			throw new MemberException("마이페이지 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("porEnroll.my")
	public String portpolioEnrollView() {
		return "portpolioEnroll";
	}
	
	@RequestMapping("portpolioList.my")
	public String portpolioListView() {
		return "portpolioList";
	}
	
	@RequestMapping("directReq.my")
	public String directRequestForm() {
		return "directRequestForm";
	}
	
	@RequestMapping("reqTwoList.my")
	public String requestTwoListView() {
		return "requestTwoStepList";
	}
	
	@RequestMapping("reqThreeList.my")
	public String requestThreeListView() {
		return "requestThreeStepList";
	}	
	
	@RequestMapping("workOneList.my")
	public String workOneListView() {
		return "workOneStepList";
	}

	@RequestMapping("workTwoList.my")
	public String workTwoListView() {
		return "workTwoStepList";
	}
	
	@RequestMapping("workThreeList.my")
	public String workThreeListView() {
		return "workThreeStepList";

	}	

	
	// 회원가입  controller
	@RequestMapping("signUp.me")
	public String memberInsert(@ModelAttribute Member m, @RequestParam("post") String post, @RequestParam("address1") String address1, @RequestParam("address2") String address2) {
		
//		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encPwd);
		
//		System.out.print(m);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입에 실패하셨습니다.");
		}
	}
}