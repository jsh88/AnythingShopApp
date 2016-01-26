<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function write(){
	window.open('onoboardwrite', '1:1문의작성', 'width=600, height=500, menubar=no, status=no, toolbar=no');
}
</script>
</head>
<body>
	<table>
			<tr>
				<td><img src="resources/images/title_mantoman.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 마이페이지 > 1:1문의게시판</td>
			</tr>
	</table>
			<table>
				<tr>
					<th>번호</th>
					<th>질문유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			<c:forEach var="ob" items="${ onoList }">
			<tr>
				<td>${ob.bNo }</td>
				<td>${ob.type }</td>
				<td><a href="onocontent?bNo=${ob.bNo }">${ob.title }</a></td>
				<td>${ob.id }</td>
				<td>${ob.cdate }</td>
			</tr>
			</c:forEach>
		</table>
		<br>
		<a href="javascript:write()"><img src="resources/images/btn_write.gif"/></a>
</body>
</html>