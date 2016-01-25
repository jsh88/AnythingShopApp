<%@page import="com.anyshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.anyshop.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
    Member mem = (Member) session.getAttribute("member");
    List<Product> pList = (List<Product>) request.getAttribute("pList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$.urlParam = function(name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
          .exec(window.location.href);
    if (results == null) {
       return null;
    } else {
       return results[1] || 0;
    }
 }

 $(document).ready(function() {
	 
    setTimeout(function() {
       if ($.urlParam('su')) {
          parent.location.reload(true);
       }
    }, 10);
 });
</script>
</head>
<body>
<div>
<ul>
<li>마이페이지</li>
<li><%=mem.getName() %>님의 쇼핑정보</li>
<li>장바구니 <%=pList.size() %></li>
<li>개인정보</li>
<li><a href="updatemember?id=<%=mem.getId() %>" target="mypagefr">회원정보 수정</a></li>
<li><a href="deletemember">회원탈퇴</a></li>
<li>내 쇼핑정보</li>
<li><a href="memberOrderSearch" target="mypagefr">주문내역/배송조회</a></li>
<li><a href="answer">1:1 문의개시판</a></li>
<li><a href="watchlist">최근본 상품목록</a></li>
</ul>
</div>
<div>
<br/><br/>
<iframe id="mypagefr" name = "mypagefr"  frameborder="0"
 width="1000px" height="800px"/>
</div>
</body>
</html>