package com.anyshop.service;

import javax.servlet.http.HttpServletRequest;

import com.anyshop.domain.Member;

public interface MemberService {

	public void  addMember(HttpServletRequest request);

	public void checkId(HttpServletRequest request);

	public void checkEmail(HttpServletRequest request);
	
	public void getMemberPage(HttpServletRequest request);
	
	public void updateMemberResult(HttpServletRequest request);

	public Member getMember(Member member);

}