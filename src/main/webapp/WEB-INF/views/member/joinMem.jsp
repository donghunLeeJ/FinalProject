<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">

<style>
.title {
	text-align: left;
	margin-left: 26%;
}

#addinput {
	float: left;
	padding-right: 10px;
}
#datepicker {
	position: relative;
	width : 50px;
}
</style>

</head>
<body>
 

	<section class="akame-contact-area bg-gray section-padding-80">
	<div class="container">
		<div class="row">
			<!-- Section Heading -->
			<div class="col-12">
				<div class="section-heading text-center">
					<img alt="" src="/img/core-img/fakelogo.png" style="width: 30%">

				</div>
			</div>


			<div class="col-12">
				<div class="section-heading text-center">
					<h2>회원가입</h2>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<!-- Form -->
				<form id=form action="/member/joinProc" method=post
					class="akame-contact-form border-0 p-0">

					<div class="row">
						<div class="col-lg-12 text-center">
							<div class=title>아이디</div>
							<input type="text" style="width: 48%; margin: auto;" id=id
								name="member_id" class="form-control mb-30" placeholder="id">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>비밀번호</div>

							<input type="password" style="width: 48%; margin: auto;" id=pw
								name="member_pw" class="form-control mb-30"
								placeholder="password">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>비밀번호 확인</div>

							<input type="password" id="pwCheck"
								style="width: 48%; margin: auto;" class="form-control mb-30"
								placeholder="passwordCheck">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>이름</div>

							<input type="text" id="name" name="member_name" style="width: 48%; margin: auto;" class="form-control mb-30" placeholder="name">
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-6" style="margin: auto">
							<div >생년월일</div>
					
						<input id="datepicker"   class="form-control mb-30" />
   
   						</div>
						<script>
							$('#datepicker').datepicker({
								uiLibrary : 'bootstrap4',
							});
						
						</script>

						<div class="col-lg-12 text-center">
							<div class=title>성별</div>
							<input type="radio" id="man" name=member_gender value="M"
								checked="checked">남자 <input type="radio" id="woman"
								name=member_gender value="W">여자

						</div>
						<br>

						<div class="col-lg-12 text-center">
							<div class=title>전화번호</div>

							<input type="text" name=member_phone id=phone
								style="width: 48%; margin: auto;" class="form-control mb-30"
								placeholder="phone">
						</div>


						<div class="col-12 text-center">
							<br>
							<br>
							<button type="button" class="btn akame-btn btn-3 mt-15 active"
								id=send>가입하기</button>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>



	<script>
		//여기서 부터 가입버튼 눌렀을때 실행
		$("#send").on("click",
				function() {
					if ($("#id").val() == "") {
						alert("아이디를 입력하세요");
						$("#id").focus();
					} else if ($("#pw").val() == "") {
						alert("비밀번호를 입력하세요");
						$("#pw").focus();
					} else if ($("#pwCheck").val() == "") {
						alert("비밀번호확인을 입력하세요");
						$("#pwCheck").focus();
					} else if ($("#pw").val() != $("#pwCheck").val()) {
						$("#pw").val("");
						$("#pwCheck").val("");
						alert("비밀번호가 일치하지 않습니다");
						$("#pw").focus();
					} else if ($("#name").val() == "") {
						alert("이름을 입력하세요");
						$("#name").focus();
					} else if ($("#birth").val() == "") {
						alert("생년월일을 입력하세요");
					} else if ($("#add").val() == "") {
						alert("주소를 입력하세요");
					} else if ($("#phone").val() == "") {
						alert("번호를 입력하세요");
					} else if ($("#man").is(':checked') == false
							&& $("#woman").is(':checked') == false) {
						alert("남자또는 여자를  꼭 선택하세요!");
					} else {
						$("#form").submit();
					}
				})
		$("#pwCheck").on("focus", function() {
			if ($("#pw").val().length == 0) {
				alert("비밀번호 먼저 입력하세요");
				$("#pw").focus();
			}
		})
		$("#pwCheck").on("focusOut", function() {
			if ($("#pw").val() == $("#pwCheck").val()) {
				alert("비밀번호가 일치합니다");
			}
		})

		//데이터피커 -----------------------------------------------------------
		
	
	</script>



</body>
</html>