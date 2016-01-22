<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	float: left;
	list-style: none;
	padding: 5px;
	border: 1px solid black;
}

a {
	font-size: 15px;
	text-decoration: none;
}
</style>
</head>
<body>
	<ul>
		<li><a href="index"><img src="resources/images/logo.jpg" /></a></li>
		<c:if test="${not empty sessionScope.member}">
			<li><a href="logout">로그아웃</a></li>
		</c:if>
		<c:if test="${empty sessionScope.member}">
			<li><a href="loginPage">로그인</a></li>
			<li><a href="useagree">회원가입</a></li>
		</c:if>
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">고객센터</a></li>
		<li><a href="#">idea</a></li>
		<li><a href="#">Living</a></li>
	</ul>
	<form action="#">
		<input type="text" name="search" /> <input type="image"
			src="resources/images/b_search.gif" />
	</form>
</body>
</html>