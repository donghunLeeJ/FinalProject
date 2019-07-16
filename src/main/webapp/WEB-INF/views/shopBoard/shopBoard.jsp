<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
#img1 {
	width: 100%;
	height: 100%;
}

select {
	color: red;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<!-- /header -->
	<section class="akame-about-area section-padding-80-0">


	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2">판매게시판 -> 구매하기 페이지</div>
			<div class="col-lg-8">
				<div class="container">

					<div class="row">
						<!-- Button to Open the Modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">Open modal</button>

						<!-- The Modal -->
						<form action="/shopboard/buyReview" method="POST">
							<div class="modal modal-xl fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h3 class="modal-title">댓글 작성</h3>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body ">

											<div class="row py-5  border-bottom">
												<div class="col-3">이미지</div>
												<div class="col-9">
													[brnad]<br>LMC EARTH LOGO TEE teal<br>
												</div>
											</div>

											<div class="row py-3">
												<div class="col-3">
													<select style="height: 2em" name="star_review">
														<option value="5">★★★★★</option>
														<option value="4">★★★★</option>
														<option value="3">★★★</option>
														<option value="2">★★</option>
														<option value="1">★</option>
													</select>
												</div>
												<div class="col-9">
													<input type="text" name="title" placeholder="제목"
														style="width: 21em; height: 2em">
												</div>
												<div class="col-12 py-3">
													<textarea name="contents" cols="50" rows="7"></textarea>
												</div>
											</div>

										</div>


										<!-- Modal footer -->
										<div class="modal-footer">
											<input type="submit" class="btn btn-primary" value="댓글 작성">
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">댓글 취소</button>
										</div>

									</div>
								</div>
							</div>
						</form>
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
											<h4 class="pb-3">${i.shop_contents }</h4>
											<p class="pt-3">${ i.shop_price}</p>
										</div>
									</div>

									<!-- Thumbnail Zoom -->
									<a href="${i.shop_imagepath1 }" class="thumbnail-zoom"><i
										class="icon_search"></i></a>

								</div>
								<div class="team-member-info border">
									<a href="/shopboard/ShopBoardViewProc?seq=${i.shop_seq }"><h5>${i.shop_title }</h5></a>
									<p>${i.shop_contents }</p>
								</div>
							</div>
						</c:forEach>


					</div>
					<div class="row" id="extendList"></div>
				</div>
			</div>
			<div class="col-lg-2">ShopBoard.jsp</div>
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