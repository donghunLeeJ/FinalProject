<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보낸 쪽지함 내용</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">
</head>
<body>
	<div class="container text-center">
		<h2 class="mt-4">클릭한 글의 내용</h2>
		<hr class="my-4">
		${Message_PageContents.message_contents}

		<hr class="my-4">

		<div class="row">
			<div class="col-8"></div>

			<input class="btn btn-outline-dark col-3" id="CloseBtn" value="창 닫기">
		</div>

		<!--컨테이너 끝 -->
	</div>

	<script>
		$("#CloseBtn").on("click", function() {

			window.close();

		})
	</script>
</body>
</html>