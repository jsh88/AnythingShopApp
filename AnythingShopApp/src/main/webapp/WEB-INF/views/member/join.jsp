<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#submit").click(
						function() {
							var id = $('input:text[name=id]').val();
							var pass = $('input:text[name=pw]').val();
							var passcheck = $('input:text[name=passcheck]')
									.val();
							var name = $('input:text[name=name]').val();
							var email = $('input:text[name=email]').val();
							var adress1 = $('input:text[name=addr]').val();
							var phone1 = $('input:text[name=phone1]').val();
							var phone2 = $('input:text[name=phone2]').val();
							var phone3 = $('input:text[name=phone3]').val();

							if (id == "" || pw == "" || passcheck == ""
									|| name == "" || email == "" || addr == ""
									|| phone1 == "" || phone2 == ""
									|| phone3 == "") {
								alert("*필수입력사항을 모두 작성하셔야 회원가입이 가능합니다.");
							} else {
								if (pass == passcheck) {
									document.location.href = "#";
								} else {
									alert("비밀번호와 비밀번호확인이 같지 않습니다.");
								}
							}
						});
			});
</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><img src="resources/images/title_join.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 회원가입 > 가입폼작성</td>
			</tr>
		</table>
		<div>
			<img src="resources/images/join_txt_04.gif" />* 필수입력사항<br />
			<form action="join" method="post">
				<table>
					<tr>
						<td>*아이디 <input type="text" name="id" /> <a href="#"><img
								src="resources/images/btn_idcheck.gif" /></a><br /> *비밀번호 <input
							type="text" name="pw" /><br /> *비밀번호확인 <input type="text"
							name="passcheck" /><br /> *이름 <input type="text" name="name" /><br />
							*이메일 <input type="text" name="email" /> <a href="#"><img
								src="resources/images/btn_mailcheck.gif" /></a> ※ 주문 관련 정보, 주요 공지사항
							및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.<br /> *주소 <input
							type="text" name="addr" style="width: 500px;" /><br /> *핸드폰<input
							type="text" name="phone1" />-<input type="text" name="phone2" />-<input
							type="text" name="phone3" />
						</td>
				</table><br>
				<input type="submit"/>
			</form>
			<a href="" onclick="submit()" id="submit"><img
				src="resources/images/btn_join.gif"></a> <a
				href="javascript:history.back()"><img
				src="resources/images/btn_back.gif"></a>
		</div>
	</div>
</body>
</html>