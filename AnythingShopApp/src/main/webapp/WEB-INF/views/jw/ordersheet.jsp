<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="ordersheet.css" rel="stylesheet"/>
</head>
<body>
	<div id="ordersheetWrap">
		<div id="orderTitle">
			<img src="../images/title_order_01.gif"/>
		</div>
		<div id="shoproot">
			HOME&nbsp;&gt;&nbsp;<a href="#"><b>주문하기</b></a> 
		</div>
		<div id="orderdeimg">
			<img src="../images/order_txt_01.gif"/>
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
				<tr>
					<td width="10%" ><img style="width: 60px; height: 60px" src="https://placehold.it/60x60" ></td>
					<td width="35%" id="productname">여긴어딘가나는누군가</td>
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
		</div>
		<div id="orderimg">
			<img src="../images/order_txt_02.gif"/>
		</div>
		<div id="order1">
			<div id="order1-left">
				<div id="left-small1">
					<img src="../images/order_step_01.gif"/>
				</div>
			</div>
			<div id="order1-right">
				<table class="userInfo">
					<tr>
						<th>주문하시는분</th>
						<td><input type="text" name="name" size="25"/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>경기도 의정부시 용현동 290-1</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="phone1" size="4"/>-
							<input type="text" name="phone2" size="4"/>-
							<input type="text" name="phone3" size="4"/>
						</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>
							<input type="text" name="sellphone1" size="4"/>-
							<input type="text" name="sellphone2" size="4"/>-
							<input type="text" name="sellphone3" size="4"/>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" size="25"/>
						</td>
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
				<table class="userInfo">
					<tr>
						<th>배송지 확인</th>
						<td><input type="checkbox" name="userInfoCheck"/>&nbsp;주문고객 정보와 동일합니다</td>
					</tr>
					<tr>
						<th>받으실분</th>
						<td><input type="text" name="name" size="25"/></td>
					</tr>
					<tr>
						<th>받으실곳</th>
						<td>
							<input type="text" name="zipcode1" size="3"/>-<input type="text" name="zipcode2" size="3"/><br/>
							<input type="text" name="address1" size="25"/><br/>
							<input type="text" name="address2" size="25"/>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="phone1" size="4"/>-
							<input type="text" name="phone2" size="4"/>-
							<input type="text" name="phone3" size="4"/>
						</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>
							<input type="text" name="sellphone1" size="4"/>-
							<input type="text" name="sellphone2" size="4"/>-
							<input type="text" name="sellphone3" size="4"/>
						</td>
					</tr>
					<tr>
						<th>남기실말씀</th>
						<td><input type="text" name="memo" size="25"/></td>
					</tr>
					<tr>
						<th>배송선택</th>
						<td><input type="radio" name="check"/>&nbsp;기본배송</td>
					</tr>
					<tr>
						<th>회원정보 반영</th>
						<td><input type="checkbox" name="userInfoCheck"/>&nbsp;위 내용을 회원정보에 반영합니다(주소/전화번호/핸드폰번호)</td>
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
				<table class="userInfo">
					<tr>
						<th>상품합계금액</th>
						<td class="order3Info"><b>2,000</b>원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td class="order3Info"><b>2,000</b>원</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>총 결제금액</th>
						<td class="order3Info" ><span id="sum"><b>5,000</b></span>원</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="Info">
			&nbsp;*고객님은 안전거래를 위해 현금 등으로 5만원 이상 결제시 저희 쇼핑몰에서 가입한 구매안전서비스<br/>
			&nbsp;<span id="service"><b>이니시스의 구매안전(에스크로) 서비스</b></span>를 이용하실 수 있습니다.
		</div>
		<div id="order4">
			<div id="order4-left">
				<div id="left-small4">
					<img src="../images/order_step_04.gif"/>
				</div>
			</div>
			<div id="order4-right">
				<table class="userInfo">
					<tr>
						<th>일반결제</th>
						<td>
							<label><input type="radio" name="paycheck" value="무통장입금"/>&nbsp;무통장입금</label>
							<label><input type="radio" name="paycheck" value="신용카드"/>&nbsp;신용카드</label>
							<label><input type="radio" name="paycheck" value="계좌이체"/>&nbsp;계좌이체</label>
							<label><input type="radio" name="paycheck" value="가상계좌"/>&nbsp;가상계좌</label>
							<label><input type="radio" name="paycheck" value="핸드폰"/>&nbsp;핸드폰</label>
						</td>
					</tr>
					<tr>
						<th>에스크로결제</th>
						<td>
							<input type="radio" name="" value="가상계좌"/>&nbsp;가상계좌<br/>
							<span id="payspan">(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다.)</span>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>현금영수증</th>
						<td>
							<input type="radio" name="lastcheck1" value="신청"/>&nbsp;신청 &nbsp;
							<input type="radio" name="lastcheck1" value="신청안함"/>&nbsp;신청안함
								<table>
									<tr>
										<th>발행 용도</th>
										<td>
											<input type="radio" name="lastcheck2" value="소득공제용"/>&nbsp;소득공제용 &nbsp;
											<input type="radio" name="lastcheck2" value="지출증빙용"/>&nbsp;지출증빙용
										</td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td><input type="text" name="phone"/>&nbsp;("-" 생략)</td>
									</tr>
								</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="buttonGroup">
				<img style="width: 90px" src=../images/btn_payment.gif onclick=""/>
				<img style="width: 90px" src=../images/btn_cancel.gif onclick=""/>
		</div>
	</div>
</body>
</html>