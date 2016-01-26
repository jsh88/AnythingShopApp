<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function onosubmit(){
	self.close();
}
</script>
</head>
<body>
<img src="resources/images/popup_title_mantoman.gif"/>
	<div>
	<form id="writeform" action="onoboardupdateresult" target="mypagefr">
		<table>
			<tr>
				<th>아이디</th>
				<td><c:out value="${sessionScope.member.id }" />
				<input type="hidden" name="id" value="${sessionScope.member.id }"/>
				<input type="hidden" name="bNo" value="${ono.bNo }"/></td>
			</tr>
			<tr>
				<th>질문유형</th>
				<td>
					<select name="type">
					<option value="">상담내용을 선택하세요.</option>
					<option value="반품문의">반품문의</option>
					<option value="A/S문의">A/S문의</option>
					<option value="환불문의">환불문의</option>
					<option value="주문결재문의">주문결재문의</option>
					<option value="취소문의">취소문의</option>
					<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주문번호</th>
				<td>
					<input type="text" name="ono" value="${ono.oNo }"/>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" value="${ono.email }"/>
				</td>
			</tr>
			<tr>
				<th>문자메시지</th>
				<td>
					<c:set var="phone" value="${ono.phone}"/>
					<input type="text" name="phone1" value="${fn:substring(phone,0,3)}" style="width:10%"/>-
					<input type="text" name="phone2" value="${fn:substring(phone,4,8)}" style="width:10%"/>-
					<input type="text" name="phone3" value="${fn:substring(phone,9,13)}" style="width:10%"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" style="width:80%" value="${ono.title }"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="52" rows="10">${ono.content }</textarea>
				</td>
			</tr>
		</table>
		<input type="image" src="resources/images/btn_upload.gif" onclick="onosubmit()"/>
		</form>
	</div>
</body>
</html>