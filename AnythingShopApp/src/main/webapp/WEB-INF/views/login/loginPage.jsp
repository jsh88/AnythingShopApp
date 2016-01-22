<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
로그인<br>
	<form action="loginProcess" method="post">
		아이디 : <input type="text" name="id" placeholder="아이디를 입력해주세요." /> <br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력해주세요"/> <br>
	<input type="submit" value="로그인"/><br><br>
	</form>
	
	회원이 아니셈? <input type="button" value="회원가입"/><br>
	아이디 잊어먹으심? <input type="button" value="아이디찾기"/><br>
	비밀번호 까먹음? <input type="button" value="비밀번호찾기"/><br><br>
	
비회원 주문/배송 조회<br>
	<form action="orderSearch" method="post">
		주문자명 : <input type="text" name="name" placeholder="주문자명을 입력해주세요." /> <br>
		주문번호 : <input type="text" name="ono" placeholder="주문번호를 입력해주세요"/> <br>
	</form>
</body>
</html>