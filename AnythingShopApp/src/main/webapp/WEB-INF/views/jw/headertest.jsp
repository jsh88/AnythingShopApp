<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<header>
	<div id="headerWrap">
		<div id="logo">
			<span><a href="index"><img src="../images/logo.jpg" /></a></span>
		</div>
		<div id="nav">
				<c:if test="${not empty sessionScope.member}">
					<span class="index"><a href="logout">로그아웃</a></span>
				</c:if>
				<c:if test="${empty sessionScope.member}">
					<span class="index"><a href="loginPage" id="login">로그인</a></span>
					<span class="index"><a href="useagree">회원가입</a></span>
				</c:if>
					<span class="index"><a href="#">마이페이지</a></span>
					<span class="index"><a href="#">고객센터</a></span>
					<span class="index"><a href="#">idea</a></span>
					<span class="last"><a href="#">Living</a></span>
					<div id="search">
					<form action="#">
					<input type="text" name="search" id="searchtext"/><div id="searchimage"></div>
					</form>
					</div>
		</div>
	</div>
</header>	