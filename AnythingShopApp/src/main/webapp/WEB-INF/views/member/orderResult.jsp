<%@page import="com.anyshop.domain.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><img src="resources/images/title_orderlist.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 회원가입 > 회원정보수정</td>
			</tr>
		</table>
	</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>상세보기</th>
			</tr>
			<c:forEach var="o" items="${ oList }" varStatus="s">
				<tr>
					<td>${s.count }</td>
					<td>${o.auth=true?"일반":"비회원" }</td>
					<td>${o.oDate }</td>
					<td>${o.oNo }</td>
					<td>${o.tPrice }</td>
					<td>${o.state=true?"배송중":"배송완료" }</td>
					<td><a href="?oNo=${o.oNo }"><img
							src="resources/images/btn_detailview.gif" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>