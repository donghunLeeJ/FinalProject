<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<title>에러</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<script>
		alert("아이디 또는 비밀번호가 틀렸습니다");
		location.href="/member/loginForm";
	</script>
</body>
</html>