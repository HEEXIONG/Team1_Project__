<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<h1>register</h1>
<form action="/board/register" method="post">
상품명<input type="text" name="title">
상품정보<input type="text" name="pinfo">
판매자<input type="text" name="celler">
가격<input type="number" name="price">
<input type="submit">
</form>
</body>
</html>