<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 내역</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row mt-5  border-bottom border-warning">
			<div class="col-12 mb-2">
				<h3>상세 판매 내역</h3>
			</div>
		</div>

		<div class="row text-center border-bottom border-warning  py-2"
			style="padding: 0">
			<div class="col-1">번 호</div>
			<div class="col-1">주문서 번호</div>
			<div class="col-2">주문 일시</div>
			<div class="col-1">상품 수</div>
			<div class="col-1">주문 금액</div>
			<div class="col-1">입금액</div>
			<div class="col-1">미입금액</div>
			<div class="col-1">상태</div>
			<div class="col-1">부가세</div>
			<div class="col-1">최종판매금</div>
			<div class="col-1">구매자</div>

		</div>
		<div class="row text-center border-bottom " style="padding: 0">
			<div class="col-12 my-4">
				<div class="row">
					<div class="col-1">번 호</div>
					<div class="col-1">주문서 번호</div>
					<div class="col-2">주문 일시</div>
					<div class="col-1">상품 수</div>
					<div class="col-1">주문 금액</div>
					<div class="col-1">입금액</div>
					<div class="col-1">미입금액</div>
					<div class="col-1">상태</div>
					<div class="col-1">부가세</div>
					<div class="col-1">최종판매금</div>
					<div class="col-1">구매자</div>
				</div>
			</div>

		</div>
	</div>


	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>