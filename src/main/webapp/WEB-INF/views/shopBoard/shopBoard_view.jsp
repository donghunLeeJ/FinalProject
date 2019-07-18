
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
#star {
	color: red;
}

.seller-info {
	margin-top: 1.2em;
}

.quantity_btn {
	width: 1.5em;
	height: 1.5em;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<form id="form" action="/Basket/basketInsert" method="post">
		<div class="container-fluid mt-5">
			<div class="row pt-5 ">
				<div class="col-2">왼쪽</div>
				<div class="col-8">
					<!-- 상품정보 전체내용 -->
					<div class="container">
						<div class="row">

							<!-- 이미지 칼럼 -->
							<div class="col-5 ">
								<div class="row ml-3 border">
									<!-- 캐러셀 -->
									<div class="col-12 ">
										<div>
											<div class=" py-4">
												<img class="d-block w-100 view"
													src="${dto.shop_imagepath1 }" alt="First slide"
													style="height: 20em"> <input type="hidden"
													name="shop_imagepath1" value="${dto.shop_imagepath1 }">
											</div>
										</div>
										<!-- 	밑에 이미지 3개 -->
										<div class="row pb-3 pt-4 ">
											<div class="col-4 border pt-2 pb-2">
												<img class="imgCa" src="${dto.shop_imagepath1 }" alt="또안됌"
													style="height: 6em">
											</div>
											<div class="col-4 border pt-2 pb-2">
												<img class="imgCa" src="${dto.shop_imagepath2 }" alt="또안됌"
													style="height: 6em">
											</div>
											<div class="col-4 border pt-2 pb-2">
												<img class="imgCa" src="${dto.shop_imagepath3 }" alt="또안됌"
													style="height: 6em">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-1 "></div>
							<div class="col-6">
								<div class="row pb-4 border-bottom">
									<div class="col-12">
										<h4>
											<strong>[${dto.shop_brand}] &nbsp;
												&nbsp;${dto.shop_title }</strong>
										</h4>
									</div>

								</div>
								<div class="row pb-3 mt-4 border-bottom">
									<div class="col-4">판매가</div>
									<div class="col-8">

										<input type="hidden" value="${dto.shop_price }" id="price">

										<p>
											<strong><fmt:formatNumber value="${dto.shop_price }"
													pattern="#,###" /></strong>
										</p>

									</div>
								</div>
								<div class="row pb-3 mt-4  border-bottom">
									<div class="col-4">판매 단위</div>
									<div class="col-8">
										<p>
											<fmt:formatNumber value="${dto.shop_quantity }"
												pattern="#,###" />
											<strong> (개)</strong> <input type="hidden"
												name=basket_quantity value="${dto.shop_quantity }">
										</p>

									</div>
								</div>
								<div class="row pb-3 mt-4 border-bottom">
									<div class="col-4">유통기한</div>
									<div class="col-8">
										<p>
											<strong>${dto.shop_expiration }</strong> <input type="hidden"
												name=basket_expiration value="${dto.shop_expiration }">
										</p>

									</div>
								</div>

								<div class="row pb-3 mt-4 border-bottom">
									<div class="col-4">판매 지역</div>
									<div class="col-8">
										<p>
											<strong>${dto.shop_location }</strong> <input type="hidden"
												name="basket_location" value="${dto.shop_location }">
										</p>

									</div>
								</div>

								<!-- 테이블 추가요망 -->
								<div class="row pb-3 mt-4  border-bottom">
									<div class="col-4">알레르기 정보</div>
									<div class="col-8">
										<p>
											<strong>-밀,계란,우유,밤,함유(공주밤 몽블랑)</strong>
										</p>

									</div>
								</div>

								<div class="row pt-2 pb-4">
									<div class="col-6  text-left">
										<span style="margin-right: 1em; text-align: left">총 수량
											: <strong><fmt:formatNumber
													value="${dto.shop_quantity }" pattern="#,###" />(개)</strong>
										</span>
									</div>
									<div class="col-6  text-right">
										<strong style="color: red">(최소 주문량 1개 이상) </strong>
									</div>
								</div>

								<div class="row pt-2 border-top border-bottom bg-gray">

									<div class="col-12 py-3 border-bottom">
										<strong>${dto.shop_title }</strong>
									</div>

									<div class="col-4  py-3 text-right">




										수량 : <input type="text" name="shop_quantity" value="1"
											id="quantity_one"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')"
											style="width: 3em; text-align: right">
									</div>
									<div class="col-2"
										style="padding-left: 0; padding-right: 0; margin-top: 1.1em">
										<div class="row">
											<div class="col-12">

												<input type="button" value="+" id="up_btn"
													class="quantity_btn"> <input type="button"
													value="-" id="down_btn" class="quantity_btn">

											</div>
										</div>
									</div>

									<div class="col-6 py-3 text-right">
										<small id="resultPrice1" name="shop_price"
											value="${dto.shop_price }"><fmt:formatNumber
												value="${dto.shop_price }" pattern="#,###" />(원)</small>

									</div>
								</div>
								<div class="row border-top border-bottom py-3">
									<div class="col-12 text-right" style="line-height: 2.5em;">
										<span style="margin-right: 2em"><strong>총 상품금액
												:</strong></span><span id="resultPrice" style="font-size: 1.5em; color: red"><fmt:formatNumber
												value="${dto.shop_price }" pattern="#,###" />원</span>
									</div>
								</div>
								<div class="row pb-3 mt-4 border-bottom-0">
									<div class="col-12" style="text-align: center"
										style="font-wight:600">



										<a id="chargeItem" class="btn akame-btn">구 매 하 기 </a> <a
											id=basket class="btn akame-btn"> <i class="icon_cart"></i>장
											바 구 니에 담기
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
	<div class="col-2">오른쪽</div>

	<div class=" pb-5">
		<div class=" col-12"></div>
	</div>

	<section class=" bg-gray">
	<div class="container">
		<div class="row my-2">
			<div class="col-12 order-lg-2">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a href="" data-target="#profile"
						data-toggle="tab" class="nav-link active font-weight-bold">상품
							정보</a></li>
					<li class="nav-item"><a href="" data-target="#messages"
						data-toggle="tab" class="nav-link font-weight-bold">리뷰 작성</a></li>
					<li class="nav-item"><a href="" data-target="#edit"
						data-toggle="tab" class="nav-link font-weight-bold">판매자 정보</a></li>
				</ul>
				<div class="tab-content py-4">
					<!--상품 정보 -->
					<div class="tab-pane active" id="profile">
						<div class="col-lg-12">
							<p>소 개</p>
						</div>

					</div>

					<!-- 리뷰 작성 -->
					<div class="tab-pane" id="messages">
						<div class="row border-bottom py-3 ">
							<div class="col-12">
								<h2>프리미엄 상품평</h2>
							</div>
						</div>
						<c:forEach var="i" items="${ review}">
							<div class="row">
								<div class="col-12">
									<span id="star">${i.get_star }</span> <small
										style="color: gray; margin-left: 1em"> ${i.user_id } |
										[${dto.shop_brand }] | ${i.writeDate }</small>
									<p class="py-2">
										<strong>${i.title }</strong>
									</p>
									<p class="py-2">${i.contents }</p>
								</div>

							</div>
						</c:forEach>
					</div>
					<!-- 판매자 정보 -->
					<div class="tab-pane " id="edit">

						<div class="row border p-2">
							<div class="col-2 font-weight-bold seller-info">대표자(성함)</div>
							<div class="col-4 border-right seller-info">
								<p>${mdto.member_name}</p>
							</div>
							<div class="col-2 font-weight-bold seller-info">브랜드</div>
							<div class="col-4 seller-info" id="brand">
								<p>${dto.shop_brand }</p>
							</div>
						</div>
						<div class="row border p-2 ">
							<div class="col-2 font-weight-bold seller-info">사업자번호</div>
							<div class="col-4 border-right seller-info">
								<p>${mdto.memberSell_seq }</p>
							</div>
							<div class="col-2 font-weight-bold seller-info">판매자고유번호</div>
							<div class="col-4  seller-info">
								<p>2013-서울강남-02629</p>
							</div>

						</div>
						<div class="row border p-2">
							<div class="col-2 font-weight-bold seller-info">연락처</div>
							<div class="col-4 border-right seller-info">
								<p>${mdto.member_phone}</p>
							</div>
							<div class="col-2 font-weight-bold seller-info">E-mail</div>
							<div class="col-4 seller-info">
								<p>${mdto.member_id }</p>
							</div>

						</div>
						<div class="row border p-2">
							<div class="col-2 font-weight-bold seller-info">영업 소재지</div>
							<div class="col-10 seller-info">
								<p>${mdto.member_address1 }&nbsp;
									&nbsp;${mdto.member_address2  } &nbsp; (${mdto.member_postcode })</p>
							</div>
						</div>


						<div class="row mt-5 border rounded" style="height: 10em">
							<div class="col-12 h-50 " style="background-color: #D8D8D8">
								<div class="mt-2 ">
									<h1 class="font-weight-bold display-5">반송지 정보</h1>
								</div>
							</div>

							<div class="col-2 h-50" style="margin-top: 0.3em">
								<div class="mt-4 font-weight-bold ">
									<p>교환 / 반품 주소</p>
								</div>
							</div>

							<div class="col-10 h-50" style="margin-top: 0.3em">
								<div class=" mt-4">
									<p>${mdto.member_address1 },&nbsp;
										&nbsp;${mdto.member_address2  } &nbsp; (${mdto.member_postcode })</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
		$("#quantity_one").on("input", function() {
			var quantity = Number($("#quantity_one").val());
			var price = Number($("#price").val());
			var result = quantity * price;
			$("#resultPrice").text(result + "원");
			$("#resultPrice1").text(result + "원");
		})
		
		$("#chargeItem").on("click",function(){
			if(${dto.shop_quantity}-$("#quantity_one").val() >= 0){
				
							var quantity = $("#quantity_one").val();
							location.href = "/shopboard/shopBoard_buyProc?quantity="
									+ quantity + "&seq=${dto.shop_seq }"
						
				//수량

			}else{
				alert("수량이 초과되었습니다.");
				$("#quantity_one").val("1")
			}
		})
		
		$("#basket").on("click",function() {
			
			if(${dto.shop_quantity}-$("#quantity_one").val() >= 0){
			
				var quantity = $("#quantity_one").val();
				location.href = "/Basket/basketInsert?quantity="+ quantity + "&seq=${dto.shop_seq }"
			
			}else{
				alert("수량이 초과되었습니다.");
				$("#quantity_one").val("1")
			}
		})		
		
		
		
		
		

		var upCount = function() {
			var quantity = Number($("#quantity_one").val());
			var price = "${dto.shop_price}";
			$("#quantity_one").val(quantity + 1);
			$("#quantity_one").val() * price

		}
		var downCount = function() {
			var quantity = Number($("#quantity_one").val());
			$("#quantity_one").val("#quantity_one").val(quantity - 1);

			if (quantity < 2) {
				alert("수량은 최소 1개입니다");
				$("#quantity_one").val("1");
			} else {
				$("#quantity_one").val("#quantity_one").val(quantity - 1);
			}
		}
		//버튼클릭시 수량 추가
		$("#up_btn").on("click", function() {
			upCount();
			var quantity = Number($("#quantity_one").val());
			var price = Number($("#price").val());
			var result = quantity * price;
			$("#resultPrice").text(result + "원");
			$("#resultPrice1").text(result + "원");

		})

		//버튼클릭시 수량 감소
		$("#down_btn").on("click", function() {
			downCount();
			var quantity = Number($("#quantity_one").val());
			var price = Number($("#price").val());
			var result = quantity * price;
			$("#resultPrice").text(result + "원");
			$("#resultPrice1").text(result + "원");
		})

		// 	이미지 클릭시 이미지 확대	
		$(".imgCa").on("click", function() {
			var imgSrc = $(this).attr("src");
			$(".view").attr("src", imgSrc);
		})

		// 		if ($("#star").text() == 1) {
		// 			$("#star").html("★");
		// 		} else if ($("#star").text() == 2) {
		// 			$("#star").html("★★");

		// 		} else if ($("#star").text() == 3) {
		// 			$("#star").html("★★★");

		// 		} else if ($("#star").text() == 4) {
		// 			$("#star").html("★★★★");

		// 		} else if ($("#star").text() == 5) {
		// 			$("#star").html("★★★★★");

		// 		} else {
		// 			$("#star").html("오류");
		// 		}
	</script>
</body>
</html>
