package com.anyshop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.anyshop.domain.Member;

public interface MemberService {

	public void  addMember(HttpServletRequest request);

	public void checkId(HttpServletRequest request);

	public void checkEmail(HttpServletRequest request);
	
	public void getMemberPage(HttpServletRequest request);
	
	public void updateMemberResult(HttpServletRequest request);
	
	public void deleteMember(HttpSession session);

	public Member getMember(Member member);

	public void getOneOnOneBoard(HttpServletRequest request, HttpSession session);
	
	public void writeONOBoard(HttpServletRequest request);
	
	public void onoBoardContent(HttpServletRequest request);
	
	public void onoBoardDelete(HttpServletRequest request);
	
	public void onoBoardUpdate(HttpServletRequest request);
	
	public void onoBoardUpdateResult(HttpServletRequest request);
}