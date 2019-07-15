<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="../css/style2.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
input[type="text"] {
	box-shadow: 4px 4px 5px #gray inset;
	border-radius: 5px;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<div class="container mt-3">
		<div class="row  pb-3 border-bottom">
			<div class="col-12" style="text-align: right">
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
		<form>
			<div class="row border-bottom border-top bg-gray text-center py-2">
				<div class="col-3">
					<input type="checkbox" onclick="checkAll();" />상품/옵션정보
				</div>
				<div class="col-2">유통기한</div>
				<div class="col-1">수량(개)</div>
				<div class="col-1">상품금액</div>
				<div class="col-1">지역</div>
				<div class="col-2">배송비/판매자</div>
				<div class="col-2">주문</div>
			</div>

			<c:forEach var="list" items="${list }">


				<div class="row border-bottom border-top text-center py-4">
					<div class="col-3 " style="line-height: 4em;">
						<div class="row">
							<input type="hidden" id="seq" value="${list.basket_seq }">
							<div class="col-4">
								<input type="checkbox" name="check" class="check" /><img
									src="${list.basket_imagepath }">
							</div>
							<div class="col-8">${list.basket_title}</div>

						</div>
					</div>
					<div class="col-2" style="line-height: 4em;">${list.basket_expiration}</div>
					<div class="col-1" style="line-height: 4em;">${list.basket_quantity}</div>
					<div class="col-1" style="line-height: 4em;">${list.basket_price}</div>
					<div class="col-1" style="line-height: 4em;">${list.basket_location}</div>

					<div class="col-2" style="line-height: 1.4em;">
						선결제 <br> <strong>(2,500원)</strong> <br> <small>판매자
							브랜드 ${dto.basket_title}</small>
					</div>
					<div class="col-2" style="line-height: 1.4em;">
						<button style="background-color: red;">주문하기</button>
						<br>
						<button type="button" id="delete">삭제하기</button>
					</div>
				</div>
			</c:forEach>
		</form>

		<div class="row py-5 border-bottom">
			<div class="col-12 text-center">
				<a href="/shopboard/shopBoard_buyProc" class="btn akame-btn mr-3">결
					제 하 기 </a> <a href="#" class="btn akame-btn ml-3">결 제 취 소</a>
			</div>
		</div>
	</div>


 	<script>
		var checkAll = function() {
			$(".check").click();
		}
		$("#delete").on("click", function() {
			
			if(confirm("정말 삭제하시겠습니까?")==true){
			var basket_seq = $("#seq").val();
			location.href = "/Basket/basketDelete?basket_seq="+basket_seq;
			}else{
				null;
			}
		})

		// 	배송지 radio reset 
		var reset = function() {
			$("#geter_name").val("");
			$("#sample6_postcode").val("");
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
		}
		var origin = function() {
			$("#geter_name").val("${id.member_name}");
			$("#sample6_postcode").val("${id.member_postcode}");
			$("#sample6_address").val("${id.member_address1}");
			$("#sample6_detailAddress").val("${id.member_address2}");
		}
		// 다음 주소 API
		function sample6_execDaumPostcode() {
			new daum.Postcode({
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
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
		// 신규 배송지 radio
		$("#new").on("click", function() {
			reset();
		})
		// 기존 배송지 radio
		$("#origin").on("click", function() {
			origin();
		})
	</script>




	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	
	
	
	
</body>
</html>