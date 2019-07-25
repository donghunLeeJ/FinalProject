<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메세지 전송 완료</title>
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<script>
		if(${result == 1}){
			alert("메세지 전송이 완료되었습니다");
			opener.parent.location.reload();
			window.close();
		}
	
	
	</script>
</body>
</html>