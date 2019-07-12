<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<div class="container mt-3">
		<div class="row  pb-3 border-bottom">
			<div class="col-12" style="text-align: right">
				<a href="#" class="btn akame-btn">이전 페이지 </a>
			</div>
		</div>

		<div class="row border-bottom border-top py-2">
			<div class="col-6">
				<h3>주문결제</h3>
			</div>
			<div class="col-6 " style="text-align: right">
				<h3>장바구니 주문/결제 주문완료</h3>
			</div>
		</div>

		<div class="row py-3">
			<div class="col-6 font-weight-bold">주문상품 확인</div>
			<div class="col-6" style="text-align: right">
				<p>*상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p>
			</div>

		</div>
		<div class="row border-bottom border-top bg-gray text-center">
			<div class="col-3">상품/옵션정보</div>
			<div class="col-1">수량(개)</div>
			<div class="col-1">상품금액</div>
			<div class="col-1">지역</div>
			<div class="col-4">유통기한</div>
			<div class="col-2">배송비/판매자</div>
		</div>
		<div class="row border-bottom border-top  text-center py-4">
			<div class="col-3 ">
				<div class="row">
					<div class="col-4">이미지</div>
					<div class="col-8">제목</div>

				</div>
			</div>
			<div class="col-1">1</div>
			<div class="col-1">24,440(원)</div>
			<div class="col-1">서울</div>
			<div class="col-4">2019.07.11~2019.07~</div>
			<div class="col-2">
				선결제 <br> <strong>(2,500원)</strong> <br> <small>판매자
					브랜드</small>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>