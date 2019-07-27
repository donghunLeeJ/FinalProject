<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
								<p class="h2 pt-5 pb-5">${View}</p>								
							</div>
						</div>

					</div>
					<div class="col-lg-4 border">
						<div class="row">
							<div class="col-lg-12 border-bottom text-center" style="background: #d3dbe8">
								<p class="h2 pt-5 pb-5">오늘의 게시글 수</p>
							</div>
							<div class="col-lg-12 border-bottom text-center" style="background: #ffffff">
								<p class="h2 pt-5 pb-5">${BoardNew}</p>
							</div>
						</div>

					</div>
					<div class="col-lg-4 border">
						<div class="row">
							<div class="col-lg-12 border-bottom text-center" style="background: #d3dbe8">
								<p class="h2 pt-5 pb-5">오늘의 거래 수</p>
							</div>
							<div class="col-lg-12 border-bottom text-center" style="background: #ffffff">
								<p class="h2 pt-5 pb-5">${Trade}</p>
							</div>
						</div>

					</div>

				</div>


			</div>
			<div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 회원 관리 </strong> <a href="/admin/MemberManagementMove"> 바로가기 </a>
				
				<table class="table mt-3 border text-center" >
				
					<thead class="thead-dark ">
						<tr>
							<th class="p-1" scope="col">ID</th>
							<th class="p-1" scope="col">이름</th>
							<th class="p-1" scope="col">전화번호</th>
							<th class="p-1" scope="col">불량회원</th>
						</tr>
					</thead>
					<tbody>										
					    <tr>
							<th class="p-1">${MemberList[0].member_id}</th>
							<td class="p-1">${MemberList[0].member_name}</td>
							<td class="p-1">${MemberList[0].member_phone}</td>
							<td class="p-1">${MemberList[0].member_blackcheck}</td>
						</tr>
						<tr>
							<th class="p-1">${MemberList[1].member_id}</th>
							<td class="p-1">${MemberList[1].member_name}</td>
							<td class="p-1">${MemberList[1].member_phone}</td>
							<td class="p-1">${MemberList[1].member_blackcheck}</td>
						</tr>
						<tr>
							<th class="p-1">${MemberList[2].member_id}</th>
							<td class="p-1">${MemberList[2].member_name}</td>
							<td class="p-1">${MemberList[2].member_phone}</td>
							<td class="p-1">${MemberList[2].member_blackcheck}</td>
						</tr>						
					</tbody>
					
					
				</table>
			</div>
		
			<div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 판매 게시판 관리 </strong> <a href="/admin/ShopBoardManagementMove"> 바로가기 </a>
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
						<tr>
							<th class="p-1">${ShopBoardList[0].shop_title}</th>
							<td class="p-1">${ShopBoardList[0].shop_price}원</td>
							<td class="p-1">${ShopBoardList[0].shop_quantity}개</td>
							<td class="p-1">${ShopBoardList[0].shop_expiration}</td>
						</tr>
						<tr>
						<th class="p-1">${ShopBoardList[1].shop_title}</th>
							<td class="p-1">${ShopBoardList[1].shop_price}원</td>
							<td class="p-1">${ShopBoardList[1].shop_quantity}개</td>
							<td class="p-1">${ShopBoardList[1].shop_expiration}</td>
						</tr>
						<tr>
						<th class="p-1">${ShopBoardList[2].shop_title}</th>
							<td class="p-1">${ShopBoardList[2].shop_price}원</td>
							<td class="p-1">${ShopBoardList[2].shop_quantity}개</td>
							<td class="p-1">${ShopBoardList[2].shop_expiration}</td>
						</tr>
					</tbody>
				</table>
			</div><div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> 구매내역 관리 </strong> <a href="/admin/OrderManagementMove"> 바로가기 </a>
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
						<tr>
							<th class="p-1">${OrderBoardList[0].order_number}</th>
							<td class="p-1">${OrderBoardList[0].order_price}원/${OrderBoardList[0].order_quantity}개</td>
							<td class="p-1">${OrderBoardList[0].order_time}</td>
							<td class="p-1">${OrderBoardList[0].order_buyer}</td>
						</tr>
						<tr>
							<th class="p-1">${OrderBoardList[1].order_number}</th>
							<td class="p-1">${OrderBoardList[1].order_price}원/${OrderBoardList[0].order_quantity}개</td>
							<td class="p-1">${OrderBoardList[1].order_time}</td>
							<td class="p-1">${OrderBoardList[1].order_buyer}</td>
						</tr>
						<tr>
							<th class="p-1">${OrderBoardList[2].order_number}</th>
							<td class="p-1">${OrderBoardList[2].order_price}원/${OrderBoardList[0].order_quantity}개</td>
							<td class="p-1">${OrderBoardList[2].order_time}</td>
							<td class="p-1">${OrderBoardList[2].order_buyer}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- private int tl_board_seq;
	private String tl_title;
	private String tl_contents;
	private String tl_writer;
	private String tl_writer_profile;
	private Date tl_writedate;
	private String tl_formatdate;
	private int tl_viewcount;
	private int tl_likecount;
	private int tl_likestatus;
	private MultipartFile tl_image;
	private String tl_imgaddr;
	private String tl_status; 
	private String tl_reason;
	private String tl_reporter; -->
			
			<div class="col-lg-5 border m-3 pt-3 rounded mx-auto" style="background: #ffffff">
				<strong> SNS 신고 관리 </strong> <a href="/admin/OrderManagementMove"> 바로가기 </a>
				<table class="table mt-3 border text-center">
					<thead class="thead-dark">
						<tr>
							<th class="p-1" scope="col">제목</th>
							<th class="p-1" scope="col">글쓴이</th>
							<th class="p-1" scope="col">상태</th>
							<th class="p-1" scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<th class="p-1">${SNSBoardList[0].tl_title}</th>
								<td class="p-1">${SNSBoardList[0].tl_writer}</td>
								<td class="p-1">${SNSBoardList[0].tl_status}</td>
								<td class="p-1"><fmt:formatDate
										value="${SNSBoardList[0].tl_writedate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
							<th class="p-1">${SNSBoardList[1].tl_title}</th>
							<td class="p-1">${SNSBoardList[1].tl_writer}</td>
							<td class="p-1">${SNSBoardList[1].tl_status}</td>
							<td class="p-1"><fmt:formatDate
										value="${SNSBoardList[1].tl_writedate}" pattern="yyyy-MM-dd" />
								</td>
						</tr>
						<tr>
							<th class="p-1">${SNSBoardList[2].tl_title}</th>
							<td class="p-1">${SNSBoardList[2].tl_writer}</td>
							<td class="p-1">${SNSBoardList[2].tl_status}</td>
							<td class="p-1"><fmt:formatDate
										value="${SNSBoardList[2].tl_writedate}" pattern="yyyy-MM-dd" />
								</td>
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