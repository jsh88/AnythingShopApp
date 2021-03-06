package com.anyshop.env;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.anyshop.controller.MemberController;
import com.anyshop.dao.MemberDao;
import com.anyshop.domain.Member;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		
		this.dao = dao;
		
	}

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String user_id = (String) authentication.getPrincipal();
		String user_pw = (String) authentication.getCredentials();

		logger.info("Welcome authenticate! {}", user_id + "/" + user_pw);

		if (dao != null && dao.loginCheck(user_id, user_pw)) {

			logger.info("정상 로그인입니다.");

			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();

			roles.add(new SimpleGrantedAuthority("memberRole"));

			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw,
					roles);
			
			result.setDetails(new Member(user_id, user_pw));

			return result;
			
		} else {
			logger.info("비정상 로그인");
		}

		logger.info("사용자 크리덴셜 정보가 틀립니다. 에러가 발생합니다.");
		throw new BadCredentialsException("Bad credentials");
	}
}