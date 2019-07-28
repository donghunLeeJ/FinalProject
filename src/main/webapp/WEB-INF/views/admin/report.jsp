<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고창</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col" colspan="2">${SNSReport.tl_board_seq}번 글의 신고내용</th>

				</tr>
			</thead>
			<tbody>

				<tr>
					<th scope="row">글 제목</th>
					<td>${SNSReport.tl_title}</td>
				</tr>

				<tr>
					<th scope="row">신고자</th>
					<td>${SNSReport.tl_reporter}</td>
				</tr>

				<tr>
					<th scope="row">신고 사유</th>
					<td>${SNSReport.tl_reason}</td>
				</tr>
			</tbody>
		</table>

		<div class="form-group mt-4">
			<label for="exampleFormControlTextarea1">신고자에게 보낼 메시지</label>
			<textarea class="form-control" id="UserSand" rows="3"></textarea>
		</div>

		<div class="row">
			<div class="col-6"></div>
			<input class="btn btn-outline-dark col-3" id="ReportCancel"
				value="신고취소하기">
				<div class="col-1"></div>
			<input class="btn btn-outline-dark col-2" id="ReportSandBtn"
				value="보내기">
		</div>
		<!--컨테이너 끝 -->
	</div>


	<script>
	
		//서버로 신고자에게 보낼 내용을 전송한다.
		$("#ReportSandBtn").on("click", function() {

			if ($("#UserSand").val() == "") {

				alert("신고자에게 보낼 메시지를 입력해 주세요.");

			} else {

				$.ajax({

					url : "/admin/ReportSandMessage",
					type : "post",
					data : {
						message_contents : $("#UserSand").val(),
						message_getter : "${SNSReport.tl_reporter}"
					}

				}).done(function(resp) {

					alert("정상적으로 수신 완료");
					opener.parent.location.reload();
					window.close();

				}).fail(function() {

					alert("에러 발생!");
					
				});
			}
		})

		
		//신고상태를 원래대로 돌리고 싶을 때 서버로 전송시킴
		$("#ReportCancel").on("click", function() {
			$.ajax({

				url :"/admin/ReportCancel",
				type :"post",
				data :{tl_board_seq : "${SNSReport.tl_board_seq}"}
			
			}).done(function(resp) {

				alert(resp);
				opener.parent.location.reload();
				window.close();

			}).fail(function() {

				alert("에러 발생!");

			});
		})
		
	</script>

</body>
</html>