<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="/member/loginProc">
	<input type=text name="member_id">아이디<br>
	<input type=text name="member_pw">패스워드
		<button type="submit">로그인</button>
		<button type="button" id="joinmem">회원가입</button>
	</form>
	
	<script>
		$("#joinmem").on("click",function(){
			location.href="/member/joinForm"
			
		})
	
	
	</script>
</body>
</html>