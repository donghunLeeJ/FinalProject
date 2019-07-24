<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<div class="row">
		<div class="col-12">
			<!-- Form -->


			<div class="row">
				<div class="col-lg-12 text-center">
					<h3>ID</h3>
					<input type="text" style="width: 50%; margin: auto;" id="member_id"
						class="form-control mb-30" placeholder="id">
				</div>
				<div class="col-lg-12 text-center">
					<h3>Password</h3>
					<i class="fa fa-eye fa-lg" id=flash></i> <input type="password"
						style="width: 50%; margin: auto;" id="member_pw"
						class="form-control mb-30 flash" placeholder="password">
				</div>
				<div class="col-12 text-center">
					<br> <br>
					<button id="login" type="button"
						class="btn akame-btn btn-3 mt-15 active">로그인</button>
					<button id="joinmem" type="button"
						class="btn akame-btn btn-3 mt-15 active">회원가입</button>
					<button id="find" type="button"
						class="btn akame-btn btn-3 mt-15 active">아이디/패스워드 찾기</button>
				</div>
			</div>

		</div>
	</div>
	<script>
		$("#login").on("click", function() {
			var id = $("#member_id").val();
			var pw = $("#member_pw").val();
		

			$.ajax({
				url : "/member/minilogin",
				type : "post",
				data : {
					id : id,
					pw : pw
				}
			}).done(function(resp) {
				if (resp == 1) {
					removeXSS($("#member_id").val(), $("#member_id").attr("id"));
					removeXSS($("#member_pw").val(), $("#member_pw").attr("id"));
					alert("로그인 되었습니다.");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("아이디나 비밀번호가 옳지 않습니다")
				}

			})
		})

		$("#joinmem").on("click", function() {
			opener.parent.location.href = "/member/joinForm";
			window.close();

		})
		$("#find").on("click", function() {
			opener.parent.location.href = "/member/findinfo";
			window.close();

		})
	</script>


</body>
</html>