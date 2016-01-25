<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="resources/css/cart.css" rel="stylesheet"/>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
function priceupdateplus(count){
	var quentity = $('#quentity'+count).val();
	var price = $('#price'+count).val();
	var result = Number(price) * Number(quentity);
	$('#result'+count).val(result);
	payresultplus(count);
}

function priceupdateminus(count){
	var quentity = $('#quentity'+count).val();
	var price = $('#price'+count).val();
	var result = Number(price) * Number(quentity);
	$('#result'+count).val(result);
	payresultminus(count);
}

function plus(count){
	var quentity = $('#quentity'+count).val();
	quentity = Number(quentity)+1;
	$('#quentity'+count).val(Number(quentity));
	priceupdateplus(count);
}
function minus(count){
	var quentity = $('#quentity'+count).val();
	if(quentity <= 1){
		alert('최소 한개 이상은 구매 하셔야 합니다.');
	}else{
		quentity = Number(quentity)-1;
		$('#quentity'+count).val(Number(quentity));
		priceupdateminus(count);
	}
	
}

function payresultplus(count){
	var result = Number($('#payresult').val());
	var i = count;
	var checked = $('#check'+i).is(":checked");
		if(checked==true){
			result += Number($('#price'+i).val());
			$('#payresult').val(result);
		}
		
}

function payresultminus(count){
	var result = Number($('#payresult').val());
	var i = count;
	var checked = $('#check'+i).is(":checked");
		if(checked==true){
				result -= Number($('#price'+i).val());
				$('#payresult').val(result);
		}
}

$(document).ready(function() {
	var result = Number($('#payresult').val());
	var i = 1;
	$(".table input:checked").each(function(){
		var checked = $('#check'+i).is(":checked");
		if(checked==true){
			if(isNaN($('#result'+i).val())){
				i++;
			}else{
			result += Number($('#result'+i).val());
			i++;
			}
		}
		});
		$('#payresult').val(result);
});

function changef(count){
	var result = Number($('#payresult').val());
	var i = count;
		var checked = $('#check'+i).is(":checked");
		if(checked==true){
			if(isNaN($('#result'+i).val())){
			}else{
			result += Number($('#result'+i).val());
			$('#payresult').val(result);
			}
		}else{
			if(isNaN($('#result'+i).val())){
			}else{
				result -= Number($('#result'+i).val());
				$('#payresult').val(result);
			}
		}
}

function pay() {
	
	var count = $('.table').length;
	var result = "";
	for(var i = 0; i < count; i++) {
		
		if($('#check' + i).is(":checked")) {
			result += "c" + i + "=" + i + "&";
		}
	}
	
	location.href="orderPage?" + result + "count=" + count;
	
}

function back(){
	document.location.href="index"
}
function del(){
		$('.table').remove();
		$('#payresult').val(0);	
} 
function checkdel(){
	$(".table input:checked").each(function(){
		var checked = $(this).is(":checked");
		if(checked==true){
		$(this).parents("table").remove();
		}
		});
	$('#payresult').val(0);	
}
</script>
</head>
<body>
	<div id="cartWrap">
		<div id="cartTitle">
			<img src="resources/images/title_cart.gif"/>
		</div>
		<div id="shoproot">
			HOME&nbsp;&gt;&nbsp;<a href="#"><b>장바구니</b></a> 
		</div>
		<div id="cartList">
			<table id="cartTable" class="table">
				<tr>
					<th width="5%">선택</th>
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
				<c:forEach var="p" items="${ pList }" varStatus="s">
				<tr>
					<td width="5%"><input type="checkbox" id="check${s.count }" checked onchange="changef(${s.count })" /></td>
					<td width="10%" ><img style="width: 80px; height: 80px" src="resources/images/${p.image }" /></td>
					<td width="30%">${p.name }</td>
					<td width="10%">${p.price } <input type="hidden" id="price${s.count }" value="${p.price }" />
					<input type="hidden" id="count${s.last }" value="${s.count }" /></td>
					<td width="15%"><input type="text" id="quentity${s.count }" name="quentity" value="${p.quantity }" readonly /></td>
					<td width="10%"><img src="resources/images/btn_plus.gif" onclick="plus(${s.count })" />
					<img src="resources/images/btn_minus.gif" onclick="minus(${s.count })" /></td>
					<td width="20%"><input type="text" id="result${s.count }" name="payprice" value="${p.price * p.quantity }" readonly /></td>
				</tr>
				</c:forEach>
			</table>
			<div id="cartbottom">
				<div id="price">
				
					<p><div id="pc"><b><input type="text" id="payresult" name="payresult" readonly /></b></div><div id="p">상품합계금액</div></p>
				</div>
			</div>
			<div id="buttonGroup">
				<img src=resources/images/btn_check_delete.gif onclick="checkdel()"/>
				<img src=resources/images/btn_check_order.gif onclick="pay()"/>
				<img src=resources/images/btn_empty2.gif onclick="del()"/>
				<img src=resources/images/btn_continue2.gif onclick="back()"/>
			</div>
		</div>
	</div>
</body>
</html>