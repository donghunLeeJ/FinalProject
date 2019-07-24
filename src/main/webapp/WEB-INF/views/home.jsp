<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- 구글 맵 API -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBJPpkHrAjmxY5-i1zd8qgs6mO6Ybi_jL4 " ></script>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
.carousel-caption {
	top: auto;
	bottom: auto;
}

#map_ma {width:100%; height:400px; clear:both; border:solid 0px;}


</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>


	<section class="welcome-area">
	<div id="carouselExampleInterval" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="carousel-caption d-none d-sm-block">
					

				</div>
				<img src="/img/bg-img/888.jpg" class="d-block w-80" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption d-none d-md-block">
				
				
				</div>
				<img src="/img/bg-img/resultBack.jpg" class="d-block w-80" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption d-none d-md-block">
					
				
				</div>
				<img src="/img/bg-img/resultBack2.png" class="d-block w-80"
					alt="...">
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






	</section>
	<section class="why-choose-us-area  section-padding-80-0">
		
	
	 </section>
	 
	<div id="map_ma"></div>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	
			<script>
			
			$(document).ready(function() {
				var myLatlng = new google.maps.LatLng(37.567642, 126.982817); // 위치값 위도 경도
		var Y_point			= 37.567642;		// Y 좌표
		var X_point			= 126.982817;		// X 좌표
		var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
		var markerTitle		= "대구광역시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
		var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

	// 말풍선 내용
		var contentString	= '<div>' +
		'<h2>아키마</h2>'+
		'<p>안녕하세요. 구글지도입니다.</p>' +
		
		'</div>';
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
							zoom: zoomLevel,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						}
		var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
		var marker = new google.maps.Marker({
												position: myLatlng,
												map: map,
												title: markerTitle
		});
		var infowindow = new google.maps.InfoWindow(
													{
														content: contentString,
														maxWizzzdth: markerMaxWidth
													}
				);
		google.maps.event.addListener(marker, 'click', function() {
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