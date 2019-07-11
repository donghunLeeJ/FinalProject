<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>


<!-- //주소 script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- // 데이터 피커 사용시 필요한것----------------------------------------------------- -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<!-- //------------------------------------------------------------------------------ -->
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

#findAdd{
padding:5px;
width:30px;
height:30px;
margin:0px;
}
*[@id="findAdd"]{
margin:0px;
}
.float{
float:left;
}
#gen{
transform:translate(30px);
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
							<input type="text" style="width: 50%; margin: auto;" id=id
								name="member_id" class="form-control mb-30"
								placeholder="인증받을 이메일 형식으로 입력해주세요">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>비밀번호</div>

							<input type="password" style="width: 50%; margin: auto;" id=pw
								name="member_pw" class="form-control mb-30"
								placeholder="대,소문자,숫자 포함 최소 8자리">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>비밀번호 확인</div>

							<input type="password" id=pwCheck
								style="width: 50%; margin: auto;" class="form-control mb-30"
								placeholder="">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>이름</div>

							<input type="text" id=name style="width: 50%; margin: auto;"
								name="member_name" class="form-control mb-30" placeholder="한글 2자 이상, 4자 이하">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>생년월일</div>

							<input type="text" id="birth" style="width: 50%; margin: auto;"
								name="member_birth" class="form-control mb-30"
								placeholder="">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>핸드폰 번호</div>
							<input type="text" name=member_phone id=phone style="width: 50%; margin: auto;" class="form-control mb-30"
								placeholder=" '-'를 제외하고 입력해주세요">
						</div>
						
							<div class="col-lg-12 ">
						<div class=title id=addinput>주소 입력</div>
