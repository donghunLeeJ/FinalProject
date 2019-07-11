<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



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

							<div class=title>대</div>
							<input type="text" style="width: 50%; margin: auto;" id=id
								name="member_id" class="form-control mb-30"
								placeholder="몄諛 대 쇰 �ν댁＜몄">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>鍮諛踰</div>

							<input type="password" style="width: 50%; margin: auto;" id=pw
								name="member_pw" class="form-control mb-30"
								placeholder=",臾몄,レ ы 理 8由">
						</div>
						<div class="col-lg-12 text-center">
							<div class=title>鍮諛踰 </div>

							<input type="password" id=pwCheck
								style="width: 50%; margin: auto;" class="form-control mb-30"
								placeholder="">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>대</div>

							<input type="text" id=name style="width: 50%; margin: auto;"
								name="member_name" class="form-control mb-30" placeholder="湲 2 댁, 4 댄">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title></div>

							<input type="text" id="birth" style="width: 50%; margin: auto;"
								name="member_birth" class="form-control mb-30"
								placeholder="">
						</div>

						<div class="col-lg-12 text-center">
							<div class=title>몃 踰</div>
							<input type="text" name=member_phone id=phone style="width: 50%; margin: auto;" class="form-control mb-30"
								placeholder=" '-'瑜 �명怨 �ν댁＜몄">
						</div>
						
							<div class="col-lg-12 ">
						<div class=title id=addinput>二쇱 �</div>
