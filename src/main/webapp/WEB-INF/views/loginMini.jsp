<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/cross.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<!-- 지우지 말 것 -->
<style>
html {
	overflow: hidden;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

#login {
	color: white;
	height: 50px;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<div class="container-fluid">
		<div class="row border-bottom mt-2">
			<div class="col-12">
				<img src="/img/core-img/logo4.png"
					style="width: 80px; height: 40px; padding: 0; margin-bottom: 5px;">
			</div>


		</div>

		<!-- Form -->

		<div class="container  mt-2" style="width: 400px; height: 430px;">
			<div class="row ">
				<div class="col-12 mt-2">
					<h4>AGGABI</h4>
				</div>
				<div class="col-lg-12 text-center mt-4">
					<h3>ID</h3>
					<input type="text" id="member_id" class="form-control mb-30"
						placeholder="이메일을 입력해주세요.">
				</div>
				<div class="col-lg-12 text-center mt-2">
					<h3>Password</h3>
					<i class="fa fa-eye fa-lg" id=flash></i> <input type="password"
						id="member_pw" class="form-control mb-30 flash"
						placeholder="패스워드를 입력해주세요.">
				</div>
				<div class="col-12 text-center mt-4">
					<button id="login" type="button"
						class="btn form-control btn-primary">로그인</button>
				</div>
			</div>
			<hr style="margin-top: 60px; margin-bottom: 0">
			<div class="row">

				<div class="col-4">

					<button id="joinmem" type="button"
						class="btn akame-btn btn-3 mt-15 active">
						<small>회원가입</small>
					</button>
				</div>
				<div class="col-8  text-right">
					<button id="find" type="button"
						class="btn akame-btn btn-3 mt-15 active">
						<small>아이디/패스워드 찾기</small>
					</button>

				</div>
			</div>
		</div>
		<div class="row border-top mt-4">
			<div class="col-12 text-center mt-3">
				<a href="#">이용약관 |</a> <a href="#">개인정보 취급방침 |</a> <a href="#">운영정책
					| </a> <a href="#">공지사항</a>

			</div>
			<div class="col-12 text-center mt-1">
				<small>Copyright © AGGABI Corp. All rights reserved.</small>
			</div>
		</div>

	</div>
	<script>
		loginClick = function() {
			var id = $("#member_id").val();
			var pw = $("#member_pw").val();

			$
					.ajax({
						url : "/member/minilogin",
						type : "post",
						data : {
							id : id,
							pw : pw
						}

					})
					.done(
							function(resp) {

								if (resp == 1) {
									removeXSS($("#member_id").val(), $(
											"#member_id").attr("id"));
									removeXSS($("#member_pw").val(), $(
											"#member_pw").attr("id"));
									alert("로그인 되었습니다.");
									opener.parent.location.reload();
									window.close();

								} else if (resp == -1) {

									alert("해당 id는 블랙리스트로 등록되어 로그인을 할 수 없으니 관리자에게 문의해주세요.");

								} else {

									alert("아이디나 비밀번호가 옳지 않습니다");
								}
							})
		}
		$("#member_pw").keydown(function(key) {

			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				loginClick();
			}
		})

		$("#login").on("click", function() {
			loginClick();
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