<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="http://fonts.googleapis.com/css?family=Open+Sans:400.300"
	rel="stylesheet" type="text/css">

<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- 눈모양 -->
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">

<style>
.section {
	border-box: box-sizing;
}

.title {
	text-align: left;
	margin-left: 26%;
	font-family: naBrush;
}

#addinput {
	float: left;
	padding-right: 10px;
}

#findAdd {
	padding: 0px;
	width: 27px;
	height: 27px;
	margin: 0px;
}

#datepicker {
	position: relative;
	width: 50px;
}

#flash {
	width: 27px;
	height: 27px;
}

.float {
	float: left;
}

#gen {
	transform: translate(20px);
}

.form-control[readonly] {
	background-color: white;
}

.h2 {
	font-family: 'Josefin Sans', sans-serif;
}
.title{
	font-family: 'Josefin Sans', sans-serif;
}

</style>

<script type="text/javascript" src="/js/cross.js"></script>
</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">

	<section class="section" style="background-color: #f4ead0">
	<div class="container">
		<div class="row pt-3" style="height: 250px;">
			<!-- Section Heading -->
			<div class="col-6 mt-2">
				<div class="section-heading text-right">
					<img alt="" src="/img/logoimg.png"
						style="width: 250px; height: 150px; margin-top: 50px;">

				</div>

			</div>
			<div class="col-6 text-left" style="margin-top: 120px">
				<div class="section-heading ">
					<h2 class=h2>회원가입</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<!-- Form -->

				<form id="formproc" action="/member/joinProc" method=postclass="akame-contact-formborder-0p-0">


					<div class="row">
						<div class="col-lg-12 text-center">
							<div class=title>아이디</div>

							<input type="text" style="width: 48%; margin: auto;" id=id
								name="member_id" class="form-control mb-30"
								placeholder="인증 받을 이메일 형식으로 입력해주세요">

						</div>
						<div class="col-lg-12 text-center">
							<div class=title>
								비밀번호
								<!--                      <img src="/img/button-img/flash.png" id="flash"> -->
								<i class="fa fa-eye-slash fa-lg" id=flash></i>
								<span id=returnPW></span>
							</div>

							<input type="password" style="width: 48%; margin: auto;" id=pw
								name="member_pw" class="form-control mb-30 flash"
								placeholder="대,소문자,숫자 포함 8~13자리">

						</div>
						<div class="col-lg-12 text-center">
							<div class=title>비밀번호 확인</div>

							<input type="password" id=pwCheck
								style="width: 48%; margin: auto;"
								class="form-control mb-30 flash"
								placeholder="대,소문자,숫자 포함 8~13자리">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>이름</div>


							<input type="text" id="name" name="member_name"
								style="width: 48%; margin: auto;" class="form-control mb-30"
								placeholder="한글 2자 이상, 4자 이하">
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-6" style="margin: auto">
							<div>생년월일</div>
							<input id="datepicker" name="member_birth"
								class="form-control mb-30" readonly />
						</div>
						<script>
						var today = new Date(new Date().getFullYear(),
								new Date().getMonth(), new Date().getDate());
