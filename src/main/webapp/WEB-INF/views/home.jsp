<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
.carousel-caption {
	top: auto;
	bottom: auto;
}
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

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	
			<script>
			//같은 세션인지 아닌지를 따져서 방문자수를 증가시키거나 유지시키는 ajax
			//(이 에이잭스는 홈페이지가 실행되면서 같이 실행된다.)
			//한번 홈페이지에 접속한 세션일 경우 새로고침을 아무리 해도 해당 세션이 만료될 때까지 방문자수가 올라가지 않는다.
				$.ajax({
					
						url : "/admin/VisitViewCondition?access=${access}",
						type : "post"
						
							}).done(function(resp) {													
						});
			</script>
</body>
</html>