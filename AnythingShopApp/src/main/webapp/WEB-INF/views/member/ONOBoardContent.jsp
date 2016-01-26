<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delebtn(bNo){
	 if(confirm("정말 삭제 하시겠습니까?")) {
			document.location.href="deleteonoboard?bNo=" + bNo;
		}
}
function update(bNo){
		window.open('onoboardupdate?bNo=' + bNo, '1:1문의작성', 'width=600, height=500, menubar=no, status=no, toolbar=no');
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
				<th>아이디</th>
				<td><c:out value="${sessionScope.member.id }" /></td>
			</tr>
			<tr>
				<th>질문유형</th>
				<td>
					${ono.type }
				</td>
			</tr>
			<tr>
				<th>주문번호</th>
				<td>
					${ono.oNo }
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					${ono.email }
				</td>
			</tr>
			<tr>
				<th>문자메시지</th>
				<td>
					${ono.phone }
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					${ono.title }
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="52" rows="10" readonly>${ono.content }</textarea>
				</td>
			</tr>
		</table>
		<input type ="button" onclick="update(${ono.bNo})" value="수정하기"/>
		<input type ="button" onclick="delebtn(${ono.bNo})" value="삭제하기"/>
</body>
</html>