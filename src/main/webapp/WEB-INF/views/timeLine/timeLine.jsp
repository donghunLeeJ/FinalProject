<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style>
	#optionbtn{
		width:2em;
		height:2em;
	}
</style>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
</style>
</head>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
   <!-- Preloader -->
    <jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
   <!-- Header Area End -->


	<!-- Welcome Area Start -->


	<!-- About Area Start -->
	<section class="akame-about-area section-padding-80-0"> <!--        --------------------------------------------------------------------------------------------------- -->
	<button id="writebtn">글쓰기</button>
	<script>
      $("#writebtn").on("click",function(){
         $(location).attr("href", "/timeline/tl_boardWrite")
      })
   </script>
	<div class="container " id="startSns">
		<c:forEach var="i" items="${result}">
			<div class="row mt-4">
				<div class="col-lg-6 border" style="margin: 0 auto">
					<div class="row py-3">
						<div class="col-lg-2 text-center">
							<img class="rounded-circle" alt=""
								src="/img/core-img/empty_profile.png">${i.tl_writer }</div>
						<div class="col-lg-8 py-2 text-center">${i.tl_title }</div>
						<div class="col-lg-2 text-right"><button id="optionbtn${i.tl_board_seq}" style="background-color:white; border:none;"><i class="xi-bars"></i></button></div>
					</div>
					<div class="single-post-area">
						<div class="post-thumbnail" style="text-align: center">
							<img src="${i.tl_imgaddr}" alt="">
						</div>
						<div class="post-content">

							<div class="post-meta">
								<a href="#" class="post-date"><i class="icon_clock_alt">작성일</i>
									${i.tl_writedate}</a> <a href="#"
									class="post-comments"><i class="icon_chat_alt">조회수</i>
									${i.tl_likecount }</a>
							</div>
							<p>${i.tl_contents }</p>
						</div>
					</div>
				</div>
			</div>
			<script>
			$('#optionbtn${i.tl_board_seq}').on('click',function(){
				alert('gd');
			})
			
			</script>
		</c:forEach>
		</div>
		<div class="row mt-4"></div>
	</section>
			
			
	
	
	<script>
      var count = 2;
      $(window).scroll(
            function() {
               // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
               // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
                  if($(document).height() <= $(window).scrollTop() + $(window).height() ){
                  // 최하단으로 도달했을 경우
                  $.ajax({
                     url : "/timeline/ajaxProc",
                     type : "post",
                     data : {
                        page : count
                     }
                  }).done(function(resp) {
                     count++
                     var result = JSON.parse(resp);
                     console.log(result[0].tl_contents);
                     console.log(result);
                     for(var i = 0 ; i < result.length ; i ++){

                    	 
                     $("#startSns").append(`<div class='row mt-4'><div class='col-lg-6 border' style='margin: 0 auto'>
 					<div class='row py-3'>
					<div class='col-lg-2'>
						<img class='rounded-circle'
							src='/img/core-img/empty_profile.png'>`+result[i].tl_writer+` </div>
					<div class='col-lg-8 py-2'>`+result[i].tl_title +`</div>
					<div class='col-lg-2 text-right'><button id='optionbtn`+result[i].tl_board_seq+`' style='background-color:white; border:none;'><i class='xi-bars'></i></button></div>
					
				</div>
				<div class='single-post-area'>
					<div class='post-thumbnail' style='text-align: center'>
						<img src='`+result[i].tl_imgaddr+`'>
					</div>
					<div class='post-content'>

						<div class='post-meta'>
							<a href='#' class='post-date'><i class='icon_clock_alt'>작성일</i>
							`+result[i].tl_writedate+`</a> <a href='#'
								class='post-comments'><i class='icon_chat_alt'>조회수</i>
								`+result[i].tl_likecount+`</a>
						</div>
						<p>`+result[i].tl_contents+`</p>
					</div>
				</div>
			</div></div>
			    })
                  
                  console.log('바닥입니다!');
               } else if ($(window).scrollTop() == 0) {
                  // 최상단으로 도달했을 경우
                  console.log('꼭대기입니다!');
               }
            });
   </script>



	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>