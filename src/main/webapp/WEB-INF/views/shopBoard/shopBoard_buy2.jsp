<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../css/style2.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script>
	$(function() {
		var origin = function() {

			$("#geter_name").val("${id.member_name}");
			$("#sample6_postcode").val("${id.member_postcode}");
			$("#sample6_address").val("${id.member_address1}");
			$("#sample6_detailAddress").val("${id.member_address2}");
			$("#phone1").val(phone.substr(0, 3));
			$("#phone2").val(phone.substr(3, 4));
			$("#phone3").val(phone.substr(7, 4));
		}
		$("#origin").on("click", function() {
			origin();
		})
		$("#origin").click();
	});
</script>
	
<style>
input[type="text"] {
	box-shadow: 4px 4px 5px #gray inset;
	border-radius: 5px;
}

a {
	cursor: pointer;
}

</style>
<script type="text/javascript" src="/js/cross.js"></script>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
<!-- 	장바구니에서 결제하기 화면 >> shopChargeOK2로 넘어감 -->
		<div class="container mt-5">
			

			<div class="row border-bottom border-top py-2 bg-gray">
				<div class="col-6">
					<h3 style="font-family: '나눔고딕OTF';">장바구니 결제</h3>
				</div>
<!-- 				<div class="col-6 " style="text-align: right"> -->
<!-- 					<h3>장바구니 결제 </h3> -->
<!-- 				</div> -->
			</div>

			<div class="row py-3">
				<div class="col-6 font-weight-bold text-bottom">
					<span class="">주문상품 확인</span>
				</div>
<!-- 				<div class="col-6 text-bottom" style="text-align: right"> -->
<!-- 					<p>*상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p> -->
<!-- 				</div> -->

			</div>
			<div class="row border-bottom border-top bg-gray text-center py-2">
				<div class="col-5">상품/옵션정보</div>

				<div class="col-1">수량(개)</div>
				<div class="col-1">상품금액</div>
				<div class="col-1">지역</div>
				<div class="col-2">유통 기한</div>
				<div class="col-2">배송비/판매자</div>
			</div>
			
			<c:forEach var="dto" items="${basketarr}">
			
			<div class="row border-bottom border-top text-center py-4"
				style="height: 8em">
				<div class="col-5 ">
					<div class="row">
						<div class="col-3  pt-2 pb-2 ">
							<img class="ml-3" src="${dto.basket_imagepath }"> <input
								type="hidden" value="${dto.basket_imagepath }" name="order_image">
						</div>
						<div class="col-9"
							style="text-overflow: ellipsis; margin-top: 1.4em; width: 25em; white-space: nowrap; overflow: hidden;">
							<span><strong>${dto.basket_title }</strong> <input
								type="hidden" value="${dto.basket_title }" name="order_title">
								<input type="hidden" value="${dto.basket_id } "
								name="order_seller"> </span>

						</div>

					</div>
				</div>

				<div class="col-1" style="margin-top: 1.4em">${dto.basket_quantity }
					<input type="hidden" value="${dto.basket_quantity }" name="order_quantity">
				</div>
				<div class="col-1" id="price" style="margin-top: 1.4em; padding: 0">
					<fmt:formatNumber value="${dto.basket_price }" pattern="#,###" />
					<input type="hidden" id="price${dto.basket_seq}" value="${dto.basket_price }">
					
					(원) <input type="hidden" value="${dto.basket_price }" name="order_price">
				</div>
				<div class="col-1" style="margin-top: 1.4em">${dto.basket_location }</div>
				<div class="col-2" style="margin-top: 1.4em">${dto.basket_expiration }</div>
				<div class="col-2">
					선결제 <br> <strong>(2,500원)</strong> <br> <small>${dto.basket_id }

						<br>${dto.basket_brand }</small>

				</div>
			</div>
	
