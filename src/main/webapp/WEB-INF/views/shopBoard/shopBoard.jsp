<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<section class="breadcrumb-area section-padding-80 border">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="breadcrumb-content">
					<h2>구매하기</h2>
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/home"><i
								class="icon_house_alt"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">구매하기</li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</section>



	<!-- /header -->
	<section class="akame-about-area bg-gray section-padding-80-0">


	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="container">

					<div class="row">

						<c:forEach var="i" items="${boardList }">
							<div
								class="col-12 col-sm-6 col-lg-3 akame-portfolio-item haircuts mb-5 wow fadeInUp"
								data-wow-delay="500ms">
								<div class="akame-portfolio-single-item" style="height: 250px">
									<img src="${i.shop_imagepath1 }" id="img1" alt="">
									<!-- Overlay Content -->
									<div
										class="overlay-content d-flex align-items-center justify-content-center">
										<div class="overlay-text text-center">
											<a href="/shopboard/ShopBoardViewProc?seq=${i.shop_seq }"><span
												style="font-size: 15px; color: #e1e5eb;">${i.shop_title }</span></a>

											<p class="pt-3">
												<fmt:formatNumber value="${ i.shop_price}" pattern="#,###" />
												&nbsp; 원
											</p>
										</div>
									</div>

									<!-- Thumbnail Zoom -->
									<a href="${i.shop_imagepath1 }" class="thumbnail-zoom"><i
										class="icon_search"></i></a>

								</div>
								<div class="team-member-info border">
									<div class="row">
										<div class="col-12"></div>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>
					<div class="row" id="extendList"></div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

	</section>

	<script>
	
      var count = 2;
      $(window).scroll(
            function() {
               // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
               // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
            
            console.log($(document).height() + " : " + Number($(window).scrollTop())  + " : " + Number($(window).height()));

                 if($(document).height() <= $(window).scrollTop() + $(window).height()+100 ){
                  // 최하단으로 도달했을 경우
                  
               
                  
                  $.ajax({
                     url : "/shopboard/shopBoardScroll",
                     type : "post",
                     data : {
                        page : count
                     }
                  }).done(function(resp) {
                     count++
                     var result = JSON.parse(resp);
                     console.log(result);
                     
                     for(var i = 0 ; i < result.length; i ++){
                     $("#extendList").append(`<div class='col-12 col-sm-6 col-lg-3 akame-portfolio-item haircuts mb-30 wow fadeInUp'
                              data-wow-delay='500ms'`>
                              <div class='akame-portfolio-single-item' style="height: 250px">
                                 <img id='img1' src=`+ result[i].shop_imagepath1+` >

                                 <!-- Overlay Content -->
                                 <div
                                    class='overlay-content d-flex align-items-center justify-content-center'>
                                    <div class='overlay-text text-center'>
                                       <h4>Hairstyle</h4>
                                       <p>Consectetur adipisicing elit sed doe</p>
                                    </div>
                                 </div>

                                 <!-- Thumbnail Zoom -->
                                 <a href=`+ result[i].shop_imagepath1+` class='thumbnail-zoom'><i
                                    class='icon_search'></i></a>

                              </div>
                              <div class='team-member-info border'>
                              <a href='/shopboard/ShopBoardViewProc?seq=`+result[i].shop_seq+`' <h5> `+result[i].shop_title+` </h5></a>
                                 <p>`+ result[i].shop_contents+` </p>
                              </div>
                           </div>`);
                     };
                     })
                  
                  console.log('바닥입니다!');
               } else if ($(window).scrollTop() == 0) {
                  // 최상단으로 도달했을 경우
                  console.log('꼭대기입니다!');
               }
            });
   </script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<!-- /footer -->
</body>
</html>