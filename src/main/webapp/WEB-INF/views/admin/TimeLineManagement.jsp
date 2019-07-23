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
		
		<table class="table">
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
			
			<tbody>
				<c:forEach var="i" items="${SNSBoardList}">
				
					<tr class="row">
						<th class="col">${i.tl_board_seq}</th>
						<th class="col">${i.tl_title}</th>
						<td class="col">${i.tl_writer}</td>
						<td class="col">${i.tl_writedate}</td>
                        <td class="col">${i.tl_reporter}</td>
						<td class="col"><c:choose>
								<c:when test="${i.tl_status eq '신고'}">

									<a id="status${i.tl_board_seq}" href="#"
										onclick="window.open('/admin/SNSReport?tl_board_seq=${i.tl_board_seq}','','width=600px, height=450px')">
										<b>${i.tl_status}</b>
									</a>

									<script>
										$("#status${i.tl_board_seq}").css(
												"color", "red");
									</script>

								</c:when>

								<c:otherwise>							
							${i.tl_status}			
							</c:otherwise>
							</c:choose></td>

						<td class="col">
					<button id="delete_btn" style="border-radius: 10px;">
						<a href="/admin/AdminDeleteSNS?tl_board_seq=${i.tl_board_seq}" style="color: white;">삭제하기</a>
					</button>
				</td>


					</tr>
			</c:forEach>
			</tbody>

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
						<a href="TimeLineManagementProc?page=${i}">${i}</a>
					</c:otherwise>

				</c:choose>
			</c:forEach>
		</div>
		
	<!--컨테이너 끝 -->	
		</div>	
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>