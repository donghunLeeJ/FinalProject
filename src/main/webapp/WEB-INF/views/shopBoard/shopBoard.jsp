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
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<!-- /header -->
	<section class="akame-about-area section-padding-80-0">
	<div class="container">
		<div class="row">
			<c:forEach var="i" items="${boardList }">
				<div class="col-lg-3">
					<div class="single-team-member mb-80 wow fadeInUp"
						data-wow-delay="200ms">
						<div class="team-member-img">
							<img src="${i.shop_imagepath }" alt="">
							<!-- Social Info -->
							<div
								class="team-social-info d-flex align-items-center justify-content-center">
								<div class="social-link">
									<button class="btn btn-outline-warning">상품보기</button>

								</div>
							</div>
						</div>
						<div class="team-member-info">
							<h5>${i.shop_title }</h5>
							<p>${i.shop_contents }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>

	<script>
		$(window).scroll(
				function() {
					// 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
					// 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
					var chkBtm = parseInt($(document).height())
							- parseInt($(window).height());

					if (chkBtm == $(window).scrollTop()) {
						// 최하단으로 도달했을 경우
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