<%@page import="com.anyshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.anyshop.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%Member mem = (Member) session.getAttribute("member");
    List<Product> pList = (List<Product>) request.getAttribute("pList");
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
<li>개인정보</li>
<li><a href="updatemember" target="mypagefr">회원정보 수정</a></li>
<li><a href="deletemember">회원탈퇴</a></li>
<li>내 쇼핑정보</li>
<li><a href="order">주문내역/배송조회</a></li>
<li><a href="answer">1:1 문의개시판</a></li>
<li><a href="watchlist">최근본 상품목록</a></li>
</ul>
</div>
<div>
<br/><br/>
<iframe src="updatemember?id=a" id="mypagefr" name = "mypagefr"  frameborder="0"
 width="1000px" height="800px"/>

</div>
</body>
</html>