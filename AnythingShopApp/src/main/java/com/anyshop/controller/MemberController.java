package com.anyshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	private MainService mainService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setMainServie(MainService mainService) {
		this.mainService = mainService;
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

		System.out.println("로그인 시작");

		return "redirect:index";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		System.out.println("로그아웃 해야지!!");

		session.invalidate();

		return "redirect:index";

	}

	// 로그인 성공
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session) {

		System.out.println("로그인 성공");

		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getDetails();

		session.setAttribute("member", memberService.getMember(member));

		if (member.getUsername().equals("admin"))
			return "index.jsp?body=admin/adminPage";

		return "redirect:index";

	}

	// 로그인 실패
	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail() {

		return "redirect:index";

	}

	// 중복 로그인
	@RequestMapping(value = "/loginDuplicate", method = RequestMethod.GET)
	public String loginDuplicate() {

		return "redirect:index";

	}

	@RequestMapping(value = "/mypage")
	public String myPageForm(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Member mem = (Member) session.getAttribute("member");

		response.setHeader("X-Frame-Options", "SAMEORIGIN");
		mainService.getCart(session, request);

		if (mem != null) {
			return "index.jsp?body=member/myPage";
		} else {
			return "redirect:loginPage";
		}
	}

	@RequestMapping(value = "/updatemember")
	public String updateMemberPage(HttpServletRequest request, HttpServletResponse response) {
		memberService.getMemberPage(request);

		response.setHeader("X-Frame-Options", "SAMEORIGIN");

		return "member/updateMember";
	}

	@RequestMapping(value = "/update")
	public String updateMemberResult(HttpServletRequest request, HttpServletResponse response) {
		memberService.updateMemberResult(request);

		// response.setHeader("X-Frame-Options", "SAMEORIGIN");

		return "redirect:mypage?su=1";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/deletemember")
	public String deleteMember(HttpSession session) {
		memberService.deleteMember(session);
		session.invalidate();
		return "redirect:index";
	}

	// 최근 본 상품
	@RequestMapping(value = "/recentwatch")
	public String watchProduct(HttpServletRequest request, HttpServletResponse response) {
		mainService.getWatchProduct(request);
		response.setHeader("X-Frame-Options", "SAMEORIGIN");
		return "member/recentWatch";
	}

	// 1:1게시판 리스트
	@RequestMapping(value = "/oneononeborad")
	public String oneOnOneBoard(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		memberService.getOneOnOneBoard(request, session);

		response.setHeader("X-Frame-Options", "SAMEORIGIN");

		return "member/ONOBoard";
	}

	// 1:1게시판 글쓰기 이동
	@RequestMapping(value = "/onoboardwrite")
	public String onoBoardWrite(HttpServletResponse response) {
		return "member/ONOBoardWrite";
	}

	// 1:1게시판 글쓰기 결과
	@RequestMapping(value = "/onoboardwriteresult")
	public String onoBoardWriteResult(HttpServletRequest request, HttpServletResponse response) {
		memberService.writeONOBoard(request);
		return "redirect:oneononeborad";
	}

	// 1:1게시판 내용
	@RequestMapping(value = "/onocontent")
	public String onoBoardContent(HttpServletRequest request, HttpServletResponse response) {
		memberService.onoBoardContent(request);
		response.setHeader("X-Frame-Options", "SAMEORIGIN");

		return "member/ONOBoardContent";
	}

	// 1:1게시판 삭제
	@RequestMapping(value = "/deleteonoboard")
	public String onoBoardDelete(HttpServletRequest request) {
		memberService.onoBoardDelete(request);

		return "redirect:oneononeborad";
	}

	@RequestMapping(value = "/onoboardupdate")
	public String onoBoardUpdate(HttpServletRequest request) {
		memberService.onoBoardUpdate(request);

		return "member/ONOBoardUpdate";
	}

	@RequestMapping(value = "/onoboardupdateresult")
	public String onoBoardUpdateResult(HttpServletRequest request) {
		memberService.onoBoardUpdateResult(request);

		return "redirect:oneononeborad";
	}
}
