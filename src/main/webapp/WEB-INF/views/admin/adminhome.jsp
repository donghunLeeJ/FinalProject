<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<div class="col-lg-12 border-bottom text-center" style="background: #d3dbe8">
								<p class="h2 pt-5 pb-5">오늘의 방문자 수</p>
							</div>
							<div class="col-lg-12 border-bottom text-center" style="background: #ffffff">
								<p class="h2 pt-5 pb-5">0</p>
							</div>
						</div>

					</div>
					<div class="col-lg-4 border">
						<div class="row">
							<div class="col-lg-12 border-bottom text-center" style="background: #d3dbe8">
								<p class="h2 pt-5 pb-5">오늘의 게시글 수</p>
							</div>
							<div class="col-lg-12 border-bottom text-center" style="background: #ffffff">
								<p class="h2 pt-5 pb-5">0</p>
							</div>
						</div>

					</div>
					<div class="col-lg-4 border">
						<div class="row">
							<div class="col-lg-12 border-bottom text-center" style="background: #d3dbe8">
								<p class="h2 pt-5 pb-5">오늘의 거래 수</p>
							</div>
							<div class="col-lg-12 border-bottom text-center" style="background: #ffffff">
								<p class="h2 pt-5 pb-5"> 0 </p>
							</div>
						</div>

					</div>

				</div>


			</div>
			<div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 회원 관리 </strong> <a href> 바로가기 </a>
				<table class="table mt-3 border text-center" >
					<thead class="thead-dark ">
						<tr>
							<th class="p-1" scope="col">회원번호</th>
							<th class="p-1" scope="col">아이디</th>
							<th class="p-1" scope="col">이름</th>
							<th class="p-1" scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="p-1">1</th>
							<td class="p-1">Mark</td>
							<td class="p-1">Otto</td>
							<td class="p-1">@mdo</td>
						</tr>
						<tr>
							<th class="p-1">2</th>
							<td class="p-1">Jacob</td>
							<td class="p-1">Thornton</td>
							<td class="p-1">@fat</td>
						</tr>
						<tr>
							<th class="p-1">3</th>
							<td class="p-1">Larry</td>
							<td class="p-1">the Bird</td>
							<td class="p-1">@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 판매 게시판 관리 </strong> <a href> 바로가기 </a>
				<table class="table mt-3">
					<thead class="thead-dark">
						<tr>
							<th class="p-1" scope="col">게시글 번호</th>
							<th class="p-1" scope="col">작성자 </th>
							<th class="p-1" scope="col">제목 </th>
							<th class="p-1" scope="col">상태 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="p-1">1</th>
							<td class="p-1">Mark</td>
							<td class="p-1">Otto</td>
							<td class="p-1">@mdo</td>
						</tr>
						<tr>
							<th class="p-1">2</th>
							<td class="p-1">Jacob</td>
							<td class="p-1">Thornton</td>
							<td class="p-1">@fat</td>
						</tr>
						<tr>
							<th class="p-1">3</th>
							<td class="p-1">Larry</td>
							<td class="p-1">the Bird</td>
							<td class="p-1">@twitter</td>
						</tr>
					</tbody>
				</table>
			</div><div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 회원 관리 </strong> <a href> 바로가기 </a>
				<table class="table mt-3">
					<thead class="thead-dark">
						<tr>
							<th class="p-1" scope="col">#</th>
							<th class="p-1" scope="col">First</th>
							<th class="p-1" scope="col">Last</th>
							<th class="p-1" scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="p-1">1</th>
							<td class="p-1">Mark</td>
							<td class="p-1">Otto</td>
							<td class="p-1">@mdo</td>
						</tr>
						<tr>
							<th class="p-1">2</th>
							<td class="p-1">Jacob</td>
							<td class="p-1">Thornton</td>
							<td class="p-1">@fat</td>
						</tr>
						<tr>
							<th class="p-1">3</th>
							<td class="p-1">Larry</td>
							<td class="p-1">the Bird</td>
							<td class="p-1">@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>