// 						var endDate = new Date(new Date().getFullYear()-10,
// 								new Date().getMonth(), new Date().getDate());
							$('#datepicker').datepicker({
								uiLibrary : 'bootstrap4',
								format : "yyyy-mm-dd",
								maxDate : today
							});
		
						</script>

						<div class="col-lg-12 text-center">
							<div class=title>핸드폰 번호</div>
							<input type="text" name=member_phone id=phone
								style="width: 48%; margin: auto;" class="form-control mb-30"
								placeholder=" '-'를 제외하고 입력해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>

						<div class="col-lg-12 ">
							<div class=title id=addinput>주소 입력</div>
							<!--                   <input id=addbtn type="button" class="mb-12 mb-2" value="우편번호 찾기" -->
							<!--                      id="search"> -->
							<img src="/img/core-img/find_addr.png"
								onclick="sample4_execDaumPostcode()" class=" img-circle"
								data-aria-haspopup="true" aria-expanded="false" id="findAdd">
						</div>
						<div class="col-lg-12 text-center">

							<input type="text" id="postcode"
								style="width: 48%; margin: auto;" name="member_postcode"
								class="form-control mb-30" placeholder="우편번호" readonly><br>
							<input type="text" id="add1" style="width: 48%; margin: auto;"
								name="member_address1" class="form-control mb-30"
								placeholder="도로명 주소" readonly><br> <input
								type="text" id="add2" style="width: 48%; margin: auto;"
								name="member_address2" class="form-control mb-30"
								placeholder="상세 주소 / 최대 20자"> <br>


						</div>


						<div class="col-lg-12 ">
							<div class="title float">성별</div>
							<div class="float" id="gen">
								<input type="radio" id="man" name=member_gender value="M"
									checked="checked">남자 <input type="radio" id="woman"
									name=member_gender value="W">여자
							</div>
						</div>
						<br>

						<div class="col-12 text-center">
							<br> <br>
							<button type="button" class="btn akame-btn btn-3 mb-80 active"
								id=send>가입하기</button>

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
		
		$("#pw").on("input",function(){
			var regH=/[A-Z]{4,}/g;
			var regM=/[A-Z]{2,3}/g;
			
			if(regH.test($("#pw").val())&& $("#pw").val().length>10){
				$("#returnPW").css('color','red');
				$("#returnPW").text('매우 어려움');
			}	
			else if(regM.test($("#pw").val())){
				$("#returnPW").css('color','blue');
				$("#returnPW").text('어려움');
			}else if($("#pw").val()==""){
				$("#returnPW").text('');
			}else{
				$("#returnPW").css('color','black');
				$("#returnPW").text('쉬움');
			}
			
		})
		
		$("#pwCheck").bind('paste',function(e){
        setTimeout(function(){
        alert("붙여넣기 할 수 없습니다");
        },100);
        $("#pwCheck").val("");
});
		//여기서 부터 가입버튼 눌렀을때 실행  && $("#pw").val().length>10
		$("#send")
				.on(
						"click",
						function() {

							var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,13}$/g;
							var regPw2 = /(\w)\1\1/g;
							var regname = /^[가-힣]{2,4}$/;
							var regnum = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
							var reg = /\s/g;

							if ($("#id").val() == "") {//아이디가 공백이면
								alert("아이디를 입력하세요");
								$("#id").focus();
							} else if (!regId.test($("#id").val())) {
								alert("이메일 형식에 맞지 않습니다");
								$("#id").focus();
							} else if (reg.test($("#id").val())) {
								alert("공백은 입력할 수 없습니다");
								$("#id").focus();
							} else if ($("#pw").val() == "") {
								alert("비밀번호를 입력하세요");
								$("#pw").focus();

							} else if (!regPw.test($("#pw").val())) {
								alert("비밀번호 형식에 맞지 않습니다");
								$("#pw").focus();
							} else if (regPw2.test($("#pw").val())) {
								alert('연속으로 같은 문자를 3번 이상 사용하실 수 없습니다.');
								$("#pw").focus();
							} else if (reg.test($("#pw").val())) {
								alert("공백은 입력할 수 없습니다");
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
							} else if (!regname.test($("#name").val())) {
								alert("이름 형식에 맞지 않습니다");
								$("#name").focus();
							} else if (reg.test($("#name").val())) {
								alert("공백은 입력할 수 없습니다");
								$("#name").focus();
							} else if ($("#name").val() == "") {
								alert("이름을 입력하세요");
								$("#name").focus();
							} else if (!regname.test($("#name").val())) {
								alert("이름 형식에 맞지 않습니다");
								$("#name").focus();
							} else if (reg.test($("#name").val())) {
								alert("공백은 입력할 수 없습니다");
								$("#name").focus();
							} else if ($("#datepicker").val() == "") {
								alert("생년월일을 입력하세요");
							} else if ($("#phone").val() == "") {
								alert("핸드폰 번호를 입력하세요");
								$("#phone").focus();
							} else if (!regnum.test($("#phone").val())) {
								alert("핸드폰 번호가 형식에 맞지 않습니다");
								$("#phone").focus();
							} else if (reg.test($("#phone").val())) {
								alert("공백은 입력할 수 없습니다");
								$("#phone").focus();
							} else if ($("#postcode").val() == "") {
								alert("주소를 입력하세요");
							} else if ($("#add2").val().length > 20) {
								alert("상세주소의 글자 수를 초과하였습니다");
								$("#add2").focus();
							} else if ($("#man").is(':checked') == false
									&& $("#woman").is(':checked') == false) {
								alert("성별을 선택하세요!");
							} else if ($("#add2").val() == "") {
								var result = confirm("상세주소가 없습니다.\n가입하시겠습니까?");
								if (result)
									$("form").submit();
							} else {
								removeXSS($("#id").val(), $("#id").attr("id"));
								removeXSS($("#pw").val(), $("#pw").attr("id"));
								removeXSS($("#pwCheck").val(), $("#pwCheck")
										.attr("id"));
								removeXSS($("#name").val(), $("#name").attr(
										"id"));
								removeXSS($("#datepicker").val(), $(
										"#datepicker").attr("id"));
								removeXSS($("#phone").val(), $("#phone").attr(
										"id"));
								removeXSS($("#postcode").val(), $("#postcode")
										.attr("id"));
								removeXSS($("#add1").val(), $("#add1").attr(
										"id"));
								removeXSS($("#add2").val(), $("#add2").attr(
										"id"));
								$("form").submit();
							}

						})
		// 여기까지가 가입버튼을 눌렀을때

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
	</script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	<!--주소등록-->
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("add1").value = roadAddr;
					//                                              document
					//                                                    .getElementById("add2").value = data.jibunAddress;
					document.getElementById("add2").value = "";//도로명만 받기

				}
			}).open();
		}
	</script>


</body>
</html>