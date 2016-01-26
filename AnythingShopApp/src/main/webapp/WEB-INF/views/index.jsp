<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="resources/css/template.css" rel="stylesheet"/>
</head>
<body>
	<div>
		<div id="header">
		<%@ include file="include/headertest.jsp" %>
		</div>
		<div id="mainWrap">
			<jsp:include page="${param.body }"/>
		</div>
		<%@ include file="include/footertest.jsp" %>
	</div>
</body>
</html>