<!-- 						<input id=addbtn type="button" class="mb-12 mb-2" value="고몃 李얘린" -->
<!-- 							id="search"> -->
							   <img src="/img/core-img/find_addr.png"onclick="sample4_execDaumPostcode()" 
                           class=  " img-circle"  data-aria-haspopup="true"aria-expanded="false" id="findAdd" >  
						</div>
						<div class="col-lg-12 text-center">
						
						<input type="text" id="postcode"style="width: 50%; margin: auto;" name="member_postcode"class="form-control mb-30" placeholder="고몃" readonly><br> 
						<input type="text" id="add1" style="width: 50%; margin: auto;"name="member_address1" class="form-control mb-30"placeholder="濡紐 二쇱" readonly><br> 
						<input type="text"	id="add2" style="width: 50%; margin: auto;"name="member_address2" class="form-control mb-30"placeholder=" 二쇱"> <br>

							
						</div>
					

						<div class="col-lg-12 ">
							<div class="title float">깅</div>
							<div class="float" id="gen">
							<input type="radio" id="man" name=member_gender value="M"checked="checked">⑥ 
							<input type="radio" id="woman"name=member_gender value="W">ъ
							</div>
						</div>
						<br>

						<div class="col-12 text-center">
							<br> <br>
							<button type="button" class="btn akame-btn btn-3 mt-15 active"
								id=send>媛湲</button>

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



	<!-- <form id=form action="/member/joinProc" method=post> -->

	<!-- 	<tr> -->
	<!--         <th></th> -->
	<!--         <td> -->
	<!--         <input type="text" name=member_birth id="birth" size="8" maxlength="8" /> -->
	<!--         </td> -->

	<!-- 	<tr> -->



	<script>
		//ш린 遺 媛踰 � ㅽ
		$("#send").on("click",function() {
			
			var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/g;
			var regPw2=/(\w)\1\1/g;
			var regname = /^[媛-]{2,4}$/;
			var regnum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var reg = /\s/g;

					if ($("#id").val() == "") {//대媛 怨듬갚대㈃
						alert("대瑜 �ν몄");
						$("#id").focus();
					} else if(!regId.test($("#id").val())){
						alert("대  留吏 듬");
						$("#id").focus();	
					}else if(reg.test($("#id").val())){
						alert("怨듬갚 �ν  듬");
						$("#id").focus();
					}
					
					
					else if ($("#pw").val() == "") {
						alert("鍮諛踰몃� �ν몄");
						$("#pw").focus();
					}else if(!regPw.test($("#pw").val())){
						alert("鍮諛踰  留吏 듬");
						$("#pw").focus();
					}else if(regPw2.test($("#pw").val())){
						alert('곗쇰 媛 臾몄瑜 3踰 댁 ъ⑺  듬.');
						$("#pw").focus();
					}else if(reg.test($("#pw").val())){
						alert("怨듬갚 �ν  듬");
						$("#pw").focus();
					}else if ($("#pwCheck").val() == "") {
						alert("鍮諛踰명몄 �ν몄");


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

						alert("鍮諛踰멸 쇱吏 듬");
						$("#pw").focus();
					}
						
					 else if ($("#name").val() == "") {
						alert("대 �ν몄");
						$("#name").focus();
					}else if(!regname.test($("#name").val())){
						alert("대  留吏 듬");
						$("#name").focus();
					}else if(reg.test($("#name").val())){
						alert("怨듬갚 �ν  듬");
						$("#name").focus();
					}
					
					
					else if ($("#birth").val() == "") {
						alert("쇱 �ν몄");
					}
					
					else if ($("#phone").val() == "") {
						alert("몃 踰몃� �ν몄");
						$("#phone").focus();
					}else if(!regnum.test($("#phone").val())){
						alert("몃 踰멸  留吏 듬");
						$("#phone").focus();
					}else if(reg.test($("#phone").val())){
						alert("怨듬갚 �ν  듬");
						$("#phone").focus();
					}
					else if ($("#postcode").val() == "") {
						alert("二쇱瑜 �ν몄");
					}
					else if ($("#man").is(':checked') == false
							&& $("#woman").is(':checked') == false) {
						alert("깅 몄!");
					} else if($("#add2").val()==""){
						var result =confirm("몄＜媛 듬.\n媛寃듬源?");
						if(result) $("#form").submit();
						else return;
					}

				})
		// ш린源吏媛 媛踰쇱 �

		$("#pwCheck").on("focus", function() {
			if ($("#pw").val().length == 0) {
				alert("鍮諛踰 癒쇱 �ν몄");

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

				alert("鍮諛踰멸 쇱⑸");
			}
		})

		//곗댄고쇱빱 -----------------------------------------------------------
		$("#birth").datepicker(
				{
					showOn : "both", // 踰쇨낵 ㅽ  紐⑤ 罹由곕瑜 蹂댁ъ.
					buttonImage : "/application/db/jquery/images/calendar.gif", // 踰 대�吏
					buttonImageOnly : true, // 踰쇱  대�吏留 .
					changeMonth : true, //  諛轅  � 諛ㅻ� .
					changeYear : true, //  諛轅   � 諛ㅻ� .
					minDate : '-100y', // щ吏濡遺 100댁源吏  .
					nextText : 'ㅼ ', // next 댁 댄.
					prevText : '댁 ', // prev 댁 댄.
					numberOfMonths : [ 1, 1 ], // 踰 쇰 留  寃멸. [2,3]  寃쎌, 2() x 3() = 6媛  .
					//stepMonths: 3, // next, prev 踰쇱 대┃ 쇰 留  대 媛. 
					yearRange : 'c-100:c+10', //   �몃ㅻ�   댁, 댄濡 쇰 踰瑜 寃멸.
					showButtonPanel : true, // 罹由곕 ⑥ 踰 ⑤ . 
					currentText : 'ㅻ 吏', // ㅻ 吏濡 대 踰 ⑤
					closeText : 'リ린', // リ린 踰 ⑤
					dateFormat : "yymmdd", // ㅽ  �λ 吏 .
					showAnim : "slide", //硫댁 �⑺.
					showMonthAfterYear : true, // ,  � 諛ㅻ� , 쇰 諛轅以. 
					dayNamesMin : [ '', '', '', '紐', '湲', '', '' ], // 쇱 湲 .
					monthNamesShort : [ '1', '2', '3', '4', '5', '6',
							'7', '8', '9', '10', '11', '12' ]
				//  湲 .

				});

		//----------------------------------------------------------------------------

		//곗댄고쇱빱 대�吏 吏곌린
		$("img.ui-datepicker-trigger").remove();

		document.getElementById("search").onclick = searchAddress;

		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					//  寃寃곌낵 �ぉ 대┃ ㅽ 肄瑜 깊 遺遺.
					// 濡紐 二쇱 몄 洹移 곕 二쇱瑜 .
					// 대ㅼㅻ 蹂媛 媛  寃쎌곗 怨듬갚('')媛 媛吏誘濡, 대� 李멸� 遺湲 .
					var roadAddr = data.roadAddress; // 濡紐 二쇱 蹂
					var extraRoadAddr = ''; // 李멸� �ぉ 蹂
					// 踰�紐  寃쎌 異媛. (踰�由щ �)
					// 踰� 寃쎌 留吏留 臾몄媛 "/濡/媛"濡 .
					if (data.bname !== '' && /[|濡|媛]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 嫄대Ъ紐 怨, 怨듬二쇳 寃쎌 異媛.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					//  李멸��ぉ  寃쎌, 愿멸吏 異媛 理醫 臾몄댁 留.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 고몃몄 二쇱 �蹂대� 대  ｋ.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("Address1").value = roadAddr;
				}
			}).open();
		}
	</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script>  <!--二쇱깅-->
                              //蹂 � 濡紐 二쇱 湲 諛⑹  踰�뱀 곕, 대ㅼㅻ 곗댄곕� 議고⑺ щ瑜 二쇱瑜 援ъ깊 諛⑸ ㅻ⑸.
                              function sample4_execDaumPostcode() {
                                 new daum.Postcode(
                                       {
                                          oncomplete : function(
                                                data) {
                                             //  寃寃곌낵 �ぉ 대┃ ㅽ 肄瑜 깊 遺遺.

                                             // 濡紐 二쇱 몄 洹移 곕 二쇱瑜 .
                                             // 대ㅼㅻ 蹂媛 媛  寃쎌곗 怨듬갚('')媛 媛吏誘濡, 대� 李멸� 遺湲 .
                                             var roadAddr = data.roadAddress; // 濡紐 二쇱 蹂
                                             var extraRoadAddr = ''; // 李멸� �ぉ 蹂

                                             // 踰�紐  寃쎌 異媛. (踰�由щ �)
                                             // 踰� 寃쎌 留吏留 臾몄媛 "/濡/媛"濡 .
                                             if (data.bname !== ''
                                                   && /[|濡|媛]$/g
                                                         .test(data.bname)) {
                                                extraRoadAddr += data.bname;
                                             }
                                             // 嫄대Ъ紐 怨, 怨듬二쇳 寃쎌 異媛.
                                             if (data.buildingName !== ''
                                                   && data.apartment === 'Y') {
                                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                                      + data.buildingName
                                                      : data.buildingName);
                                             }
                                             //  李멸��ぉ  寃쎌, 愿멸吏 異媛 理醫 臾몄댁 留.
                                             if (extraRoadAddr !== '') {
                                                extraRoadAddr = ' ('
                                                      + extraRoadAddr
                                                      + ')';
                                             }

                                             // 고몃몄 二쇱 �蹂대� 대  ｋ.
                                             document
                                                   .getElementById('postcode').value = data.zonecode;
                                             document
                                                   .getElementById("add1").value = roadAddr;
//                                              document
//                                                    .getElementById("add2").value = data.jibunAddress;
                                             document
                                             .getElementById("add2").value ="";//濡紐留 諛湲

                                          }
                                       }).open();
                              }
                           </script>

				alert("비밀번호가 일치합니다");
			}
		})

		//데이터피커 -----------------------------------------------------------
		
	
	</script>




</body>
</html>