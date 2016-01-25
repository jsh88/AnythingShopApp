<%@page import="java.net.URLEncoder"%>
<%@page import="com.anyshop.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Product prod = (Product)request.getAttribute("prod");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.clear {
	clear: both;
}

.notice {
	font-size: 11px;
}
.detail{
margin:0 auto;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
function addCart(){
	var quentity = $('input:text[name=quentity]').val();
	if(quentity==""){
		alert('구매 수량을 작성하셔야 합니다.');
	}else{
	<%
	session.setAttribute("prod", prod);
	%>
	document.location.href = "addcart?quentity="+quentity;
	}
}

function plus(){
	var quentity = $('#quentity').val();
	quentity = Number(quentity)+1;
	$('#quentity').val(Number(quentity));
}
function minus(){
	var quentity = $('#quentity').val();
	if(quentity <= 1){
		alert('최소 한개 이상은 구매 하셔야 합니다.');
	}else{
		quentity = Number(quentity)-1;
		$('#quentity').val(Number(quentity));
	}
}

$(document).ready(function() {
	$('#quentity').val(1);
});

</script>
</head>
<body>
	<div class="detail" style="width:980px">
		<table>
			<tr>
				<td><img style="width: 400px; height: 400px"
					src="resources/images/${prod.image }" /></td>
				<td>${prod.name }<br /> ${prod.explan }<br /> <br /> 판매가격 :
					${prod.price }<br /> <br /> 제품상태 : 신상품 출시일 : ${prod.sDate }<br />
					브랜드 : ${prod.maker }<br /> 
					구매수량 : <input type="text" id="quentity" name="quentity" readonly  style="width:40px"/>
					<div style="padding:1 0 2 0">
					<img src=resources/images/btn_plus.gif  onclick="plus()"/>
					</div>
					<div style="padding:1 0 2 0">
					<img src=resources/images/btn_minus.gif  onclick="minus()"/>
					</div>
					<br /> 
					<img src="resources/images/icon_twitter.png" /> 
					<img src="resources/images/icon_facebook.png" /> 
					<img src="resources/images/icon_url.png" /><br />
					<a href="#"><img	src="resources/images/btn_direct_buy.jpg" /></a>
					<a href="javascript:addCart()"><img src="resources/images/btn_cart.jpg" /></a>
				</td>
			</tr>
		</table>
	</div>
	<div class="detail" style="width:980px">
		<img src="resources/images/${prod.dImage }" />
	</div>
	<div class="detail" style="width:980px">
		<p class="notice">배송/교환/ 반품 안내</p>
		<p class="notice">3만원 이상 무료배송이며 도서 산간지역에는 도선료가 추가될수 있습니다.평균 배송일은
			이틀이며 때에따라 3일이상 걸릴 수 있습니다.</p>
		<p class="notice">저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를
			부담하셔야 합니다(제품의 하자,배송오류는 제외)</p>
		<p class="notice">상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 일 이내라도 교환 및 반품이
			불가능합니다.</p>
		<p class="notice">일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이
			불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오.</p>
	</div>
</body>
</html>