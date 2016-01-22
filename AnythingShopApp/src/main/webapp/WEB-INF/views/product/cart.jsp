<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	font-size: 15px;
}
</style>
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
	<c:forEach var="p" items="${ pList }" varStatus="s">
	<table class="table" id="table${s.count }">
		<tr>
			<td><input type="checkbox" id="check${s.count }" checked onchange="changef(${s.count })"/></td>
			<td><img style="width: 100px; height: 100px" src="resources/images/${p.image }" /></td>
			<td>${p.name }</td>
			<td>판매가격 : ${p.price }
			<input type="hidden" id="price${s.count }" value="${p.price }"/>
			<input type="hidden" id="count${s.last }" value="${s.count }"/>
			</td>
			<td>
			구매수량 : <input type="text" id="quentity${s.count }" name="quentity"value="${p.quantity }" readonly  style="width:40px"/></td>
				<td><div style="padding:1 0 2 0"><img src=resources/images/btn_plus.gif  onclick="plus(${s.count })"/></div>
				<div style="padding:1 0 2 0"><img src=resources/images/btn_minus.gif  onclick="minus(${s.count })"/></div></td>
			<td>구매가격: <input type="text" id="result${s.count }" name="payprice" value="${p.price * p.quantity }" readonly/></td>
		</tr>
		</table>
		</c:forEach>
		총 구매 금액: <input type="text" id="payresult" name="payresult"  readonly/>
	<table>
	<tr>
	<td><img src=resources/images/btn_check_delete.gif onclick="checkdel()"/></td>
	<td><img src=resources/images/btn_check_order.gif onclick="pay()"/></td>
	<td><img src=resources/images/btn_empty2.gif onclick="del()"/></td>
	<td><img src=resources/images/btn_continue2.gif onclick="back()"/></td>
	</tr>
	</table>
</body>
</html>