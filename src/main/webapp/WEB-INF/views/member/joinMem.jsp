<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/member/joinProc">
	<input type=text name="member_id" placeholder=아이디><br>
	<input type=text name="member_pw" placeholder=비밀번호><br>
	<input type=text name=member_name placeholder=이름><br>
	<input type=text name=member_birth placeholder=생년월일><br>
	<input type=text name=member_gender placeholder=성별><br>
	<input type=text name=member_add placeholder=주소><br>
	<input type=text name=member_phone placeholder=폰번호>
	<button>가입</button>
	</form>
</body>
</html>