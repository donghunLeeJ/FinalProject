<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 이동</title>
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<script>
		var confirm = confirm("장바구니로 이동 하시겠습니까?")
		
		if(confirm == true){
			location.href="/Basket/basketList";
		}else{
			null;
		}
		
	</script>
</body>
</html>