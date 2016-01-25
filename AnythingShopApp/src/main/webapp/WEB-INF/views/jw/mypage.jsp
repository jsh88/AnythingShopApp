<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="mypage.css" rel="stylesheet"/>
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
						<span id="username"><b>404</b></span>님의 쇼핑정보
					</div>
					<div id="userInfo-table">
						<table id="infotable">
							<tr>
								<th>·&nbsp;회원그룹</th>
								<td><span class="infospan">0</span>원</td>
							</tr>
							<tr>
								<th>·&nbsp;총구매액</th>
								<td><span class="infospan">1000</span>원</td>
							</tr>
							<tr>
								<th>·&nbsp;장바구니</th>
								<td><span class="infospan">0</span>개</td>
							</tr>
						</table>
					</div>					
				</div>
				<div class="infomodify" id="first">
						<div class="infomodfiy_name" >
							개인정보
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="../images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infocontent">
						·&nbsp;<a href="">회원정보수정</a><br/>
						·&nbsp;<a href="">회원탈퇴</a>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name">
							내 쇼핑정보
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="../images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infocontent">
						·&nbsp;<a href="">주문내역</a><br/>
						·&nbsp;<a href="">적립금내역</a><br/>
						·&nbsp;<a href="">할인쿠폰내역</a><br/>
						·&nbsp;<a href="">상품보관함</a>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name" onclick="">
							1:1문의 게시판
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="../images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name" onclick="">
							나의 상품 후기
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="../images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name" onclick="">
							나의 상품 문의
						</div>
						<div class="infobutton">
							<img style="width: 20px"src=".../images/click_triangle.gif"/>
						</div>
					</div>
					<div class="infomodify">
						<div class="infomodfiy_name" onclick="">
							최근 본 상품 목록
						</div>
						<div class="infobutton">
							<img style="width: 20px"src="../images/click_triangle.gif"/>
						</div>
					</div>
			</div>
		</div>
		<div id="mypage-right">
			<div id="right-title">
				<img src=".../images/title_orderdetail.gif"/>
			</div>
			<div id="shoproot">
				HOME&nbsp;&gt;&nbsp;마이페이지&gt;&nbsp;<a href="#"><b>주문내역상세보기</b></a> 
			</div>
			<div id="cartList">
			<table id="cartTable">
				<tr>
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송상태</th>
					<th>배송추적/이용후기</th>
				</tr>
				<tr>
					<td width="10%" ><img style="width: 60px; height: 60px" src="https://placehold.it/60x60" ></td>
					<td width="35%" id="productname">여긴어딘가나는누군가</td>
					<td width="10%"></td>
					<td width="15%"></td>
					<td width="10%"><span id="ordercheck"><b>주문접수</b></span></td>
					<td width="20%"></td>
				</tr>
			</table>
		</div>
			<div id="mypagedetail">
				<img src="../images/order_txt_01.gif"/>
			</div>
			<div id="orderWrap">
		<div id="order1">
			<div id="order1-left">
				<div id="left-small1">
					<img src="../images/order_step_01.gif"/>
				</div>
			</div>
			<div id="order1-right">
				<table class="Info">
					<tr>
						<th>주문자명</th>
						<td></td>
					</tr>
					<tr>
						<th>주문자 전화</th>
						<td></td>
					</tr>
					<tr>
						<th>주문자 핸드폰</th>
						<td></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order2">
			<div id="order2-left">
				<div id="left-small2">
					<img src="../images/order_step_02.gif"/>
				</div>
			</div>
			<div id="order2-right">
				<table class="Info">
					<tr>
						<th>받는자명</th>
						<td></td>
					</tr>
					<tr>
						<th>받는자 전화</th>
						<td></td>
					</tr>
					<tr>
						<th>받는자 핸드폰</th>
						<td></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td></td>
					</tr>
					<tr>
						<th>주소</th>
						<td></td>
					</tr>
					<tr>
						<th>배송메세지</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order3">
			<div id="order3-left">
				<div id="left-small3">
					<img src="../images/order_step_03.gif"/>
				</div>
			</div>
			<div id="order3-right">
				<table class="Info">
					<tr>
						<th>총주문금액</th>
						<td></td>
					</tr>
					<tr>
						<th>배송비</th>
						<td></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><b>5000</b>원</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order4">
			<div id="order4-left">
				<div id="left-small4">
					<img src="../images/order_step_04.gif"/>
				</div>
			</div>
			<div id="order4-right">
				<table class="Info">
					<tr>
						<th>입금은행</th>
						<td></td>
					</tr>
					<tr>
						<th>입금계좌</th>
						<td></td>
					</tr>
					<tr>
						<th>예금주명</th>
						<td></td>
					</tr>
					<tr>
						<th>입금자명</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="pay">
			<div id="pay-left">
				<span id="c">현금영수증</span>
			</div>
			<div id="pay-right">
				<span id="p">입금하셔야 현금영수증을 신청하실 수 있습니다.</span>
			</div>
		</div>
			<div id="ask">
				※&nbsp;주문취소/교환/반품을 원하시면 마이페이지의 <span>1:1문의 게시판</span>을 이용하세요
			</div>
			<div id="buttonGroup">
				<img style="width: 90px" src=../images/btn_back2.gif onclick=""/>
				<img style="width: 90px" src=../images/btn_order_cancel.gif onclick=""/>
				<img style="width: 90px" src=../images/btn_again_order.gif onclick=""/>
			</div>
			</div>
		</div>
	</div>
</body>
</html>