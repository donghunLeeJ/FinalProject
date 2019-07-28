<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보창</title>
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>


	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col" colspan="2">${userINFO.member_id}님의정보</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">이름</th>
					<td>${userINFO.member_name}</td>
				</tr>
				<tr>
					<th scope="row">생일</th>
					<td>${userINFO.member_birth}</td>

				</tr>
				<tr>
					<th scope="row">성별</th>
					<td>${userINFO.member_gender}</td>
				</tr>

				<tr>
					<th scope="row">전화번호</th>
					<td>${userINFO.member_phone}</td>
				</tr>

				<tr>
					<th scope="row">우편번호</th>
					<td>${userINFO.member_postcode}</td>
				</tr>

				<tr>
					<th scope="row">주소</th>
					<td>${userINFO.member_address1}${userINFO.member_address2}</td>
				</tr>

			</tbody>
		</table>

		<div class="row">


			<div class="col-7"></div>

			<c:choose>
				<c:when test="${userINFO.member_blackcheck == 'y'}">
					<input class="btn btn-outline-dark col-4" id="BlackListBtn"
						value="블랙리스트 해제">
				</c:when>


				<c:when test="${userINFO.member_blackcheck == 'n'}">

					<input class="btn btn-outline-dark col-4" id="BlackListBtn"
						value="블랙리스트 등록">


				</c:when>

			</c:choose>
		</div>

		<!--컨테이너 끝  -->
	</div>

	<script>
		//블랙리스트 지정이 끝나면 창을 자동으로 닫고 부모 페이지로 새로고침시켜준다.

		$("#BlackListBtn")
				.on(
						"click",
						function() {

							$
									.ajax(
											{

												url : "/admin/blacklist?id=${userINFO.member_id}&blackcheck=${userINFO.member_blackcheck}",
												type : "post"

											}).done(function(resp) {

										alert(resp);
										opener.parent.location.reload();
										window.close();

									}).fail(function() {

										alert("에러 발생!");

									});

						})
	</script>


</body>
</html>