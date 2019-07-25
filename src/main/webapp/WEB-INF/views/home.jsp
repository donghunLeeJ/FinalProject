<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Akame</title>
<!-- 구글 맵 API -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyBJPpkHrAjmxY5-i1zd8qgs6mO6Ybi_jL4 "></script>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
.carousel-caption {
	top: auto;
	bottom: auto;
}

body { font-family :'나눔고딕OTF';}

#img1{
height:220px;
}
/* div{ */
/* border:1px solid black; */
/* } */

#map_ma {width:100%; height:400px; clear:both; border:solid 0px;}
.form-control[readonly] {
	background-color: white;

}

#map_ma {
	width: 100%;
	height: 400px;
	clear: both;
	border: solid 0px;
}
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>


	<section class="welcome-area">
	<div id="carouselExampleInterval" class="carousel slide"
		data-ride="carousel" style="z-index: -1000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="carousel-caption d-none d-sm-block"></div>
				<img src="/img/bg-img/back2.jpg" class="d-block w-80" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption d-none d-md-block"></div>
				<img src="/img/bg-img/back3.jpg" class="d-block w-80" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption d-none d-md-block"></div>
				<img src="/img/bg-img/back4.jpg" class="d-block w-80" alt="...">
			</div>


		</div>
		<a class="carousel-control-prev" href="#carouselExampleInterval"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleInterval"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	</section>
	<section class="why-choose-us-area bg-gray section-padding-80-0">

		<div class="container">
			<div class="row mb-5">
				<div class="col-12 border-bottom p-2">
					<h2 style="font-family :'나눔고딕OTF';">□ 최근 등록 상품 <a href="/shopboard/shopBoardGo?page=1"><span style="font-size: small;">더보기</span></a></h2>
				</div>	
					<c:forEach var="i" items="${boardList }">
					  <c:choose>
					   <c:when test="${i.shop_quantity eq 0}">
                <div   class="col-12 col-sm-6 col-lg-3  mb-5 mt-3" data-wow-delay="500ms">
                        <div class="" style="height: 250px">
                           
                           	 <div style="position: absolute;">
								   <div style="position: relative; top: 70px; left: 0px;">
								   <img src="/img/core-img/soldout.png" >
								</div>
								</div>
								<img src="${i.shop_imagepath1 }" id="img1"  alt="" >

                           <!-- Thumbnail Zoom -->
                           <a href="#}" class=""><i class=""></i></a>
                        </div>
                        <div class="team-member-info border">
                           <div class="row">
                              <div class="col-12"></div>
                           </div>
                        </div>
                     </div>
                  </c:when>
					<c:otherwise>
							<div class="col-12 col-sm-6 col-lg-3 akame-portfolio-item haircuts mb-5 mt-3 wow fadeInUp"data-wow-delay="500ms">
							<a href="/shopboard/ShopBoardViewProc?seq=${i.shop_seq }">
								<div class="akame-portfolio-single-item" style="height: 250px">
									<img src="${i.shop_imagepath1 }" id="img1" alt="">
									<!-- Overlay Content -->
									<div
										class="overlay-content d-flex align-items-center justify-content-center">
										<div class="overlay-text text-center">
											<span style="font-size: 15px; color: #e1e5eb;">${i.shop_title }</span>

											<p class="pt-3">
												<fmt:formatNumber value="${ i.shop_price}" pattern="#,###" />
												원
											</p>
										</div>
									</div>

									<!-- Thumbnail Zoom -->
<%-- 									<a href="${i.shop_imagepath1 }" class="thumbnail-zoom"><i --%>
<!-- 										class="icon_search"></i></a> -->

								</div>
								<div class="team-member-info border">
									<div class="row">
										<div class="col-12"></div>
									</div>
								</div>
								</a>
							</div>
							 </c:otherwise>
									</c:choose>
						</c:forEach>


		</div>
	</div>

	</section>
	<section class="contact-information-area section-padding-80-0">
	<div class="container">
		<div class="row mb-5">
			<div class="col-12 border-bottom mb-5 p-2">
				<h2 style="font-family: '나눔고딕OTF';">□ 오시는 길</h2>
			</div>
			<!-- Single Contact Information -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="single-contact-information mb-80">
					<i class="icon_phone"></i>
					<h4>Phone</h4>
					<p>+01-3-8888-6868</p>
				</div>
			</div>

			<!-- Single Contact Information -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="single-contact-information mb-80">
					<i class="icon_pin"></i>
					<h4>Address</h4>
					<p>Iris Watson, 283 Fusce Rd,NY</p>
				</div>
			</div>

			<!-- Single Contact Information -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="single-contact-information mb-80">
					<i class="icon_clock"></i>
					<h4>Open time</h4>
					<p>10:00 am to 23:00 pm</p>
				</div>
			</div>

			<!-- Single Contact Information -->
			<div class="col-12 col-sm-6 col-lg-3">
				<div class="single-contact-information mb-80">
					<i class="icon_mail"></i>
					<h4>Email</h4>
					<p>info.colorlib@gmail.com</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<div id="map_ma"></div>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

	<script>
		$(document)
				.ready(
						function() {
							var myLatlng = new google.maps.LatLng(37.567642,
									126.982817); // 위치값 위도 경도
							var Y_point = 37.567642; // Y 좌표
							var X_point = 126.982817; // X 좌표
							var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
							var markerTitle = "대구광역시"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
							var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

							// 말풍선 내용
							var contentString = '<div>' + '<h2>아키마</h2>'
									+ '<p>안녕하세요. 구글지도입니다.</p>' +

									'</div>';
							var myLatlng = new google.maps.LatLng(Y_point,
									X_point);
							var mapOptions = {
								zoom : zoomLevel,
								center : myLatlng,
								mapTypeId : google.maps.MapTypeId.ROADMAP
							}
							var map = new google.maps.Map(document
									.getElementById('map_ma'), mapOptions);
							var marker = new google.maps.Marker({
								position : myLatlng,
								map : map,
								title : markerTitle
							});
							var infowindow = new google.maps.InfoWindow({
								content : contentString,
								maxWizzzdth : markerMaxWidth
							});
							google.maps.event.addListener(marker, 'click',
									function() {
										infowindow.open(map, marker);
									});
						});

		//페이지가 갱신되는 순간 조건을 만족할 경우 방문자수를 증가시키도록 정보를 보내는 ajax
		$.ajax({

			url : "/admin/VisitViewCondition",
			type : "post",
			data : {
				access : "${access}"
			}

		}).done(function(resp) {

		}).fail(function() {

			alert("에러 발생!");

		});
	</script>
</body>
</html>