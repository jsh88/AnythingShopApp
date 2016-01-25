<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="cart.css" rel="stylesheet"/>
</head>
<body>
	<div id="cartWrap">
		<div id="cartTitle">
			<img src="../images/title_cart.gif"/>
		</div>
		<div id="shoproot">
			HOME&nbsp;&gt;&nbsp;<a href="#"><b>장바구니</b></a> 
		</div>
		<div id="cartList">
			<table id="cartTable">
				<tr>
					<th width="5%">선택</th>
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
				<tr>
					<td width="5%"><input type="checkbox" ></td>
					<td width="10%" ><img style="width: 80px; height: 80px" src="https://placehold.it/100x100"></td>
					<td width="30%">여긴어딘가나는누군가</td>
					<td width="10%"></td>
					<td width="15%"></td>
					<td width="10%"></td>
					<td width="20%"></td>
				</tr>
			</table>
			<div id="cartbottom">
				<div id="price">
					<p><div id="pc"><b>9,900원</b></div><div id="p">상품합계금액</div></p>
				</div>
			</div>
			<div id="buttonGroup">
				<img src=../images/btn_check_delete.gif onclick="checkdel()"/>
				<img src=../images/btn_check_order.gif onclick="pay()"/>
				<img src=../images/btn_empty2.gif onclick="del()"/>
				<img src=../images/btn_continue2.gif onclick="back()"/>
			</div>
		</div>
	</div>
</body>
</html>