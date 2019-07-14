<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
input[type="text"] {
	box-shadow: 4px 4px 5px #gray inset;
	border-radius: 5px;
}

a {
	cursor: pointer;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<div class="container mt-5">
		<div class="row  pb-3 border-bottom">
			<div class="col-12 text-right">
				<a href="#" class="btn akame-btn">이전 페이지 </a>
			</div>
		</div>

		<div class="row border-bottom border-top py-2 bg-gray">
			<div class="col-6">
				<h3>주문결제</h3>
			</div>
			<div class="col-6 " style="text-align: right">
				<h3>장바구니 주문/결제 주문완료</h3>
			</div>
		</div>

		<div class="row py-3">
			<div class="col-6 font-weight-bold text-bottom">
				<span class="">주문상품 확인</span>
			</div>
			<div class="col-6 text-bottom" style="text-align: right">
				<p>*상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p>
			</div>

		</div>
		<div class="row border-bottom border-top bg-gray text-center py-2">
			<div class="col-5">상품/옵션정보</div>

			<div class="col-1">수량(개)</div>
			<div class="col-1">상품금액</div>
			<div class="col-1">지역</div>
			<div class="col-2">유통 기한</div>
			<div class="col-2">배송비/판매자</div>
		</div>
		<div class="row border-bottom border-top text-center py-4">
			<div class="col-5 " style="margin-top: 1.4em">
				<div class="row">
					<div class="col-3">
						<img src="${dto.shop_imagepath1 }">
					</div>
					<div class="col-9" style="text-overflow: ellipsis;">
						<span>${dto.shop_title }</span>
					</div>

				</div>
			</div>

			<div class="col-1" style="margin-top: 1.4em">${quantity }</div>
			<div class="col-1" style="margin-top: 1.4em">${price }(원)</div>
			<div class="col-1" style="margin-top: 1.4em">${dto.shop_location }</div>
			<div class="col-2" style="margin-top: 1.4em">${dto.shop_expiration }</div>
			<div class="col-2">
				선결제 <br> <strong>(2,500원)</strong> <br> <small>${dto.shop_id }
					${dto.shop_brand }</small>
			</div>
		</div>
		<div class="row pt-5 pb-1">
			<div class="col-12 ">
				<h3>주문자 정보 입력</h3>
			</div>
		</div>
		<div class="row border rounded">
			<div class="col-3 py-2 font-weight-bold">주문자 이름</div>
			<div class="col-9 py-2">
				<input type="text" name="order_name" id="order_name">
			</div>
			<div class="col-3 py-2 font-weight-bold">휴대전화</div>
			<div class="col-9 py-2">
				<input type="text" name="phone1" id="phone1" style="width: 8em">
				- <input type="text" name="phone2" id="phone2" style="width: 8em">
				- <input type="text" name="phone3" id="phone3" style="width: 8em">
			</div>
			<div class="col-3 py-2 font-weight-bold">이메일</div>
			<div class="col-9 py-2">
				<input type="text" name="email1" id="email1"> @ <input
					type="text" name="email2" id="email2">
			</div>

		</div>
		<div class="row">
			<div class="col-12 pt-2">
				<p>
					<small>11번가㈜는 통신판매중개자로서 통신판매의 당사자가 아니며, 개별판매자가 등록한 상품정보 및
						거래에 대해 11번가㈜는 일체의 책임을 지지 않습니다.</small>
				</p>
			</div>
		</div>

		<div class="row">
			<div class="col-12 pt-2 font-weight-bold">
				<h3>배송지 정보 입력</h3>
			</div>
		</div>

		<form id="completeForm" method="post" action="/shopboard/completePay">

		<div class="row border rounded">
			<div class="col-3 font-weight-bold py-2" style="line-height: 2em">배송지선택</div>
			<div class="col-9 py-2">
				<span>기존 배송지 <input type="radio" name="origin_radio"
					id="origin"></span> <span>신규 배송지 <input type="radio"
					name="origin_radio" id="new">
				</span>
			</div>
			<div class="col-3 font-weight-bold py-2">받으시는 분</div>
			<div class="col-9 py-2">
				<input type="text" name="order_id" style="width: 8em" id="geter_name">
			</div>
			<div class="col-3 font-weight-bold py-2">배송지선택</div>
			<div class="col-9 py-2">
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기" style="margin-left: 0.5em"><br> <br>
				<input type="text" id="sample6_address" placeholder="주소"
					style="width: 20em"><br> <br> <input type="text"
					id="sample6_detailAddress" placeholder="상세주소" style="width: 25em">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">

			</div>
			<div class="col-3 font-weight-bold py-2">휴대전화</div>
			<div class="col-9 py-2">
				<input type="text" name="phone1" style="width: 8em" id="phone1"
					value=""> - <input type="text" name="phone2"
					style="width: 8em" id="phone2"> - <input type="text"
					name="phone3" style="width: 8em" id="phone3">
			</div>
			<div class="col-3 font-weight-bold py-2">배송시요구사항</div>
			<div class="col-9">
				<input type="text" name="order_demend" style="width: 35em">
				<p style="color: blue;">
					<small>*특정한 배송일을 지정하고자 할 경우 판매자와 연락하여 배송일을 확인해주시기 바랍니다.</small>
				</p>

			</div>
		</div>
		</form>
		<div class="row py-2">
			<div class="col-12">
				<p>
					<small>전자상거래 소비자보호 법률에 따른 구매 안전 서비스 안내: 본 판매자는 11번가㈜과 계약을
						통해 구매 안전 서비스를 자동으로 제공중입니다. (결제대금예치업 등록번호 02-006-000022) </small>
				</p>

			</div>
		</div>

		<div class="row py-5 border-bottom">
			<div class="col-12 text-center">
				<a class="btn akame-btn mr-3" id="buy_aTag">결 제 하 기 </a> <a href="#"
					class="btn akame-btn ml-3">결 제 취 소</a>

			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp96545220'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#buy_aTag").on("click", function() {

			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 14000,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'localhost/home'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					$("#completeForm").submit();	
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
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
		var origin = function() {

			$("#geter_name").val("${id.member_name}");
			$("#sample6_postcode").val("${id.member_postcode}");
			$("#sample6_address").val("${id.member_address1}");
			$("#sample6_detailAddress").val("${id.member_address2}");
			$("#phone1").val(phone.substr(0, 2));
			$("#phone2").val(phone.substr(2, 4));
			$("#phone3").val(phone.substr(4, 4));
		}
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
		//아임포트 API

		// 신규 배송지 radio
		$("#new").on("click", function() {
			reset();
		})
		// 기존 배송지 radio
		$("#origin").on("click", function() {

			origin();
		})
	</script>
</body>
</html>