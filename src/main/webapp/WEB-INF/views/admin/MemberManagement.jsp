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
</head>
<style>

table{font-size:14px;
text-align: center;}
#pageNumber{text-align: center;}
.mainrow{font-size:20px;}

</style>
<body>
	<jsp:include page="/WEB-INF/views/module/adminHead.jsp"></jsp:include>
	<div class="container">
	
		<table class="table mt-5">
			<thead>
				<tr class="mainrow">
					<th scope="col">회원ID</th>
					<th scope="col">회원이름</th>
					<th scope="col">회원전화번호</th>
					<th scope="col">불량회원유무</th>
				</tr>
			</thead>
			<c:choose>

				<c:when test="${MemberList ne null}">
					<tbody>
						<c:forEach var="i" items="${MemberList}">
							<tr>
								<th scope="row"><a href="#"
									onclick="window.open('/admin/targetMember?userid=${i.member_id}','','width=600px, height=450px')">${i.member_id}</a>

								</th>
								<td>${i.member_name}</td>
								<td>${i.member_phone}</td>
								<td>${i.member_blackcheck}</td>
							</tr>

						</c:forEach>
					</tbody>
				</c:when>


				<c:when test="${totalcount > 0}">
					<tbody>
						<c:forEach var="i" items="${SelectMemberlist}">
							<tr>
								<th scope="row"><a href="#"
									onclick="window.open('/admin/targetMember?userid=${i.member_id}','','width=600px, height=450px')">${i.member_id}</a>
								</th>
								<td>${i.member_name}</td>
								<td>${i.member_phone}</td>
								<td>${i.member_blackcheck}</td>
							</tr>

						</c:forEach>
					</tbody>
				</c:when>

				<c:when test="${totalcount==0}">
					<tbody>
						<tr>
							<td colspan="4" class="col">등록된 id가 없습니다.</td>
						</tr>
					</tbody>
				</c:when>

			</c:choose>
		</table>

		<!--검색 대상이 전체인 경우  -->
		<div id="pageNumber">
			<c:forEach var="i" items="${pageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="MemberManagementProc?page=${page-1}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="MemberManagementProc?page=${page+1}">${i}</a>
					</c:when>

					<c:otherwise>
						<a class="${i}" href="MemberManagementProc?page=${i}">${i}</a>														
					</c:otherwise>

				</c:choose>
			</c:forEach>

			<!--검색 대상이 id인 경우  -->
			<c:forEach var="i" items="${SelectpageList}">
				<c:choose>

					<c:when test="${i eq '<이전'}">
						<a href="MemberManagementIDProc?page=${page-1}&keyword=${keyword}">${i}</a>
					</c:when>

					<c:when test="${i eq '다음>'}">
						<a href="MemberManagementIDProc?page=${page+1}&keyword=${keyword}">${i}</a>
					</c:when>

					<c:otherwise>
						<a class="${i}" href="MemberManagementIDProc?page=${i}&keyword=${keyword}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
						
			<script>
				$(".${page}").css("font-weight", "bold");
			</script>
			
		</div>
		
<!--id로 검색하기(맨 처음은 1페이지부터 검색하도록 함) -->
		<form action="/admin/MemberManagementIDMove" method="post">

			<div class="row mt-5">
				<div class="col-lg-7 col-md-7 col-sm-7 ml-5"></div>
				<input id="KeyWord" name="keyword" type="text" value="${keyword}"
					class="form-control col-lg-3 col-md-3 col-sm-3 "> <input
					class="btn btn-outline-secondary col-lg-1 col-md-1 col-sm-1"
					id="IdBoardSelect" type="submit" value="id로 검색">
			</div>
		</form>

		<!--컨테이너 끝 -->
	</div>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

	<script>
		$("#IdBoardSelect").on("click", function() {

			if ($("#KeyWord").val() == "") {
				alert("검색어를 입력해 주세요!!");
				return false;
			}
		})
	</script>

</body>
</html>