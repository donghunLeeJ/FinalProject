<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="../css/style2.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<style>
input[type="text"] {
	box-shadow: 4px 4px 5px #gray inset;
	border-radius: 5px;
}

.mypage_btn1 {
	width: 5em;
	height: 2em;
	background-color: white;
	border: 1px solid black;
	margin-bottom: 0.1em;
	cursor: pointer;
}

.mypage_btn2 {
	width: 5em;
	height: 2em;
	background-color: white;
	border: 1px solid black;
	cursor: pointer;
}
.ellipsis{
    overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;    
}
/*  div{  */
/*  border:1px solid black;  */
/*  }  */
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<section class="breadcrumb-area section-padding-80 border">
	<div class="container ">
		<div class="row ">
			<div class="col-12">
				<div class="breadcrumb-content">
					<h2 style="font-family :'나눔고딕OTF';">장바구니</h2>
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/home"><i
								class="icon_house_alt"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">장바구니</li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</section>

	<div class="container mt-3">
		
		<div class="row border-bottom border-top py-2 bg-gray">
			<div class="col-6">
				<h3 style="font-family :'나눔고딕OTF';">장바구니</h3>
			</div>
<!-- 			<div class="col-6 " style="text-align: right"> -->
<!-- 				<h3 style="font-family :'나눔고딕OTF';">장바구니 주문/결제 주문완료</h3> -->
<!-- 			</div> -->
		</div>

		<div class="row py-3">
			<div class="col-6 font-weight-bold text-bottom">
				<span class="">장바구니 상품 확인</span>
			</div>
<!-- 			<div class="col-6 text-bottom" style="text-align: right"> -->
<!-- 				<p style="font-family :'나눔고딕OTF';">*상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p> -->
<!-- 			</div> -->

		</div>
		<form action="/Basket/asd" id="chargeForm">
			<div class="row border-bottom border-top bg-gray text-center py-2">
				<div class="col-1 py-2"><input type="checkbox" onclick="checkAll();" /></div>
				<div class="col-3">상품/옵션정보</div>
				<div class="col-2">유통기한</div>
				<div class="col-1">수량(개)</div>
				<div class="col-1">금액</div>
				<div class="col-1">지역</div>
				<div class="col-2">배송비/판매자</div>
				<div class="col-1">삭제</div>
			</div>

			<c:forEach var="list" items="${list }">

				<div class="row border-bottom border-top text-center py-4">
				<div class="col-1 pt-4">
				<input id="check${list.basket_seq }" type="checkbox" name="check" 
				value="${list.basket_seq }" class="check" />
				</div>
					<div class="col-3 " style="line-height: 4em;">
				  <a href="/shopboard/ShopBoardViewProc?seq=${list.product_seq }">
						<div class="row">
							<div class="col-4">
									<img src="${list.basket_imagepath }"> 
									<input type="hidden" name="hiddenValue" id="hiddenValue" value="" /> 
									<input type="hidden" id="seq${list.basket_seq }"value="${list.basket_seq }" />
							</div>
							<div class="col-8 ellipsis">${list.basket_title}</div>
						</div>
					</a>
					</div>
					<div class="col-2" style="line-height: 4em;">${list.basket_expiration}</div>
					<div class="col-1" style="line-height: 4em;">${list.basket_quantity}</div>
					<div class="col-1" style="line-height: 4em;">${list.basket_price}</div>
					<input type="hidden" id="toPrice${list.basket_seq }"
						value="${list.basket_price}">
					<div class="col-1" style="line-height: 4em;">${list.basket_location}</div>
					<div class="col-2" style="line-height: 1.4em;">
						선결제 <br> <strong>(2,500원)</strong> <br> <small>${list.basket_id}/
							${list.basket_brand}</small>
					</div>
					<div class="col-1 text-center p-2" >
						<button type="button" id="delete${list.basket_seq }"
							class="mypage_btn2" style="margin-right: 0.3em" >삭제 하기</button>
					</div>
				</div>
				<script>
					$("#delete${list.basket_seq }").on("click",	function() {
										if (confirm("정말 삭제하시겠습니까?") == true) {
											var basket_seq = $(
													"#seq${list.basket_seq }")
													.val();
											location.href = "/Basket/basketDelete?basket_seq="
													+ basket_seq;
										} else {
											null;
										}
									})

					$("#check${list.basket_seq }")
							.on(
									"click",
									function() {
										var total = 0;
										var count = $("#check${list.basket_seq }").length;
										var price = $(
												"#toPrice${list.basket_seq }")
												.val();

										var check = $(
												"#check${list.basket_seq }")
												.prop("checked");

										if (check == true) {

											var ad = total
													+ Number($(
															"#toPrice${list.basket_seq}")
															.val());
											var ds = $("#totalPrice").text(ad);
											var sd = ds
													+ Number($(
															"#toPrice${list.basket_seq}")
															.val());

											$("#totalPrice").text(sd);

											var price = $("#check12321").attr(
													"price");

										}
									})

					function fnGetdata() {
						var obj = $("[name=check]");
						var chkArray = new Array(); // 배열 선언

						if ($('input:checkbox[name=check]:checked').is(
								":checked") == false) {

							alert("상품을 선택하세요");
						} else {

							$('input:checkbox[name=check]:checked').each(
									function() { // 체크된 체크박스의 value 값을 가지고 온다.
										chkArray.push(this.value);

									});

							$('#hiddenValue').val(chkArray);

							//alert($('#hiddenValue').val());  아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.

							location.href = "/Basket/asd?basket_seq="
									+ $("#hiddenValue").val();
						}
					}
				</script>
			</c:forEach>
		</form>

		<div class="row py-5 border-bottom">
			<div class="col-12 text-center">
				<a id="charge" class="btn akame-btn mr-3" onclick="fnGetdata();">결
					제 하 기 </a> 
<!-- 					<a href="#" class="btn akame-btn ml-3">결 제 취 소</a> -->
			</div>
		</div>
	</div>



	<script>
		var checkAll = function() {

			$(".check").click();
		}

		
	</script>




	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>





</body>
</html>