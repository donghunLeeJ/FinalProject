
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매글</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- Latest compiled and minified CSS -->
<style>
#star {
	color: #EC583A;
}

.seller-info {
	margin-top: 1.2em;
}

.quantity_btn {
	width: 1.5em;
	height: 1.5em;
	padding-bottom: 1.5em;
}

.border {
	border: 1px solid #FCBB00;
}
.intro{
width:100%;
height:230px;
}
.ellipsis{
    overflow:hidden;
      text-overflow:ellipsis;
/*       white-space:nowrap; */
display: -webkit-box;
      font-family :'나눔 고딕';
      font-size:25px;
       -webkit-line-clamp: 2; 
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 2.4em;
/*       height:100px; */
/*       border:1px solid black; */
}
.red{
        background-color: #f29202;
        color:white;
        font-size:30px;
        text-align:center;
        height:50px;
    }
    div{ 
/*      border:1px solid black;  */
     } 
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<form id="form" action="/Basket/basketInsert" method="post">
		<div class="container-fluid mt-5">
			<div class="row pt-5 ">
				<div class="col-2"></div>
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
										<div class="row pb-2 pt-2 ">
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
										<div class="row text-center" style="margin-bottom: 0.7em;">
											<div class="col-4"
												style="padding: 0; font-size: 1.5em; margin-top: 0.2em; color: #EC583A">${starAvg }
											</div>
											<div class="col-2 text-left"
												style="padding: 0; margin-top: 0.3em; font-size: 1.5em">
												<strong>${reviewAvg }</strong>
											</div>
											<div class="col-6"
												style="margin-top: 0.6em; font-size: 1.2em">
												상품리뷰 <strong>${reviewRowCount }건</strong>
											</div>
										</div>
										<div class="col-12 red mb-2" id="countdown"></div>
											<div id=countd>
											<c:set var="msg" value="${dto.shop_expiration }" />
											<c:set var="start" value="${fn:split(msg,'-')}" />
											<c:forEach var="i" begin="0" end="0">
												<input type="hidden" value="${start[i]} " id=hi1>
											</c:forEach>
											<br>
											<c:forEach var="i" begin="1" end="1">
												<input type="hidden" value="${start[i]}" id=hi2>
											</c:forEach>
											<br>
											<c:forEach var="i" begin="2" end="2">
												<input type="hidden" value="${start[i]}" id=hi3>
											</c:forEach>
											<br>

										</div>
									</div>
								</div>
							</div>
							<div class="col-1 "></div>
							<div class="col-6">
								<div class="row pb-4 border-bottom">

									<div class="col-4 ">
										<h4 style="font-family :'나눔고딕OTF';">
										[${dto.shop_brand}]

										</h4>
									</div>
										<div class="col-8 ellipsis">
										${dto.shop_title }
									</div>
											 &nbsp;&nbsp;
