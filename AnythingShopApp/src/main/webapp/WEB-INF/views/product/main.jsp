<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	width: 280px;
	font-size: 13px;
}

table {
	border: 1px solid black;
	margin: 6px;
}

#product {
	float: left;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<c:forEach var="p" items="${ pList }">
		<div id="product">
			<table>
				<tr>
					<td><label><a href="proddetail?pNo=${p.pNo }"> <img
								src="resources/images/${p.image}"><br /> ${ p.name }<br />
								${ p.explan }<br /> ${ p.price }<br /></a></label></td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>