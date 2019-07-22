<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
	

</style>
</head>
<body >

<div class="container" style="width:450px;height:500px">
	<form action="reportRegister" method="post">
	<div class="row">
		<div class="col-12 border-bottom p-4">
		<input type="hidden" value="${seq }" name="tl_board_seq">	
		 <h2 style="color: gray"> <img alt="" src="/img/core-img/logo.png"> 신고하기 </h2>
		</div>
		<div class="col-12">
			폭력적 게시물 , 선정적 게시물 등 악의적인 의도를 가지고 올린 게시물에 관하여 신고가 가능합니다.	
			<br>	
		</div>
		<div class="col-12">
			- 신고 사유
		</div>
		<div class="col-12">
			<textarea id="textWrite" style="width:413px;height:300px;resize: none;" name="tl_reason">
			
			</textarea>
		</div>
		<div class="col-12 p-2">
			<input class="btn btn-secondary" type="submit" value="신고하기">
		</div>
	</div>
	</form>
</div>
<script type="text/javascript">
	$("textWrite#").focus();



</script>


</body>
</html>