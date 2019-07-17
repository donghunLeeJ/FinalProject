<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
table {
	font-size: 14px;
	text-align: center;
}

#pageNumber {
	text-align: center;
}

.mainrow {
	font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/adminHead.jsp"></jsp:include>
	<div class="container">
		<div id="pageNumber">

			<table class="table">
				<thead>
					<tr class="row mainrow">
						<th class="col">주문번호</th>
						<th class="col">주문일자</th>
						<th class="col">주문금액/수량</th>
						<th class="col">주문자</th>
						<th class="col">수령자</th>
					</tr>
				</thead>

				<c:choose>

					<c:when test="${OrderBoardList ne null}">
						<tbody>
							<c:forEach var="i" items="${OrderBoardList}">
								<tr class="row">
									<th class="col">${i.order_number}</th>
									<td class="col">${i.order_time}</td>
									<td class="col"><b>${i.order_price}원</b>/${i.order_quantity}</td>
									<td class="col">${i.order_buyer}</td>
									<td class="col">${i.order_receipt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:when>

					<c:when test="${OrderNumberSelect ne null }">
						<tbody>
							<tr class="row">
								<th class="col">${OrderNumberSelect.order_number}</th>
								<td class="col">${OrderNumberSelect.order_time}</td>
								<td class="col"><b>${OrderNumberSelect.order_price}원</b>/${OrderNumberSelect.order_quantity}</td>
								<td class="col">${OrderNumberSelect.order_buyer}</td>
								<td class="col">${OrderNumberSelect.order_receipt}</td>
							</tr>
						</tbody>
					</c:when>

					<c:otherwise>
						<tbody>
							<tr>
								<td colspan="5" class="col">등록된 주문번호가 없습니다.</td>
							</tr>
						</tbody>
					</c:otherwise>

				</c:choose>
			</table>


			<c:forEach var="i" items="${pageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="OrderManagementProc?page=${page-1}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="OrderManagementProc?page=${page+1}">${i}</a>
					</c:when>

					<c:otherwise>
						<a href="OrderManagementProc?page=${i}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
		</div>


		<div id="serech">
			<form action="/admin/OrderNumberSelectMove" method="post">
				<div class="row mt-5">
					<div class="col-lg-6 col-md-6 col-sm-6 ml-5"></div>
					<input id="KeyWord" name="order_number" type="text"
						class="form-control col-lg-3 col-md-3 col-sm-3 "> <input
						class="btn btn-outline-secondary col-lg-2 col-md-2 col-sm-2"
						id="OrderNumberSelect" type="submit" value="주문번호로 검색">
				</div>
			</form>
		</div>


		<!--컨테이너 끝 -->
	</div>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
		$("#OrderNumberSelect").on("click", function() {

			if ($("#KeyWord").val() == "") {
				alert("검색어를 입력해 주세요!!");
				return false;
			}
		})
	</script>
</body>
</html>