</c:forEach>

	

	<div class="row border-bottom border-top bg-gray text-center py-2">
				<div class="col-5"></div>

				<div class="col-1"></div>
				<div class="col-1"></div>
				<div class="col-1"></div>
				<div class="col-2">총 수량</div>
				<div class="col-2">총 금액</div>
			</div>
		
			
			<div class="row border-bottom border-top text-center py-4"
				>
				<div class="col-5 ">
					<div class="row">
						<div class="col-3  pt-2 pb-2 ">
							
						</div>
						<div class="col-9"
							style="text-overflow: ellipsis; margin-top: 1.4em; width: 25em; white-space: nowrap; overflow: hidden;">
						
						</div>

					</div>
				</div>

				<div class="col-1" >
				</div>
				<div class="col-1"  >
					
				</div>
				<div class="col-1" ></div>
				<div class="col-2" >${amount }</div>
				
				<div class="col-2">
					
			<fmt:formatNumber value="${price }" pattern="#,###" />(원)
			
				</div>
			</div>
	
<form action="/shopboard/shopBasketOrder?basket_seq=${basketseq }" method="post" id="basketCharge">

<input type="hidden" value="${price }" id="priceTotal" name="priceTotal">

		
			<div class="row pt-5 pb-1">

				<div class="col-12 ">
					<h3 style="font-family: '나눔고딕OTF';">주문자 정보 입력</h3>
				</div>
			</div>
			<div class="row border rounded">
				<div class="col-3 py-2 font-weight-bold">주문자 이름</div>
				<div class="col-9 py-2">
					<input type="text" name="order_buyer" id="order_buyer"
						class="empty">
				</div>
				<div class="col-3 py-2 font-weight-bold">휴대전화</div>
				<div class="col-9 py-2">
					<input type="text" name="phone1" id="order_phone1" class="empty"
						style="width: 8em"> - <input type="text" name="phone2"
						class="empty" id="order_phone2" style="width: 8em"> - <input
						type="text" name="phone3" id="order_phone3" class="empty"
						style="width: 8em">
				</div>
				<div class="col-3 py-2 font-weight-bold">이메일</div>
				<div class="col-9 py-2">
					<input type="text" name="email1" id="email1" class="empty ">
					@ <input type="text" name="email2" id="email2" class="empty ">
				</div>

			</div>
			<div class="row">
				<div class="col-12 pt-2">
