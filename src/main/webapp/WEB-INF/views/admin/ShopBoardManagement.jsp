<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매글 관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
table {
	font-size: 20px;
	text-align: center;
}

#pageNumber {
	text-align: center;
}

#delete_btn {
	width: 6em;
	height: 2em;
	margin-right: 0.5em;
	background-color: black;
	color: white;
	border: 0;
	outline: 0;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/adminHead.jsp"></jsp:include>
	<div class="container">


		<table class="table mt-5">
			<thead>
				<tr class="row">
					<th class="col">이미지</th>
					<th class="col">제목</th>
					<th class="col">가격</th>
					<th class="col">수량</th>
					<th class="col">유통기한</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="i" items="${ShopBoardList}">
					<tr class="row" style="height: 12rem">
						<th class="col"><a href="#"
							onclick="window.open('/shopboard/ShopBoardViewProc?seq=${i.shop_seq}','상품','width=1920px, height=1080px')"><img
								src="${i.shop_imagepath1}" alt=""></a></th>

						<td class="col"><a href="#"
							onclick="window.open('/shopboard/ShopBoardViewProc?seq=${i.shop_seq}','상품','width=1920px, height=1080px')">${i.shop_contents}</a>
						</td>
						<td class="col"><b>${i.shop_price}</b>원</td>
                        <td class="col"><b>${i.shop_quantity}</b>개</td>
						<td class="col">
							<div class="row">
								<div class="col-12">${i.shop_expiration}</div>
								<div class="col-12 mt-4"></div>
								<div class="col mt-5 ml-4">

									<!--<input id="delete_btn" type="button" value="삭제하기"> 
									<button id="delete_btn">																			
									</button> -->

									<button id="delete_btn" style="border-radius:10px;">
										<a href="/admin/AdminDeleteShopBoard?shop_seq=${i.shop_seq}" style="color: white;">삭제하기</a>
									</button>
								</div>
							</div>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div id="pageNumber">
			<c:forEach var="i" items="${pageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="ShopBoardManagementProc?page=${page-1}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="ShopBoardManagementProc?page=${page+1}">${i}</a>
					</c:when>

					<c:otherwise>
						<a class="${i}" href="ShopBoardManagementProc?page=${i}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
		</div>
		
		<script>
			$(".${page}").css("font-weight", "bold");
		</script>
		
	</div>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>