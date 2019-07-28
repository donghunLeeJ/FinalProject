<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매하기</title>

<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
select {
	color: red;
}

.skip {
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	width: 100%;
	overflow: hidden;
}

.sell_btn {
	background: #FFF8E7;
	color: black;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
	width: 5em;
	height: 3em;
	cursor: pointer;
}

.sell_btn:hover {
	color: black;
	border: black;
	border-radius: 5px;
	box-shadow: 5px 5px 5px #eee;
}

.listimg {
	width: 110px;
	height: 110px;
}

.form-control[readonly] {
	background-color: white;
}
.list_sub{
 margin-right:1px;
text-align:center;
 }
.list_menu button{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding:3px;
            text-align:center;
            width:30px;
        }
.list_menu button:hover{
            color:white;
            background-color: skyblue;
        }
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<section class="why-choose-us-area bg-gray pt-3">
	<div class="container">
		<div class="row border-bottom  mt-5 pb-1">
			<div class="col-12">
				<h4 style="font-family: '나눔고딕OTF';">구매 내역 확인</h4>
			</div>
		</div>
		<div class="row border-top border-bottom  text-center py-1"
			style="background: #dde1e5">
			<div class="col-2">이미지</div>
			<div class="col-4">제목</div>
			<div class="col-1">총 수량</div>
			<div class="col-2">총 금액</div>
			<div class="col-2">구매 날짜</div>
			<div class="col-1">요청</div>
		</div>


		<c:forEach var="i" items="${buyList }">

			<div class="row text-center border py-3" style="background: white">

				<div class="col-2 ">
<%-- 					<a href="/shopboard/ShopBoardViewProc?seq=${i.products_seq}"> --%>
<%-- 					<img src="${i.order_image}" class="listimg">  --%>
<!-- 					</a> -->
					<a href="/shopboard/ShopBoardViewProc?seq=${i.products_seq}"> <img
						src="${i.order_image}" class="listimg">
					</a>
				</div>
				<div class="col-4 skip" style="margin-top: 2.3em">
				<a href="/shopboard/shopOrderA?products_seq=${i.products_seq}">
<strong style="font-size: 1.2em">${i.order_title }</strong> 
						</a>
				</div>

				<div class="col-1 " style="margin-top: 2.3em">
					<strong>${i.order_quantity }</strong> (개)
				</div>
				<div class="col-2 " style="margin-top: 2.3em">
					<strong><fmt:formatNumber value="${i.order_price }"
							pattern="#,###" /> </strong>원
				</div>


				<div class="col-2 " style="margin-top: 2.3em; color: red">${i.order_time }</div>

				<div class="col-1" style="padding: 0">

					<input type=button class="sell_btn del_list" value="후기 작성"
						data-toggle="modal" style="margin-bottom: 0.3em"
						data-target="#myModal"> <input type=button
						class="del_list2" value="요청중" style="margin-bottom: 0.3em">
					<a id="sell_statusBtn" style="margin-top: 0.3em"> <input
						class="sell_btn" type="button" value="환불 요청"></a>
				</div>

			</div>

			<!-- The Modal -->
			<form
				action="/shopboard/buyReview?products_seq=${i.products_seq }&user_id=${i.order_buyer_email}"
				id="modalfo" method="POST">
				<div class="modal modal-xl fade " id="myModal">
					<div class="modal-dialog ">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h3 class="modal-title">후기 댓글 작성</h3>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body ">
								<div class="row border-bottom">
									<div class="col-12">
										<p>
											작성 된 댓글은 삭제할 수 없습니다.&nbsp;<strong>(수정 가능)</strong>
										</p>
									</div>
								</div>
								<div class="row py-3">
									<div class="col-3 text-right" style="padding: 0">
										<select style="height: 2em;" name="star_review">
											<option value="5">★★★★★</option>
											<option value="4">★★★★</option>
											<option value="3">★★★</option>
											<option value="2">★★</option>
											<option value="1">★</option>
										</select>
									</div>
									<div class="col-9" style="padding: 0">
										<input type="text" name="title" id=title
											style="width: 22em; height: 2em;">
									</div>
									<div class="col-12 py-3"">
										<textarea id=contents style="resize: none; width: 460px;"
											name="contents" cols="56" rows="10"></textarea>
									</div>
								</div>

							</div>


							<!-- Modal footer -->
							<div class="modal-footer">
								<input type="button" id="confirm" class="btn" value="댓글 작성">
								<button type="button" class="btn" data-dismiss="modal">댓글
									취소</button>
							</div>

						</div>
					</div>
				</div>
			</form>
		</c:forEach>
		<br>
		
		  <div class="list_menu">
         <c:forEach var="i" items="${pageList}">
            <c:choose>
               <c:when test="${i eq '<<'}">
                  <a href="buyContentsGoProc?page=${page-1}" class="center"><button class="list_sub">${i}</button></a>
               </c:when>
               <c:when test="${i eq '>>'}">
                  <a href="buyContentsGoProc?page=${page+1}" class="center"><button class="list_sub">${i}</button></a>
               </c:when>
               <c:otherwise>
               <a href="buyContentsGoProc?page=${i}" class="center"><button class="list_sub">${i}</button></a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      </div>
      <br>
      

	</div>
	</section>



	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
		$(".del_list2").hide();

		$("#title").on("input", function() {
			if ($("#title").val().length > 20) {
				alert("제목 길이를 초과하였습니다");
			}
		});
		$("#contents").on("input", function() {
			if ($("#contents").val().length > 100) {
				alert("내용 길이를 초과하였습니다");
			}
		});

		$("#confirm").on("click", function() {
			removeXSS($("#title").val(), $("#title").attr("id"));
			removeXSS($("#contents").val(), $("#contents").attr("id"));
			$("#modalfo").submit();

		});
		// 		$(".del_list").on("click", function() {
		// 			if (confirm("삭제 요청을 하나요?") == true) {
		// 				$(".del_list").hide();
		// 				$(".del_list2").show();
		// 			}
		// 		})
		// 		$(".del_list2").on("click", function() {
		// 			if (confirm("삭제 요청을 취소 하나요?") == true) {

		// 				$(".del_list2").hide();
		// 				$(".del_list").show();

		// 			}
		// 		})
		$("#sell_statusBtn").on("click", function() {
			$(location).attr("href", "/member/sellStatus")
		})
		// 		$("#sell_statusBtn").on("click",function(){
		// 			var popupX = (document.body.offsetWidth / 2) - (800 / 2);
		// 			//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		// 			var popupY= (document.body.offsetHeight / 2) - (500 / 2);
		// 			//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

		// 			window.open('/member/sellStatus', '', 'status=no, height=500, width=800, left='+ popupX + ', top='+ popupY);
		// 		})
	</script>
</body>
</html>