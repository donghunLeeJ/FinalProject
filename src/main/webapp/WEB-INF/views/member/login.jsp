<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="http://fonts.googleapis.com/css?family=Open+Sans:400.300"
	rel="stylesheet" type="text/css">

<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- 눈모양 -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<title>로그인</title>
<style>
.float {
	float: left;
}

#flash {
	width: 27px;
	height: 27px;
}

.h {
	font-family: naBrush;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">

	<section class="section-padding-80"
		style="background-color: #f4ead0; padding-bottom:40px; ">
	<div class="container">
		<div class="row">
			<!-- Section Heading -->
			<div class="col-12">
				<div class="section-heading text-center" style="margin: 0px">
					<a href="/home"><img alt="" src="/img/logoimg.png"
						style="width: 40%"></a>

				</div>
			</div>


			<div class="col-12"></div>
		</div>

		<div class="row">
			<div class="col-12">
				<!-- Form -->
				<form action="/member/loginProc" id="login" method="post"
					class="akame-contact-form border-0 p-0">
					<div class="row">
						<div class="col-lg-12 text-center">
							<h3 class=h>ID</h3>
							<input type="text" style="width: 50%; margin: auto;"
								name="member_id" class="form-control mb-30" placeholder="id">
						</div>
						<div class="col-lg-12 text-center">
							<h3 class=h>Password</h3>
							<i class="fa fa-eye-slash fa-lg" id=flash></i> <input
								type="password" style="width: 50%; margin: auto;"
								name="member_pw" class="form-control mb-30 flash"
								placeholder="password">
						</div>
						<div class="col-12 text-center">
							<br> <br>
							<button type="submit" class="btn akame-btn btn-3 mt-15 active">log
								in</button>
							<button id="joinmem" type="button"
								class="btn akame-btn btn-3 mt-15 active">join member</button>
							<button id="find" type="button"
								class="btn akame-btn btn-3 mt-15 active">find ID/PW</button>
						</div>
						<div class="col-12 text-center" style="margin-top: 90px;">

							<h5>
								<small>Copyright © AKKABI Corp. All rights reserved.</small>
							</h5>

						</div>
					</div>

				</form>

			</div>
		</div>

	</div>
	</section>
	<script>
		$("#flash").on("click", function() {
			if ($(".flash").attr('type') == 'password') {
				$(this).attr('class', "fa fa-eye fa-lg");
				$(".flash").attr('type', 'text');
			} else if ($(".flash").attr('type') == 'text') {
				$(this).attr('class', "fa fa-eye-slash fa-lg")
				$(".flash").attr('type', 'password');
			}
		});

		$("#joinmem").on("click", function() {
			location.href = "/member/joinForm"
		})
		$("#find").on("click", function() {
			location.href = "/member/findinfo"
		})

		function press(f) {
			if (f.keyCode == 13) {
				$("#login").submit();
			}
		}
	</script>
</body>
</html>