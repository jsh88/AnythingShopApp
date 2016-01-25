<%@page import="com.anyshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.anyshop.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Member mem = (Member) session.getAttribute("member");
    List<Product> pList = (List<Product>) session.getAttribute("pList");
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
<link type="text/css" href="resources/css/mypage.css" rel="stylesheet"/>
</head>
<body>
	<div id="mypageWrap">
		<div id="mypage-left">
			<div id="left-nav">
				<div id="left-mypage">
					마이페이지
				</div>
				<div id="left-userinfo">
					<div id="userinfo">
						<span id="username"><b><%=mem.getName() %></b></span>님의 쇼핑정보
					</div>
					<div id="userInfo-table">
						<table id="infotable">
							<tr>
								<th>·&nbsp;장바구니</th>
								<td><span class="infospan"><%=pList.size() %></span>개</td>
							</tr>
						</table>
					</div>					
				</div>
				<div class="infomodify" id="first">
						<div class="infomodfiy_name" >
							개인정보
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="resources/images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infocontent">
						·&nbsp;<a href="updatemember?id=<%=mem.getId() %>" target="mypagefr">회원정보수정</a><br/>
						·&nbsp;<a href="deletemember">회원탈퇴</a>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name">
							내 쇼핑정보
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="resources/images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infocontent">
						·&nbsp;<a href="memberOrderSearch" target="mypagefr">주문내역</a><br/>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name">
							<a href="oneononeborad" target="mypagefr">1:1문의 게시판</a>
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="resources/images/click_triangle.gif"/>
						</div>
					</div>
						<div class="infomodfiy_name">
							<a href="recentwatch" target="mypagefr">최근 본 상품 목록</a>
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="resources/images/click_triangle.gif"/>
						</div>
					</div>
			</div>
		</div>
		<iframe id="mypagefr" name = "mypagefr"  frameborder="0" width="900px" height="800px"></iframe>
</body>
</html>