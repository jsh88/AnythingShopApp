package com.anyshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anyshop.domain.Member;
import com.anyshop.service.MainService;
import com.anyshop.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MainService mainServie;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setMainServie(MainService mainServie) {
		this.mainServie = mainServie;
	}
	
	@RequestMapping(value = "useagree")
	public String useAgree() {

		return "index.jsp?body=member/useAgree";

	}

	// 회원가입 페이지로
	@RequestMapping(value = "joinPage")
	public String joinMember() {

		return "index.jsp?body=member/join";

	}

	// 회원가입 처리
	@RequestMapping(value = "join")
	public String joinMember(HttpServletRequest request) {

		memberService.addMember(request);

		return "redirect:index";

	}

	// 아이디 중복 체크
	@RequestMapping(value = "checkId")
	public String checkId(HttpServletRequest request) {

		memberService.checkId(request);

		return "-";
	}

	// 이메일 중복 체크
	@RequestMapping(value = "checkEmail")
	public String checkEmail(HttpServletRequest request) {

		memberService.checkEmail(request);

		return "-";
	}

	// 로그인 페이지
	@RequestMapping(value = "/loginPage")
	public String loginForm() {

		return "index.jsp?body=login/loginPage";

	}

	// 로그인
	@RequestMapping(value = "/login")
	public String login(HttpSession session) {

		return "redirect:index";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:index";

	}

	// 로그인 성공
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session) {

		Member userDetails = (Member) SecurityContextHolder.getContext().getAuthentication().getDetails();

		session.setAttribute("member", userDetails);

		return "redirect:index";

	}

	// 로그인 실패
	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail() {

		return "redirect:index";

	}

	// 중복 로그인
	@RequestMapping(value = "/loginDuplicate", method = RequestMethod.POST)
	public String loginDuplicate() {

		return "redirect:index";

	}

	@RequestMapping(value="/mypage")
	public String myPageForm(HttpSession session, HttpServletRequest request) {
		Member mem = (Member) session.getAttribute("member");
		
		mainServie.getCart(request);
		
		if (mem != null) {
			return "index.jsp?body=member/myPage";
		} else {
			return "redirect:loginPage";
		}

	}
}