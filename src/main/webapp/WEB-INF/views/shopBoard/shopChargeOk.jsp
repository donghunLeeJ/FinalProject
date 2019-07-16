<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
#chargeInfo_btn {
	width: 15em;
	height: 3em;
	margin-right: 0.5em;
	background-color: black;
	color: white;
	border: 0;
	outline: 0;
	cursor: pointer;
}

.row {
	margin-right: 0;
	margin-left: 0;
}

#homeGo_btn {
	width: 15em;
	height: 3em;
	margin-left: 0.5em;
	background-color: white;
	color: black;
	border: 1px solid black;
	outline: 0;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<div class="container pt-5">
		<div class="row border-bottom">
			<div class="col-12 pb-2">
				<h3>
					<strong>결제 완료</strong>
				</h3>
			</div>
		</div>
		<div class="row text-center pt-5">
			<div class="col-12">
				<small>주문번호 </small>&nbsp; <a href="#" class="border-bottom"><small>${ldto.order_number }</small></a>
			</div>
			<div class="col-12 py-2">
				<h4>
					<strong>주문과 결제가 정상적으로 완료되었습니다.</strong>
				</h4>
			</div>
			<div class="col-12 py-1">업체(브랜드)의 주문 확인 후 발송됩니다.</div>
			<div class="col-12 py-5 ">
				<input type="button" value="결제 정보 확인" id="chargeInfo_btn"><input
					type="button" value="홈으로 가기" id="homeGo_btn">
			</div>
		</div>
		<div class="row pt-5 pb-2">
			<div class="col-12">
				<h3>
					<Strong>상품 정보</Strong>
				</h3>
			</div>

		</div>
		<div class="row border text-center">
			<div class="col-1">
				<strong>번호</strong>
			</div>
			<div class="col-6">
				<strong>상품 정보</strong>
			</div>
			<div class="col-1">
				<strong>수량</strong>
			</div>
			<div class="col-2">
				<strong>판매가</strong>
			</div>
			<div class="col-2">
				<strong>배송</strong>
			</div>

		</div>
		<div class="row border text-center bg-gray" style="height: 8em;">
			<div class="col-1" style="margin-top: 3.2em">1</div>
			<div class="col-6">
				<div class="row">
					<div class="col-4" style="margin-top: 0.8em">
						<img src="${ldto.order_image }">
					</div>
					<div class="col-8 text-left" style="margin-top: 1.5em">
						<br> ${ldto.order_title }<br>
						<br> <small>주문번호 : ${ldto.order_number }</small>
					</div>
				</div>
			</div>
			<div class="col-1" style="margin-top: 3em">${ldto.order_quantity }</div>
			<div class="col-2" style="margin-top: 3em">${ldto.order_price }</div>
			<div class="col-2" style="margin-top: 1em">
				<small>입점 업체</small><br> <small>(그룹1)</small><br> <br>
				<small>예상 발송일</small><br> <small>(1.8일 후 발송)</small>

			</div>
		</div>
		<div class="row pt-5 pb-2">
			<div class="col-12">
				<h3>
					<strong>결제 정보</strong>
				</h3>
			</div>
		</div>
		<div class="row border" style="height: 12em; line-height: 2.7em">
			<div class="col-2 border text-center">
				<strong>입금 정보</strong>
			</div>
			<div class="col-10 border bg-gray">kakao Pay</div>

			<div class="col-2 border text-center ">
				<strong>승인 번호</strong>
			</div>
			<div class="col-10 border bg-gray">35373975</div>

			<div class="col-2 border text-center">
				<strong>할부 개월</strong>
			</div>
			<div class="col-10 border bg-gray">일시불</div>

			<div class="col-2 border text-center">
				<strong>결제 금액</strong>
			</div>
			<div class="col-10 border bg-gray">
				<span>${ldto.order_price } 원</span>
			</div>
		</div>

		<div class="row py-5 border-bottom">
			<div class="col-12 py-2">
				<h3>
					<strong>배송 정보</strong>
				</h3>
			</div>
			<div class="row border text-center"
				style="height: 10em; line-height: 4.7em">
				<div class="col-1 border">
					<strong>수령인</strong>
				</div>
				<div class="col-6 border bg-gray">${ldto.order_receipt }</div>
				<div class="col-2 border text-center">
					<strong>휴대전화</strong>
				</div>
				<div class="col-3 border bg-gray">${ldto.order_receipt_phone }</div>

				<div class="col-1 border">
					<strong>배송지</strong>
				</div>
				<div class="col-6 border bg-gray">${ldto.order_receipt_address1 }&nbsp;
					${ldto.order_receipt_address2 } &nbsp; (${ldto.order_receipt_postcode })</div>
				<div class="col-2 border text-center">
					<strong>전화번호</strong>
				</div>
				<div class="col-3 border bg-gray">${ldto.order_receipt_phone }</div>
			</div>
		</div>
	</div>
	<div class="row pb-5"></div>
	<script>
		$("#homeGo_btn").on("click", function() {
			$(location).attr("href", "/home/")
		})
	</script>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>