<!-- 											<strong class="ellipsis"> -->
<!-- 											</strong> -->

								</div>
								<div class="row pb-3 mt-4 border-bottom">
									<div class="col-4">판매 가격</div>
									<div class="col-8">

										<input type="hidden" value="${dto.shop_price }" id="price">

										<p>
											<strong><fmt:formatNumber value="${dto.shop_price }"
													pattern="#,###" />(원)</strong>
										</p>

									</div>
								</div>
								<div class="row pb-3 mt-4  border-bottom">
									<div class="col-4">남은 수량</div>
									<div class="col-8">
										<p>
											<strong><fmt:formatNumber value="${dto.shop_quantity }"
												pattern="#,###" />(개)</strong>
											 <input type="hidden"
												name=basket_quantity value="${dto.shop_quantity }">
										</p>

									</div>
								</div>
								<div class="row pb-3 mt-4 border-bottom">
									<div class="col-4">유통기한</div>
									<div class="col-8">
										<p>
											<strong>${dto.shop_expiration }</strong> <input type="hidden"
												id="expi" name=basket_expiration
												value="${dto.shop_expiration }"><br>
												*유통기한 당일 상품은 구매 불가
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
									<div class="col-4">재료</div>
									<div class="col-8">
										<p>
											<strong>${dto.shop_material }</strong>
										</p>

									</div>
								</div>

								<div class="row pt-2 pb-4">
									<div class="col-6  text-left">
										<span style="margin-right: 1em; text-align: left">구매 가능 수량
											: <strong><fmt:formatNumber
													value="${dto.shop_quantity }" pattern="#,###" />(개)</strong> <%-- 												: <strong><fmt:formatNumber value="${quant }" pattern="#,###" />(개)</strong> --%>
										</span>
									</div>
									<div class="col-6  text-right">
										<strong style="color: red">(최소 주문량 1개 이상) </strong>
									</div>
								</div>

								<div class="row pt-2 border-top border-bottom bg-gray">


									<div class="col-4  py-3 text-right">




										수량 : <input type="text" name="shop_quantity" value="1"id="quantity_one"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')" style="width: 3em; text-align: right">
									</div>
									<div class="col-2"	style="padding-left: 0; padding-right: 0; margin-top: 1.1em">
										<div class="row">
											<div class="col-12">

												<input type="button" value="+" id="up_btn"class="quantity_btn"> 
												<input type="button" value="-" id="down_btn" class="quantity_btn">

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
										<span style="margin-right: 2em"><strong>총 상품금액(택배비 포함)
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
	<div class="col-2"></div>

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
						<div class="col-lg-12 intro border">
							<p>${dto.shop_contents}</p>
						</div>

					</div>

					<!-- 리뷰 작성 -->
					<div class="tab-pane" id="messages">
						<div class="row border-bottom py-3 ">
							<div class="col-12">
								<h2 style="font-family: '나눔고딕OTF';">프리미엄 상품평</h2>
							</div>
						</div>
						<c:forEach var="i" items="${ review}">
							<div class="row border-bottom">
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
							<div class="col-2 font-weight-bold seller-info">브랜드(종류)</div>
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
$("#countd").hide();
	var popupX = (window.screen.width / 2) - (500 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (600 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		
		function parse(str) {
   	 		var y = str.substr(0, 4);
    		var m = str.substr(5, 2);
    		var d = str.substr(8, 2);
    		return new Date(y,m-1,d);
		}
	
		$("#quantity_one").on("input", function() {
			var quantity = Number($("#quantity_one").val());
			var price = Number($("#price").val());
			var result = quantity * price;
			$("#resultPrice").text(result + "원");
			$("#resultPrice1").text(result + "원");
			if(${dto.shop_quantity}-$("#quantity_one").val() < 0){
				alert("수량이 초과되었습니다.");
				$("#quantity_one").val("${dto.shop_quantity }");
			
			}
		});
		
// 	$("#quantity_one").on("change", function() {
// 				if(${dto.shop_quantity}-$("#quantity_one").val() < 0){
				
// 							var quantity = $("#quantity_one").val();
// 							location.href = "/shopboard/shopBoard_buyProc?quantity="
// 									+ quantity + "&seq=${dto.shop_seq }"
							
// 				alert("수량이 초과되었습니다.");
// 				$("#quantity_one").val("1")
// 			}
// 	});
		
		
		
		$("#chargeItem").on("click",function(){
			var date = $("#expi").val();
			var expidate = parse(date);
			var nowdate = new Date();
			if(${id == null}){
				alert("로그인이 필요합니다");
	       		window.open('/home/minilog', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
			}else{
				if(${dto.shop_quantity}-$("#quantity_one").val() >= 0 && expidate >= nowdate){
							var quantity = $("#quantity_one").val();
							location.href = "/shopboard/shopBoard_buyProc?quantity="
									+ quantity + "&seq=${dto.shop_seq }";
				}else if(expidate <= nowdate  ){
					alert("유통기한이 지났습니다.");
				}
				else{
				alert("수량이 초과되었습니다.");
				$("#quantity_one").val("${dto.shop_quantity }");
				}
			}
		});
		
		$("#basket").on("click",function() {
			var date = $("#expi").val();
			var expidate = parse(date);
			var nowdate = new Date();
			if(${id == null}){
				alert("로그인이 필요합니다");
	       		window.open('/home/minilog', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
			}else{
				if(${dto.shop_quantity}-$("#quantity_one").val() >= 0 && expidate >= nowdate){
					
					var quantity = $("#quantity_one").val();
					location.href = "/Basket/basketInsert?quantity="+ quantity + "&seq=${dto.shop_seq }"
				
				}else if(expidate <= nowdate){
					alert("유통기한이 지났습니다.")
				}else{
					alert("수량이 초과되었습니다.");
					$("#quantity_one").val("${dto.shop_quantity }");
				}
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
			if(${dto.shop_quantity}-$("#quantity_one").val() < 0){
				alert("수량이 초과되었습니다.");
				$("#quantity_one").val("${dto.shop_quantity }");
			}

		});

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
		
		$("#quantity_one").keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
	</script>
	  <script>
	  var hi1 = $("#hi1").val();
	  var hi2 = $("#hi2").val();
	 var hi3 = $("#hi3").val()
	
   CountDownTimer(hi2+'/'+hi3+'/'+hi1, 'countdown'); // 2017년 1월 1일까지
//CountDownTimer('01/01/2019 00:00 AM', 'newcountdown'); // 2018년 1월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용합니다.

function CountDownTimer(dt, id)
{
var end = new Date(dt);

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

function showRemaining() {
var now = new Date();
var distance = end - now;
if (distance < 0) {

clearInterval(timer);
document.getElementById(id).innerHTML = '판매 종료!';

return;
}
var days = Math.floor(distance / _day);
var hours = Math.floor((distance % _day) / _hour);
var minutes = Math.floor((distance % _hour) / _minute);
var seconds = Math.floor((distance % _minute) / _second);

document.getElementById(id).innerHTML = days + '일 ';
document.getElementById(id).innerHTML += hours + '시간 ';
document.getElementById(id).innerHTML += minutes + '분 ';
document.getElementById(id).innerHTML += seconds + '초';
}

timer = setInterval(showRemaining, 1000);
}
    </script>
</body>
</html>
