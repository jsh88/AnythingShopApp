package com.anyshop.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anyshop.dao.MemberDao;
import com.anyshop.domain.Member;
import com.anyshop.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;

	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void addMember(HttpServletRequest request) {

		Member m = new Member();

		m.setId(request.getParameter("id"));
		m.setPw(request.getParameter("pw"));
		m.setName(request.getParameter("name"));
		m.setAddr(request.getParameter("addr"));
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3"));

		memberDao.addMember(m);

	}

	@Override
	public void checkId(HttpServletRequest request) {

		request.setAttribute("isId", memberDao.checkId(request.getParameter("id")));

	}

	@Override
	public void checkEmail(HttpServletRequest request) {

		request.setAttribute("isEmail", memberDao.checkEmail(request.getParameter("email")));

	}
	
	@Override
	public void getMemberPage(HttpServletRequest request) {
		String id = request.getParameter("id");
		Member member = memberDao.getUpdateMember(id);
		
		request.setAttribute("member", member);
		
	}
	
	@Override
	public void updateMemberResult(HttpServletRequest request) {
		
		Member m = new Member();
		m.setId(request.getParameter("id"));
		m.setAddr(request.getParameter("addr"));
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" +phone3;
		m.setPhone(phone);
		m.setEmail(request.getParameter("email"));
		
		memberDao.updateMember(m);
	}
	@Override
	public Member getMember(Member member) {
		
		return memberDao.getMember(member);
		
	}
}