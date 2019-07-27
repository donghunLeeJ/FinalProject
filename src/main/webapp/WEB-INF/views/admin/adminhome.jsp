<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 홈</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/adminHead.jsp"></jsp:include>
	<section class="akame-contact-area bg-gray section-padding-50">
		<div class="container bg-color-grey">
			<div class="row mx-auto">
				<div class="col-lg-11  m-3 pt-2 rounded mx-auto">
					<div class="row">
						<div class="col-lg-4 border">
							<div class="row">
								<div class="col-lg-12 border-bottom text-center"
									style="background: #d3dbe8">
									<p class="h2 pt-5 pb-5">오늘의 방문자 수</p>
								</div>
								<div class="col-lg-12 border-bottom text-center"
									style="background: #ffffff">
									<p class="h2 pt-5 pb-5">${View}</p>
								</div>
							</div>

						</div>
						<div class="col-lg-4 border">
							<div class="row">
								<div class="col-lg-12 border-bottom text-center"
									style="background: #d3dbe8">
									<p class="h2 pt-5 pb-5">오늘의 게시글 수</p>
								</div>
								<div class="col-lg-12 border-bottom text-center"
									style="background: #ffffff">
									<p class="h2 pt-5 pb-5">${BoardNew}</p>
								</div>
							</div>

						</div>
						<div class="col-lg-4 border">
							<div class="row">
								<div class="col-lg-12 border-bottom text-center"
									style="background: #d3dbe8">
									<p class="h2 pt-5 pb-5">오늘의 거래 수</p>
								</div>
								<div class="col-lg-12 border-bottom text-center"
									style="background: #ffffff">
									<p class="h2 pt-5 pb-5">${Trade}</p>
								</div>
							</div>

						</div>

					</div>


				</div>
				<div class="col-lg-5 border m-3 pt-3 rounded mx-auto"
					style="background: #ffffff">
					<strong> 회원 관리 </strong> <a href="/admin/MemberManagementMove">
						바로가기 </a>

					<table class="table mt-3 border text-center">

						<thead class="thead-dark ">
							<tr>
								<th class="p-1" scope="col">ID</th>
								<th class="p-1" scope="col">이름</th>
								<th class="p-1" scope="col">전화번호</th>
								<th class="p-1" scope="col">불량회원</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="i" items="${MemberList}" begin="0" end="2">

								<tr>
									<th class="p-1">${i.member_id}</th>
									<td class="p-1">${i.member_name}</td>
									<td class="p-1">${i.member_phone}</td>
									<td class="p-1">${i.member_blackcheck}</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>


				<div class="col-lg-5 border m-3 pt-3 rounded mx-auto"
					style="background: #ffffff">
					<strong> 판매 게시판 관리 </strong> <a
						href="/admin/ShopBoardManagementMove"> 바로가기 </a>
					<table class="table mt-3 border text-center">
						<thead class="thead-dark">
							<tr>
								<th class="p-1" scope="col">제목</th>
								<th class="p-1" scope="col">가격</th>
								<th class="p-1" scope="col">수량</th>
								<th class="p-1" scope="col">유통기한</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="i" items="${ShopBoardList}" begin="0" end="2">
								<tr>
									<th class="p-1">${i.shop_title}</th>
									<td class="p-1">${i.shop_price}원</td>
									<td class="p-1">${i.shop_quantity}개</td>
									<td class="p-1">${i.shop_expiration}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>

				<div class="col-lg-5 border m-3 pt-3 rounded mx-auto"
					style="background: #ffffff">
					<strong> 구매내역 관리 </strong> <a href="/admin/OrderManagementMove">
						바로가기 </a>
					<table class="table mt-3 border text-center">
						<thead class="thead-dark">
							<tr>
								<th class="p-1" scope="col">주문번호</th>
								<th class="p-1" scope="col">주문금액/수량</th>
								<th class="p-1" scope="col">주문일자</th>
								<th class="p-1" scope="col">주문자</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="i" items="${OrderBoardList}" begin="0" end="2">
								<tr>
									<th class="p-1">${i.order_number}</th>
									<td class="p-1">${i.order_price}원/${i.order_quantity}개</td>
									<td class="p-1">${i.order_time}</td>
									<td class="p-1">${i.order_buyer}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

				<div class="col-lg-5 border m-3 pt-3 rounded mx-auto"
					style="background: #ffffff">
					<strong> SNS 신고 관리 </strong> <a
						href="/admin/TimeLineManagementMove"> 바로가기 </a>
					<table class="table mt-3 border text-center">
						<thead class="thead-dark">
							<tr>
								<th class="p-1" scope="col">번호</th>
								<th class="p-1" scope="col">제목</th>
								<th class="p-1" scope="col">상태</th>
								<th class="p-1" scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="i" items="${SNSBoardList}" begin="0" end="2">
								<tr>
									<th class="p-1">${i.tl_board_seq}</th>
									<td class="p-1">${i.tl_title}</td>
									<td class="p-1"><div id="status${i.tl_board_seq}">${i.tl_status}</div></td>
									<td class="p-1"><fmt:formatDate value="${i.tl_writedate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>

								<c:choose>
									<c:when test="${i.tl_status eq '신고'}">
										<script>
											$("#status${i.tl_board_seq}").css(
													'color', 'red')
											$("#status${i.tl_board_seq}").css(
													'font-weight', 'bold')
										</script>
									</c:when>
								</c:choose>

							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>