<!-- 						<input id=addbtn type="button" class="mb-12 mb-2" value="우편번호 찾기" -->
<!-- 							id="search"> -->
							   <img src="/img/core-img/find_addr.png"onclick="sample4_execDaumPostcode()" 
                           class=  " img-circle"  data-aria-haspopup="true"aria-expanded="false" id="findAdd" >  
						</div>
						<div class="col-lg-12 text-center">
						
						<input type="text" id="postcode"style="width: 50%; margin: auto;" name="member_postcode"class="form-control mb-30" placeholder="우편번호" readonly><br> 
						<input type="text" id="add1" style="width: 50%; margin: auto;"name="member_address1" class="form-control mb-30"placeholder="도로명 주소" readonly><br> 
						<input type="text"	id="add2" style="width: 50%; margin: auto;"name="member_address2" class="form-control mb-30"placeholder="상세 주소"> <br>

							
						</div>
					

						<div class="col-lg-12 ">
							<div class="title float">성별</div>
							<div class="float" id="gen">
							<input type="radio" id="man" name=member_gender value="M"checked="checked">남자 
							<input type="radio" id="woman"name=member_gender value="W">여자
							</div>
						</div>
						<br>

						<div class="col-12 text-center">
							<br> <br>
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


	<!-- <form id=form action="/member/joinProc" method=post> -->

	<!-- 	<tr> -->
	<!--         <th>생일</th> -->
	<!--         <td> -->
	<!--         <input type="text" name=member_birth id="birth" size="8" maxlength="8" /> -->
	<!--         </td> -->

	<!-- 	<tr> -->



	<script>
		//여기서 부터 가입버튼 눌렀을때 실행
		$("#send").on("click",function() {
			
			var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/g;
			var regPw2=/(\w)\1\1/g;
			var regname = /^[가-힣]{2,4}$/;
			var regnum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var reg = /\s/g;

					if ($("#id").val() == "") {//아이디가 공백이면
						alert("아이디를 입력하세요");
						$("#id").focus();
					} else if(!regId.test($("#id").val())){
						alert("이메일 형식에 맞지 않습니다");
						$("#id").focus();	
					}else if(reg.test($("#id").val())){
						alert("공백은 입력할 수 없습니다");
						$("#id").focus();
					}
					
					
					else if ($("#pw").val() == "") {
						alert("비밀번호를 입력하세요");
						$("#pw").focus();
					}else if(!regPw.test($("#pw").val())){
						alert("비밀번호 형식에 맞지 않습니다");
						$("#pw").focus();
					}else if(regPw2.test($("#pw").val())){
						alert('연속으로 같은 문자를 3번 이상 사용하실 수 없습니다.');
						$("#pw").focus();
					}else if(reg.test($("#pw").val())){
						alert("공백은 입력할 수 없습니다");
						$("#pw").focus();
					}else if ($("#pwCheck").val() == "") {
						alert("비밀번호확인을 입력하세요");
						$("#pwCheck").focus();
					} else if ($("#pw").val() != $("#pwCheck").val()) {
						$("#pw").val("");
						$("#pwCheck").val("");
						alert("비밀번호가 일치하지 않습니다");
						$("#pw").focus();
					}
						
					 else if ($("#name").val() == "") {
						alert("이름을 입력하세요");
						$("#name").focus();
					}else if(!regname.test($("#name").val())){
						alert("이름 형식에 맞지 않습니다");
						$("#name").focus();
					}else if(reg.test($("#name").val())){
						alert("공백은 입력할 수 없습니다");
						$("#name").focus();
					}
					
					
					else if ($("#birth").val() == "") {
						alert("생년월일을 입력하세요");
					}
					
					else if ($("#phone").val() == "") {
						alert("핸드폰 번호를 입력하세요");
						$("#phone").focus();
					}else if(!regnum.test($("#phone").val())){
						alert("핸드폰 번호가 형식에 맞지 않습니다");
						$("#phone").focus();
					}else if(reg.test($("#phone").val())){
						alert("공백은 입력할 수 없습니다");
						$("#phone").focus();
					}
					else if ($("#postcode").val() == "") {
						alert("주소를 입력하세요");
					}
					else if ($("#man").is(':checked') == false
							&& $("#woman").is(':checked') == false) {
						alert("성별을 선택하세요!");
					} else if($("#add2").val()==""){
						var result =confirm("상세주소가 없습니다.\n가입하시겠습니까?");
						if(result) $("#form").submit();
						else return;
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

		//데이터피커 -----------------------------------------------------------
		$("#birth").datepicker(
				{
					showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
					buttonImage : "/application/db/jquery/images/calendar.gif", // 버튼 이미지
					buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					minDate : '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
					nextText : '다음 달', // next 아이콘의 툴팁.
					prevText : '이전 달', // prev 아이콘의 툴팁.
					numberOfMonths : [ 1, 1 ], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
					//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
					yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
					showButtonPanel : true, // 캘린더 하단에 버튼 패널을 표시한다. 
					currentText : '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
					closeText : '닫기', // 닫기 버튼 패널
					dateFormat : "yymmdd", // 텍스트 필드에 입력되는 날짜 형식.
					showAnim : "slide", //애니메이션을 적용한다.
					showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ], // 요일의 한글 형식.
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ]
				// 월의 한글 형식.

				});

		//----------------------------------------------------------------------------

		//데이터피커 이미지 지우기
		$("img.ui-datepicker-trigger").remove();

		document.getElementById("search").onclick = searchAddress;

		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("Address1").value = roadAddr;
				}
			}).open();
		}
	</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script>  <!--주소등록-->
                              //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                              function sample4_execDaumPostcode() {
                                 new daum.Postcode(
                                       {
                                          oncomplete : function(
                                                data) {
                                             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                             var roadAddr = data.roadAddress; // 도로명 주소 변수
                                             var extraRoadAddr = ''; // 참고 항목 변수

                                             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                             if (data.bname !== ''
                                                   && /[동|로|가]$/g
                                                         .test(data.bname)) {
                                                extraRoadAddr += data.bname;
                                             }
                                             // 건물명이 있고, 공동주택일 경우 추가한다.
                                             if (data.buildingName !== ''
                                                   && data.apartment === 'Y') {
                                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                                      + data.buildingName
                                                      : data.buildingName);
                                             }
                                             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                             if (extraRoadAddr !== '') {
                                                extraRoadAddr = ' ('
                                                      + extraRoadAddr
                                                      + ')';
                                             }

                                             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                             document
                                                   .getElementById('postcode').value = data.zonecode;
                                             document
                                                   .getElementById("add1").value = roadAddr;
//                                              document
//                                                    .getElementById("add2").value = data.jibunAddress;
                                             document
                                             .getElementById("add2").value ="";//도로명만 받기

                                          }
                                       }).open();
                              }
                           </script>


</body>
</html>