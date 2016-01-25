<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<img src="resources/images/popup_title_mantoman.gif"/>
	<div>
		<table>
			<tr>
				<th>아이디</th>
				<td><c:out value="${sessionScope.member.id }" /></td>
			</tr>
			<tr>
				<th>질문유형</th>
				<td>
					<select>
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
					<input type="text" name="ono" />
					<a>
						<img src="resources/images/btn_inquiry_order.gif"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" />
				</td>
			</tr>
			<tr>
				<th>문자메시지</th>
				<td>
					<input type="text" name="phone1" style="width:10%" />-
					<input type="text" name="phone2" style="width:10%"/>-
					<input type="text" name="phone3" style="width:10%"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" style="width:80%"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="52" rows="10"></textarea>
				</td>
			</tr>
		</table>
		<a><img src="resources/images/btn_upload.gif"/></a>
	</div>
</body>
</html>