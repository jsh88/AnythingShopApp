<%@page import="com.anyshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.anyshop.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Member mem = (Member) session.getAttribute("member");
    List<Product> pList = (List<Product>) request.getAttribute("pList");
    System.out.println(pList.size());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<ul>
<li>마이페이지</li>
<li><%=mem.getName() %>님의 쇼핑정보</li>
<li>장바구니 <%=pList.size() %></li>
</ul>
<ul>
<li>개인정보</li>
<li><a href="">회원정보 수정</a></li>
<li>장바구니 <%=pList.size() %></li>
</ul>
</div>
<div>
<iframe />
<table>
			<tr>
				<td><img src="resources/images/title_modifyinfo.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 회원가입 > 회원정보수정</td>
			</tr>
		</table>
		<div>
			<img src="resources/images/join_txt_04.gif" />* 필수입력사항<br />
			<form action="join" method="post">
			
			</form>
			</div>
			</div>
</body>
</html>