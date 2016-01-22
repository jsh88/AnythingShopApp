<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.clear {
	clear: both;
}

section {
	margin: 0 auto;
}
</style>
</head>
<body>
	<div>
		<div class="clear"></div>
			<%@ include file="/WEB-INF/views/include/header.jsp"%><br />
		
			<div class="clear"></div>
			<jsp:include page="${ param.body }" />
		
			<div class="clear"></div>
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			
	</div>
</body>
</html>