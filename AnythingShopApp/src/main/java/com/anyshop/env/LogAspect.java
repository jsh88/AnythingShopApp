package com.anyshop.env;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	private final static Log logger = LogFactory.getLog(LogAspect.class);

	@Before("execution(* com.anyshop.controller.MemberController.loginFail(..))")
	public void logLoginFailAdvice(JoinPoint joinPoint) throws Throwable {

		if (logger.isInfoEnabled())
			logger.info("LoginFail");

	}

	@After("execution(* com.anyshop.controller.MemberController.loginSuccess(javax.servlet.http.HttpSession)) && args(session)")
	public void logLoginSuccessAdvice(JoinPoint joinPoint, HttpSession session) throws Throwable {
		
		if (logger.isInfoEnabled())
			logger.info("Login Success");

	}

	@Before("execution(* com.anyshop.controller.MemberController.loginDuplicate(..))")
	public void logLoginDuplicateAdvice(JoinPoint joinPoint) throws Throwable {
		
		if (logger.isInfoEnabled())
			logger.info("LoginDuplicate");

	}
}