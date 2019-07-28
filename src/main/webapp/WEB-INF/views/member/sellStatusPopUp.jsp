<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 내역</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
.btn {
	background: #dde1e5;
	color: #fff;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
	width: 7em;
	height: 3em;
	cursor: pointer;
}

.btn:hover {
	color: white;
	border: black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
}

.delivery_btn {
	background: #dde1e5;
	color: #fff;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
	width: 5em;
	height: 2.3em;
	cursor: pointer;
}

.delivery_btn2 {
	background: #dde1e5;
	color: white;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
	width: 5em;
	height: 2.3em;
}
</style>
</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<section class="why-choose-us-area bg-gray pt-3">
	<div class="container">
		<div class="row mt-5  border-bottom ">
			<div class="col-6 mb-3">
				<h3 style="font-family: '나눔고딕OTF';">상세 판매 내역</h3>
			</div>
			<div class="col-6 mb-3 text-right">
				<input type="button" class="btn" id="back_btn" value="이전 페이지">
			</div>
		</div>

		<div class="row text-center border  py-2"
			style="padding: 0; background: #dde1e5">

			<div class="col-2 font-weight-bold">주문서 번호</div>
			<div class="col-2 font-weight-bold">주문일시</div>
			<div class="col-1 font-weight-bold">상품 수</div>
			<div class="col-1 font-weight-bold">주문금액</div>
			<div class="col-1 font-weight-bold">입금액</div>
			<div class="col-2 font-weight-bold">최종판매금</div>
			<div class="col-2 font-weight-bold">구매자</div>
			<div class="col-1 font-weight-bold">배송</div>

		</div>

		<!-- 		Products_order를 products_seq로 select함 상품에대한 구매내역 뽑아옴-->
		<c:forEach var="i" items="${dto }">
			<div class="row text-center border-bottom "
				style="padding: 0; background: white">
				<div class="col-12 my-4">
					<div class="row">

						<div class="col-2" style="margin-top: 0.3em">${i.order_number }</div>
						<div class="col-2" style="margin-top: 0.3em">${i.order_time }</div>
						<div class="col-1" style="margin-top: 0.3em">${i.order_quantity }</div>
						<div class="col-1" style="margin-top: 0.3em">
							<input id="deliveryCheck${i.order_seq }" type="hidden"
								value="${i.order_delivery }">

							<fmt:formatNumber value="${i.order_price }" pattern="#,###" />
						</div>
						<div class="col-1" style="margin-top: 0.3em">
							<fmt:formatNumber value="${i.order_price }" pattern="#,###" />
						</div>
						<div class="col-2" style="margin-top: 0.3em">
							<fmt:formatNumber value="${i.order_price }" pattern="#,###" />
						</div>
						<div class="col-2" style="margin-top: 0.3em">${i.order_buyer_email }</div>
						<div class="col-1" style="padding: 0">
							<input type="button" class="delivery_btn"
								id="delivery_btn${i.order_seq }" value="발송완료">
							<script>
							if($("#deliveryCheck${i.order_seq }").val() == "y"){
								
								$("#delivery_btn${i.order_seq}").attr("disabled",true).css("cursor","default").css("background-color","red");
							}else{
						
								$("#delivery_btn${i.order_seq}").attr("disabled",false);
							}
							</script>
						</div>
					</div>

				</div>
			</div>
			<script>
				$("#delivery_btn${i.order_seq}").on("click",
								function() {
									if (confirm("발송완료를 신청하시겠습니까? (취소 불가)") == true) {
										$.ajax({
											type : "post",
											url : "/member/deliveryOk",
											data : {
												order_delivery : "y",
												order_seq : ${i.order_seq}
											
											}
											
										}).done(function(resp){
											if(resp == "O"){
												alert("발송 완료! ");
												$("#delivery_btn${i.order_seq}").attr("disabled",true).css("cursor","default").css("background-color","red");
											}else{
												
											}
										})
										
										//$(location).attr("href","/member/deliveryOk?order_delivery=y&order_seq=${i.order_seq}")

									}
								})
			</script>
		</c:forEach>
		<div class="row mt-2">
			<div class="col-12 text-right">
				총 판매 수량 : <strong> ${total_quantity }</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				총 판매 금액 : <strong style="color: red"><fmt:formatNumber
						value="${total_price }" pattern="#,###" /></strong> 원
			</div>
		</div>


	</div>
	</section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
		$("#back_btn").on("click", function() {
			$(location).attr("href", "/shopboard/sellContentsGo");
		})
	</script>
</body>
</html>