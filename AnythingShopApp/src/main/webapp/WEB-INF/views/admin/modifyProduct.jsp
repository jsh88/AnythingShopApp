<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
</head>
<body>
	<form action="modifyProduct" enctype="multipart/form-data" method="post">
		<input type="hidden" name="pno" value="${p.pNo }"/>
		상품이름 <input type="text" name="name" value="${p.name }" /><br>
		카테고리 <input type="text" name="category" value="${p.category }" /><br>
		제품설명 <input type="text" name="explan" value="${p.explan }" /><br>
		제품가격 <input type="text" name="price" value="${p.price }" /><br>
		제조사 <input type="text" name="maker" value="${p.maker }" /><br>
		재고 <input type="text" name="quantity" value="${p.quantity }" /><br>
		대표이미지 <input type="file" name="image" value="${p.image }" /><br>
		상품소개이미지 <input type="file" name="dimage" value="${p.dImage }" /><br>
		<input type="button" value="미리보기"/>
		<input type="submit"/>
	</form>
</body>
</html>