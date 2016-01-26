<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="resources/css/payment.css" rel="stylesheet"/>
</head>
<body>
	<div id="paymentWrap">
		<div id="paymentTitle">
			<img src="resources/images/payment.gif"/>
		</div>
		<div id="shoproot">
			HOME&nbsp;&gt;&nbsp;<a href="#"><b>결제하기</b></a> 
		</div>
		<div id="cartList">
			<table id="cartTable">
				<tr>
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
				<c:forEach var="p" items="${ orderProductList }">
				<tr>
					<td width="10%" ><img style="width: 60px; height: 60px" src="resources/images/${p.image}"></td>
					<td width="35%" id="productname">${p.name }&nbsp;&nbsp;${p.explan }</td>
					<td width="10%">${p.price }</td>
					<td width="15%">${p.quantity }</td>
					<td width="10%">배송비별도</td>
					<td width="20%">${p.price * p.quantity}원</td>
				</tr>
				</c:forEach>
			</table>
			<div id="cartbottom">
				<div id="price">
					<p><div id="pc"><b>${totalPrice }원</b></div><div id="p">상품합계금액</div></p>
				</div>
			</div>
		</div>
		<div id="paymencheck">
			<img src="resources/images/order_check.gif"/>
		</div>
	<div id="orderWrap">
		<div id="order1">
			<div id="order1-left">
				<div id="left-small1">
					<img src="resources/images/order_step_01.gif"/>
				</div>
			</div>
			<div id="order1-right">
				<table class="Info">
					<tr>
						<th>주문자명</th>
						<td>${oList.get(0).name }</td>
					</tr>
					<tr>
						<th>주문자 전화</th>
						<td>111-1111-1111</td>
					</tr>
					<tr>
						<th>주문자 핸드폰</th>
						<td>${oList.get(0).phone }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>1@1.1</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order2">
			<div id="order2-left">
				<div id="left-small2">
					<img src="resources/images/order_step_02.gif"/>
				</div>
			</div>
			<div id="order2-right">
				<table class="Info">
					<tr>
						<th>받는자명</th>
						<td>${oList.get(0).rName }</td>
					</tr>
					<tr>
						<th>받는자 전화</th>
						<td>111-1111-1111</td>
					</tr>
					<tr>
						<th>받는자 핸드폰</th>
						<td>${oList.get(0).rPhone }</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>111-111</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${oList.get(0).rAddr }</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order3">
			<div id="order3-left">
				<div id="left-small3">
					<img src="resources/images/order_step_03.gif"/>
				</div>
			</div>
			<div id="order3-right">
				<table class="Info">
					<tr>
						<th>총주문금액</th>
						<td>${totalPrice }원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>2,500원</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><b>${totalPrice + 2500}</b>원</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="order4">
			<div id="order4-left">
				<div id="left-small4">
					<img src="resources/images/order_step_04.gif"/>
				</div>
			</div>
			<div id="order4-right">
				<table class="Info">
					<tr>
						<th>입금계좌</th>
						<td>농협 211058-51-024008 장성호</td>
					</tr>
					<tr>
						<th>입금자명</th>
						<td><input type="text" name="inname" size="25" value="${oList.get(0).name }"/></td>
					</tr>
					<tr>
						<th>입금금액</th>
						<td>
							<span id="lastspan"><b>${totalPrice + 2500}원</b></span>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<div id="buttonGroup">
				<img style="width: 90px" src=resources/images/btn_payment.gif onclick="javascript:location.href='orderResult'"/>
				<img style="width: 90px" src=resources/images/btn_back.gif onclick="history.back()"/>
		</div>
	</div>
</body>
</html>