<!-- 					<p> -->
<!-- 						<small>11번가㈜는 통신판매중개자로서 통신판매의 당사자가 아니며, 개별판매자가 등록한 상품정보 및 -->
<!-- 							거래에 대해 11번가㈜는 일체의 책임을 지지 않습니다.</small> -->
<!-- 					</p> -->
				</div>
			</div>
			

			<div class="row">
				<div class="col-12 pt-2 font-weight-bold">
					<h3 style="font-family: '나눔고딕OTF';">배송지 정보 입력</h3>
				</div>
			</div>



			<div class="row border rounded">
				<div class="col-3 font-weight-bold py-2" style="line-height: 2em">배송지선택</div>
				<div class="col-9 py-2">
					<span>기본 배송지 <input type="radio" name="origin_radio"
						id="origin" checked="checked"></span> <span>신규 배송지 <input
						type="radio" name="origin_radio" id="new">
					</span>
				</div>
				<div class="col-3 font-weight-bold py-2">받으시는 분</div>
				<div class="col-9 py-2">
					<input type="text" name="order_receipt" style="width: 8em"
						class="empty" id="geter_name">
				</div>
				<div class="col-3 font-weight-bold py-2">배송지선택</div>
				<div class="col-9 py-2">

					<input type="text" id="sample6_postcode" class="findAdd empty"
						name="order_receipt_postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="sample6_execDaumPostcode()"
						id="postbtn" value="우편번호 찾기" style="margin-left: 0.5em"> <br>
					<br> <input type="text" id="sample6_address"
						class="findAdd empty" name="order_receipt_address1"
						placeholder="주소" style="width: 20em" readonly> <br> <br>
					<input type="text" id="sample6_detailAddress" class="empty"
						name="order_receipt_address2" placeholder="상세주소"
						style="width: 25em">
					<!-- 							<input type="text"	id="sample6_extraAddress" class="empty" placeholder="지번" readonly> -->



				</div>
				<div class="col-3 font-weight-bold py-2">휴대전화</div>
				<div class="col-9 py-2">
					<input type="text" name="getter_phone1" class="empty"
						style="width: 8em" id="phone1" value=""> - <input
						type="text" name="getter_phone2" class="empty" style="width: 8em"
						id="phone2"> - <input type="text" name="getter_phone3"
						class="empty" style="width: 8em" id="phone3">
				</div>
				<div class="col-3 font-weight-bold py-2">배송시요구사항</div>
				<div class="col-9">

					<input type="text" name="order_receipt_demend" style="width: 35em"
						placeholder="(선택사항)" id="req">

					<p style="color: blue;">
						<small>*특정한 배송일을 지정하고자 할 경우 판매자와 연락하여 배송일을 확인해주시기 바랍니다.</small>
					</p>

				</div>
			</div>

			<div class="row py-2">
				<div class="col-12">
					<p>

					<input type="checkbox" id="must1"> <small class="must1">(필수)판매명,
							유통기한, 판매수량, 판매금액 등 상품 정보를 모두 확인하였습니다</small><br> <input
							type="checkbox" id="must2"> <small class="must2">(필수)정확하지
							않은 정보 입력으로 인하여 생긴 피해는 주문자가 책임지겠습니다</small><br> <input
							type="checkbox" id="must3"> <small class="must3">(필수)배송
							과정 중 발생한 문제는 AGGABI에서 책임지지 않으므로 택배사에 문의 부탁드립니다</small><br> <input
							type="checkbox" id="must4"> <small class="must4">(필수)결제
							후 취소,환불,교환이 어려울 수 있으며, 이에 동의합니다 </small>
					</p>
				</div>
			</div>
			<div class="row py-5 border-bottom">
				<div class="col-12 text-center">
					<a class="btn akame-btn mr-3" id="buy_aTag">결 제 하 기 </a> <a
						href="#" class="btn akame-btn ml-3" id="back_aTag">결 제 취 소</a>


				</div>
			</div>
		</form>
		</div>
	

	

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp96545220'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	


		$("#origin").is("check");
		$("#buy_aTag")
				.on(
						"click",
						function() {

							var inputcount = 0;
							$(".empty").each(function(i, item) {
								if ($(item).val() == "") {
									inputcount++; //만일 입력창 어딘가에 빈 칸이 있을 경우 카운트를 증가시킨다.
								}
							});
							var regname = /^[가-힣]{1,6}$/;
							var regnum1 = /^01([0|1|6|7|8|9]?)$/;
							var regnum2 = /^([0-9]{3,4})$/;
							var regnum3 = /^([0-9]{4})$/;
							var regemail1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;
							var regemail2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						
							if (inputcount > 0) {
								alert("모든 항목을 반드시 입력하셔야 합니다.");
							} else if (!regname.test($("#order_buyer").val())) {
								alert("주문자 이름을 정확히 입력해주세요");
							} else if (!regnum1.test($("#order_phone1").val())) {
								alert("핸드폰 번호를 정확히 입력해주세요");
							} else if (!regnum2.test($("#order_phone2").val())) {
								alert("핸드폰 번호를 정확히 입력해주세요");
							} else if (!regnum3.test($("#order_phone3").val())) {
								alert("핸드폰 번호를 정확히 입력해주세요");
							} else if (!regemail1.test($("#email1").val())) {
								alert("메일주소를 정확히 입력해주세요");
							} else if (!regemail2.test($("#email2").val())) {
								alert("핸드폰 번호를 정확히 입력해주세요");
							} else if (!regname.test($("#geter_name").val())) {
								alert("받으시는 분을 정확히 입력해주세요");
							} else if ($("#sample6_detailAddress").val().length > 25) {
								alert("상세주소 길이를 초과하였습니다")
							} else if (!regnum1.test($("#phone1").val())) {
								alert("배송지 번호를 정확히 입력해주세요");
							} else if (!regnum2.test($("#phone2").val())) {
								alert("배송지 번호를 정확히 입력해주세요");
							} else if (!regnum3.test($("#phone3").val())) {
								alert("배송지 번호를 정확히 입력해주세요");
							} else if ($("#req").val().length > 30) {
								alert("요구사항 길이를 초과하였습니다");
							} else if ($("#must1").is(":checked") == false) {
								alert("필수사항을 읽고 체크해주세요");
							} else if ($("#must2").is(":checked") == false) {
								alert("필수사항을 읽고 체크해주세요");
							} else if ($("#must3").is(":checked") == false) {
								alert("필수사항을 읽고 체크해주세요");
							}  else if ($("#must4").is(":checked") == false) {
								alert("필수사항4를 읽고 체크해주세요");
							} else {
							
							
									removeXSS($("#order_buyer").val(), $(
											"#order_buyer").attr("id"));
									removeXSS($("#order_phone1").val(), $(
											"#order_phone1").attr("id"));
									removeXSS($("#order_phone2").val(), $(
											"#order_phone2").attr("id"));
									removeXSS($("#order_phone3").val(), $(
											"#order_phone3").attr("id"));
									removeXSS($("#email1").val(), $("#email1")
											.attr("id"));
									removeXSS($("#email2").val(), $("#email2")
											.attr("id"));
									removeXSS($("#geter_name").val(), $(
											"#geter_name").attr("id"));
									removeXSS($("#sample6_postcode").val(), $(
											"#sample6_postcode").attr("id"));
									removeXSS($("#sample6_address").val(), $(
											"#sample6_address").attr("id"));
									removeXSS(
											$("#sample6_detailAddress").val(),
											$("#sample6_detailAddress").attr(
													"id"));
									// 				removeXSS($("#sample6_extraAddress").val(), $("#sample6_extraAddress").attr("id"));
									removeXSS($("#phone1").val(), $("#phone1")
											.attr("id"));
									removeXSS($("#phone2").val(), $("#phone2")
											.attr("id"));
									removeXSS($("#phone3").val(), $("#phone3")
											.attr("id"));
									removeXSS($("#req").val(), $("#req").attr(
											"id"));
									var price = Number($("#priceTotal").val());
									IMP.request_pay({
										pg : 'inicis', // version 1.1.0부터 지원.
										pay_method : 'card',
										merchant_uid : 'merchant_' + new Date().getTime(),
										name : '주문명:결제테스트',
										amount : price,
										buyer_email : 'iamport@siot.do',
										buyer_name : '구매자이름',
										buyer_tel : '010-1234-5678',
										buyer_addr : '서울특별시 강남구 삼성동',
										buyer_postcode : '123-456',
										m_redirect_url : 'localhost/home'
									}, function(rsp) {
										if (rsp.success) {
											var msg = '결제가 완료되었습니다.';
											alert(msg);
											$("#basketCharge").submit();
										} else {
											var msg = '결제에 실패하였습니다.';
											msg += '에러내용 : ' + rsp.error_msg;
										}
									
									});
									
								
							}
						})//결제버튼클릭

		$(".findAdd").on("click", function() {

			$("#postbtn").click();

		})

		// 	배송지 radio reset 
		var reset = function() {
			$("#geter_name").val("");
			$("#sample6_postcode").val("");
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
			$("#phone1").val("");
			$("#phone2").val("");
			$("#phone3").val("");
		}
		var phone = '${id.member_phone}';
		console.log(phone);

		// 다음 주소 API	
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress").value = "";//상세주소 입력하고 추가하면 삭제되게함
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		$("#new").on("click", function() {
			reset();
		})

		// 기존 배송지 radio

		$("#back_aTag")
				.on(
						"click",
						function() {
							if (confirm("결제를 취소 하시겠습니까? 입력하신 정보는 저장되지 않습니다.")) {
								$(location)
										.attr("href",
												"/shopboard/ShopBoardViewProc?seq=${dto.shop_seq }");
							}
						})
		$("#chargeOk_btn").on("click", function() {
			$(location).attr("href", "/shopboard/shopChargeOk");
		})
		$(function() {

		})

		$(".must1").on("click", function() {
			$("#must1").click();
		});
		$(".must2").on("click", function() {
			$("#must2").click();
		});
		$(".must3").on("click", function() {
			$("#must3").click();
		});
		$(".must4").on("click", function() {
			$("#must4").click();
		});
	</script>
	
</body>
</html>