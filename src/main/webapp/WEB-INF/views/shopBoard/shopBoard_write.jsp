<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">

</head>

<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>





<section class="welcome-area">

<form action="/shopboard/ShopBoardInsertProc"
	enctype="multipart/form-data" method="post">

	<div class="container">

		<div class="row">



			<div class="mt-5 col-lg-12 ">게시글 작성</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">상품명</div>
			<div class="col-lg-10 border  p-0">
				<input type="text" name="shop_title" class="form-control input">
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8"">이미지</div>
			<div class="col-lg-10 border p-0">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 ">
						<div class="row ml-3">
							<div class="col-lg-12 mx-auto p-0 border"
								style="text-align: center">
								<img id="mainimg" src="/img/default.jpg">
							</div>
							<div class="col-lg-12 ">
								<div class="row mt-2">
									<div
										class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0">
										<img id="food0" class="img" src="/img/default.jpg" alt="">

									</div>
									<div
										class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0">
										<img id="food1" class="img" src="/img/default.jpg" alt="">

									</div>
									<div
										class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0">
										<img id="food2" class="img" src="/img/default.jpg" alt="">

									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<input multiple="multiple" type="file" class="custom-file-input"
									id="files" name="shop_images"> <label
									class="custom-file-label p-0" for="customFile"></label>
							</div>
						</div>

					</div>
					<div class="col-lg-8">
						<p>- 파일은 최대 3장까지 한번에 올릴 수 있습니다.</p>
						<p>
							- 대표 이미지는 첫번째로 등록되는 이미지 입니다.<br>
						</p>
						<p>
							- 파일을 여러장 올리는 방법은 여러장을 선택해서 올리면 가능합니다.<br>
						</p>

					</div>
				</div>

				<div class="row">
					<div class="col-lg-12"></div>
				</div>
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">브랜드</div>
			<div class="col-lg-10 border p-0">
				<input type="text" name="shop_brand" class="form-control input">
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">제목</div>
			<div class="col-lg-10 border p-0">
				<input type="text" name="shop_title" class="form-control input">
			</div>

			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">지역</div>
			<div class="col-lg-10 border p-0">
				<select name="shop_location"
					class="browser-default custom-select form-control input">
					<option selected></option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="부산">부산</option>
				</select>
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">유통기한</div>
			<div class="col-lg-10 border p-0">
				<input id="datepicker" name="shop_expiration" class="form-control"
					readonly>
				
				<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
					type="text/javascript"></script>
				<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
					rel="stylesheet" type="text/css" />



				<script>
					$("#datepicker").datepicker({
						uiLibrary : 'bootstrap4',
						format : "yyyy-mm-dd",
						language : "kr"

					});
				</script>
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">가격</div>
			<div class="col-lg-10 border p-0">
				<input type="number" name="shop_price" class="form-control input">
			</div>
			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">수량</div>
			<div class="col-lg-10 border p-0">
				<input type="number" name="shop_quantity" class="form-control input">
			</div>

			<div class="col-lg-2 border text-center align-middle" style="background: #e6e7e8">내용</div>
			<div class="col-lg-10 border p-0 m-0">
				<textarea name="shop_contents" class="form-control input"
					placeholder="내용" style="height: 15rem;"></textarea>
			</div>
			<!-- 	-정현 추가 사업자번호  -->
			<input type="hidden" value="${id.memberSell_seq }" name="sell_seq">

			<div class="col-lg-12 text-center">
				<input id="submitbtn" type="submit" value="제출"
					class="btn akame-btn btn-3 mt-15 active">
			</div>



		</div>
	</div>
</form>
<script>
	$('#files')
			.change(
					function() {

						var FileCount = 0;
						//이미지 업로드 버튼을 누를 때마다 미리보기 이미지들을 초기화시킴
						$('#mainimg').attr('src', "/img/default.jpg");
						for (var i = 0; i < 3; i++) {
							$('#food' + i + '').attr('src', "");
						}

						const target = document
								.getElementsByName('shop_images');
						//const fileLength = target[0].files.length;

						if (target[0].files.length > 3) {

							alert("이미지는 최대 3개까지만 업로드가 가능합니다.");

						} else {

							$
									.each(
											target[0].files,
											function(index, file) {

												const fileName = file.name;

												const fileEx = fileName
														.slice(
																fileName
																		.indexOf(".") + 1)
														.toLowerCase();

												if (fileEx != "jpg"
														&& fileEx != "png"
														&& fileEx != "gif"
														&& fileEx != "bmp"
														&& fileEx != "wmv"
														&& fileEx != "mp4"
														&& fileEx != "avi") {
													alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
													resetFile();
													return false;
												}

												//업로드한 이미지 파일중 최대 3개까지 미리보기 영역에 등록시킴
												if (FileCount == 0) {

													$('#mainimg')
															.attr(
																	'src',
																	''
																			+ URL
																					.createObjectURL(file)
																			+ '');
												}

												$('#food' + index + '')
														.attr(
																'src',
																''
																		+ URL
																				.createObjectURL(file)
																		+ '');
												$('#food' + index + '').css(
														"width", "100rem");
												$('#food' + index + '').css(
														"height", "100%");
												FileCount++;

											});
						}
					});

	//미리보기 이미지 영역의 이미지를 클릭하면 메인영역에 이미지가 나타난다.
	$(".img").each(function(i, item) {

		$(item).on("click", function() {

			$("#mainimg").attr('src', '' + $(item).attr('src') + '');
		})
	});

	//조건을 만족하지 않으면 컨트롤러로 데이터를 보내지 못하게 막는 함수	
	$("#submitbtn").on("click", function() {
		var inputcount = 0;

		$(".input").each(function(i, item) {
			if ($(item).val() == "") {
				inputcount++; //만일 입력창 어딘가에 빈 칸이 있을 경우 카운트를 증가시킨다.
			}
		});

		if (inputcount > 0) {

			alert("모든 항목을 반드시 입력하셔야 합니다.");
			return false;

		} else if ($('#food0').attr('src') == '') { //이미지가 하나도 업로드되지 않은 경우

			alert("상품 이미지는 적어도 1개 이상 들어가야 합니다.");
			return false;

		} else {

			alert("정상적으로 등록되었습니다.");
			return true;
		}
	});
</script> <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>