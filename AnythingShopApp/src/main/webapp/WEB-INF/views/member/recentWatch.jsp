<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function detail(pNo){
	parent.document.location.href="proddetail?pNo="+pNo;
}
</script>
</head>
<body>
<div>
		<table>
			<tr>
				<td><img src="resources/images/title_orderlist.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 최근본상품</td>
			</tr>
		</table>
		<table>
		<tr>
		<th>사진</th>
		<th>제품명</th>
		<th>가격</th>
		</tr>
		<c:forEach var="c" items="${ cookieList }">
		
				<tr>
					<td><a href="javascript:detail(${c.pNo })">
					<img src="resources/images/${c.image }" style="width:100px;height:100px"/></a></td>
					<td>${c.name }</td>
					<td>${c.price }</td>
				</tr>
				
			</c:forEach>
			</table>
	</div>
</body>
</html>