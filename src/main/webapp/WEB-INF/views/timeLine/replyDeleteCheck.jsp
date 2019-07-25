<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply Delete Reject Page</title>
</head>
<body>
	<script>
	if(${check } == 1){
		alert("본인만 댓글을 지울 수 있습니다");
		location.href = "/timeline/accessTimeLine?seq=1";
	}
	
	
	</script>
</body>
</html>