<%@page import="com.anyshop.domain.Member"%>
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
						function submit() {
							var id = $('input:text[name=id]').val();
							var name = $('input:text[name=name]').val();
							var email = $('input:text[name=email]').val();
							var addr = $('input:text[name=addr]').val();
							var phone1 = $('input:text[name=phone1]').val();
							var phone2 = $('input:text[name=phone2]').val();
							var phone3 = $('input:text[name=phone3]').val();

							if (id == "" || name == "" || email == "" || addr == ""
									|| phone1 == "" || phone2 == ""
									|| phone3 == "") {
								alert("*필수입력사항을 모두 작성하셔야 회원가입이 가능합니다.");
							} else{
								document.updateform.submit();
							}
						}
</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><img src="resources/images/title_modifyinfo.gif" /></td>
			</tr>
			<tr>
				<td>HOME > 회원가입 > 회원정보수정</td>
			</tr>
		</table>
	</div>
	<div>
		<img src="resources/images/join_txt_04.gif" />* 필수입력사항<br />
	</div>
	<div>
	<form name="updateform" action="update" method="post" >
	<table>
		<c:set var="phone" value="${member.phone}"/>
					<tr>
						<td>*아이디 <input type="text" name="id" value="${member.id }" readonly/><br /> 
						*비밀번호 <a href=""><img src="resources/images/btn_change_pwd.gif"/></a><br /> 
						*이름 <input type="text" name="name" value="${member.name }" readonly/><br />
						*이메일 <input type="text" name="email" value="${member.email }"/> 
						<a href="#"><img src="resources/images/btn_mailcheck.gif" /></a> ※ 주문 관련 정보, 주요 공지사항
							및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.<br /> 
						*주소 <input type="text" name="addr" style="width: 500px;" value="${member.addr }" /><br />
						*핸드폰<input type="text" name="phone1" value="${member.phone}" />-
						<input type="text" name="phone2" value="${member.phone}"/>
						-<input type="text" name="phone3" value="${member.phone}"/>
						</td>
				</table><br>
			</form >
			<a href="javascript:submit()" target="mypagefr">
			<img src="resources/images/btn_modify_info.gif"></a> 
			<a href="javascript:history.back()"><img src="resources/images/btn_back.gif"></a>
		</div>
</body>
</html>