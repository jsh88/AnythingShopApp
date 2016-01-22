<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
</head>
<body>
	<form action="addProduct" enctype="multipart/form-data" method="post">
		상품이름 <input type="text" name="name" /> <br>
		카테고리 <input type="text" name="category" /><br>
		제품설명 <input type="text" name="explan" /><br>
		제품가격 <input type="text" name="price" /><br>
		제조사 <input type="text" name="maker" /><br>
		재고 <input type="text" name="quantity" /><br>
		대표이미지 <input type="file" name="image" /><br>
		상품소개이미지 <input type="file" name="dimage" /><br>
		<input type="button" value="미리보기"/>
		<input type="submit"/>
	</form>
</body>
</html>