<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러</title>
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
<script>
alert("재고가 남지 않았습니다. 장바구니를 초기화 해주세요");
location.href="/Basket/basketList?id=${id.member_id}";
</script>
</body>
</html>