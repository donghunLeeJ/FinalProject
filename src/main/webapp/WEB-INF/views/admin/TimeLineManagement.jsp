<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타임라인 관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
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

#delete_btn {
	width: 6em;
	height: 2em;
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
				<tr class="row mainrow">
					<th class="col">글번호</th>
					<th class="col">제목</th>
					<th class="col">회원ID</th>
					<th class="col">작성일</th>
					<th class="col">신고자</th>
					<th class="col">신고상태</th>
					<th class="col">글삭제</th>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${SNSBoardList ne null}">

					<tbody>
						<c:forEach var="i" items="${SNSBoardList}">

							<tr class="row">
								<th class="col">${i.tl_board_seq}</th>
								<th class="col">${i.tl_title}</th>
								<td class="col">${i.tl_writer}</td>
								<td class="col"><fmt:formatDate value="${i.tl_writedate}"
										pattern="yyyy-MM-dd" /></td>
								<td class="col">${i.tl_reporter}</td>
								<td class="col"><c:choose>
										<c:when test="${i.tl_status eq '신고'}">

											<a id="status${i.tl_board_seq}" href="#"
												onclick="window.open('/admin/SNSReport?tl_board_seq=${i.tl_board_seq}','','width=600px, height=450px')">
												<b>${i.tl_status}</b>
											</a>

											<script>
												$("#status${i.tl_board_seq}")
														.css("color", "red");
											</script>

										</c:when>

										<c:otherwise>							
							${i.tl_status}			
							</c:otherwise>
									</c:choose></td>

								<td class="col">
									<button id="delete_btn" style="border-radius: 10px;">
										<a href="/admin/AdminDeleteSNS?tl_board_seq=${i.tl_board_seq}"
											style="color: white;">삭제하기</a>
									</button>
								</td>

							</tr>
						</c:forEach>
					</tbody>

				</c:when>

				<c:when test="${totalcount > 0}">

					<tbody>
						<c:forEach var="i" items="${SNSTitleSelectBoardList}">

							<tr class="row">
								<th class="col">${i.tl_board_seq}</th>
								<th class="col">${i.tl_title}</th>
								<td class="col">${i.tl_writer}</td>
								<td class="col"><fmt:formatDate value="${i.tl_writedate}"
										pattern="yyyy-MM-dd" /></td>
								<td class="col">${i.tl_reporter}</td>
								<td class="col"><c:choose>
										<c:when test="${i.tl_status eq '신고'}">

											<a id="status${i.tl_board_seq}" href="#"
												onclick="window.open('/admin/SNSReport?tl_board_seq=${i.tl_board_seq}','','width=600px, height=450px')">
												<b>${i.tl_status}</b>
											</a>

											<script>
												$("#status${i.tl_board_seq}")
														.css("color", "red");
											</script>

										</c:when>

										<c:otherwise>							
							${i.tl_status}			
							</c:otherwise>
									</c:choose></td>

								<td class="col">
									<button id="delete_btn" style="border-radius: 10px;">
										<a href="/admin/AdminDeleteSNS?tl_board_seq=${i.tl_board_seq}"
											style="color: white;">삭제하기</a>
									</button>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</c:when>

				<c:when test="${totalcount==0}">
					<tbody>
						<tr>
							<td colspan="7" class="col">검색된 글이 없습니다.</td>
						</tr>
					</tbody>
				</c:when>

			</c:choose>


		</table>





		<div id="pageNumber">
      
			<c:forEach var="i" items="${pageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="TimeLineManagementProc?page=${page-1}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="TimeLineManagementProc?page=${page+1}">${i}</a>
					</c:when>

					<c:otherwise>
						<a class="${i}" href="TimeLineManagementProc?page=${i}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
			
				
			<!--검색 대상이 제목인 경우  -->
			<c:forEach var="i" items="${SelectpageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="TimeLineManagementTitleProc?page=${page-1}&keyword=${keyword}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="TimeLineManagementTitleProc?page=${page+1}&keyword=${keyword}">${i}</a>
					</c:when>

					<c:otherwise>
						<a class="${i}" href="TimeLineManagementTitleProc?page=${i}&keyword=${keyword}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
			
			<script>
				$(".${page}").css("font-weight", "bold");
			</script>
			
		</div>
		
		<!--제목으로 검색하기(맨 처음은 1페이지부터 검색하도록 함) -->
		<form action="/admin/TimeLineManagementTitleMove" method="post">

			<div class="row mt-5">
				<div class="col-lg-6 col-md-6 col-sm-6 ml-5"></div>
				<input id="KeyWord" name="keyword" type="text" value="${keyword}"
					class="form-control col-lg-3 col-md-3 col-sm-3 "> <input
					class="btn btn-outline-secondary col-lg-2 col-md-2 col-sm-2"
					id="TitleBoardSelect" type="submit" value="제목으로 검색">
			</div>
		</form>
		
		
	<!--컨테이너 끝 -->	
		</div>	
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	
		<script>
		$("#TitleBoardSelect").on("click", function() {

			if ($("#KeyWord").val() == "") {
				alert("검색어를 입력해 주세요!!");
				return false;
			}
		})
	</script>
	
</body>
</html>