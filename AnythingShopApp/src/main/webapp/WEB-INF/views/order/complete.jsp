<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="resources/css/complete.css" rel="stylesheet"/>
</head>
<body>
	<div id="completeWrap">
		<div id="completeTitle">
			<img src="resources/images/title_complete.gif"/>
		</div>
		<div id="shoproot">
			HOME&nbsp;&gt;&nbsp;<a href="#"><b>주문완료</b></a> 
		</div>
		<div id="completeimg">
			<img src="resources/images/order_complete.gif"/>
		</div>
		<div id="orderWrap">
		<div id="order1">
			<div id="order1-left">
				<div id="left-small1">
					<img src="resources/images/order_step_end.gif"/>
				</div>
			</div>
			<div id="order1-right">
				<table class="info">
					<tr>
						<th>입금은행</th>
						<td>농협</td>
					</tr>
					<tr>
						<th>입금계좌</th>
						<td>211058-51-024008</td>
					</tr>
					<tr>
						<th>예금주명</th>
						<td>장성호</td>
					</tr>
					<tr>
						<th>입금자명</th>
						<td>${oList.get(0).name }</td>
					</tr>
					<tr>
						<th>입금금액</th>
						<td><b>${totalPrice + 2500 }</b>원</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>${totalPrice }</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>2,500</td>
					</tr>
				</table>
				<div id="line"></div>
				<table class="info">
					<tr>
						<th>주문번호</th>
						<td>${oList.get(0).oNo }</td>
					</tr>
					<tr>
						<th>주문자명</th>
						<td>${oList.get(0).name }</td>
					</tr>
					<tr>
						<th>주문일자</th>
						<td>${oList.get(0).oDate }</td>
					</tr>
					<tr>
						<th>주문금액</th>
						<td>${totalPrice }</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<div id="buttonGroup">
				<img style="width: 90px" src=resources/images/btn_confirm.gif onclick="javascript:location.href='index'"/>
		</div>
	</div>
</body>
</html>