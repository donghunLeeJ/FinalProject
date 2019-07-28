<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고하기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<style type="text/css">

</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">

<div class="container" style="width:450px;height:500px">
	<form action="reportRegister" method="post" id="report">
	<div class="row">
		<div class="col-12 border-bottom p-4">
		<input type="hidden" value="${seq }" name="tl_board_seq">	
		 <h2 style="color: gray"> <img alt="" src="/img/core-img/logo3.png" style="height: 80px">  </h2>
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
			<input class="btn btn-secondary" type="button" id="rpt" value="신고하기">
		</div>
	</div>
	</form>
</div>
<script type="text/javascript">
	$("#textWrite").focus();
	
	$("#rpt").on("click",function(){
		var emp = /^\s*$/g;
		if($("#textWrite").val()=="" || emp.test($("#textWrite").val())){
			alert("내용을 입력해주세요");
		}else if($("#textWrite").val().length>150){
			alert("제한 글자 수를 초과하였습니다");
		}else{
	removeXSS($("#textWrite").val(), $("#textWrite").attr("id"));
	$("#report").submit();
		}
	});

</script>


</body>
</html>