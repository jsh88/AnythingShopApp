package com.anyshop.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.anyshop.domain.Member;

public interface MemberDao {
	
	public Member getMember(Member member);

	public boolean loginCheck(String user_id, String user_pw);
	
	public JdbcTemplate getJdbcTemplate();

	public void addMember(Member m);

	public Boolean checkId(String id);

	public Boolean checkEmail(String email);
	
}