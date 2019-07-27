<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매글쓰기</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">

<style>
.form-control[readonly] {
	background-color: white;
}
.float{
float:left;
}

#contents {
	width: 100%;
	height: 240px;
}
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<section class="breadcrumb-area section-padding-80 border">
	<div class="container ">
		<div class="row ">
			<div class="col-12">
				<div class="breadcrumb-content">
					<h2 style="font-family: '나눔고딕OTF';">판매하기</h2>
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/home"><i
								class="icon_house_alt"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">판매하기</li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</section>




	<section class="welcome-area bg-gray ">

	<form id="SBwrite" action="/shopboard/ShopBoardInsertProc"
		enctype="multipart/form-data" method="post">


		<div class="container">

			<div class="row">

				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px">제목</div>
				<div class="col-lg-10 border  p-0">
					<input type="text" id=title name="shop_title"
						class="form-control input" >
				</div>
				<div class="col-lg-2 border text-center align-middle"

					style="background: #FFF8E7; padding-top: 170px">이미지</div>

				<div class="col-lg-10 border p-0" style="background: white;">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4 ">
							<div class="row ml-3">

								<div class="col-lg-12 mx-auto p-0 border"
									style="text-align: center;height: 12em">

									<img id="mainimg" src="/img/default.jpg" style="height: 100%">



								</div>
								
								<div class="col-lg-12 ">
									<div class="row mt-2">
										<div
											class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0"
											style="text-align: center;height: 5em">
											<img id="food0" class="img" src="/img/default.jpg" style="height: 100%" alt="">
										</div>
										<div style="text-align: center;height: 5em"
											class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0">
											<img id="food1" class="img" src="/img/default.jpg" style="height: 100%" alt="">
										</div>
										<div style="text-align: center;height: 5em"
											class="d-none d-sm-block border col-lg-4 col-md-4 col-sm-4 p-0">
											<img id="food2" class="img" src="/img/default.jpg" style="height: 100%" alt="">
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<input multiple="multiple" type="file"
										class="custom-file-input" id="files" name="shop_images">
									<label class="custom-file-label p-0" for="customFile"></label>
								</div>
								
							</div>

						</div>
						<div class="col-lg-8">
							<p>- 파일은 최대 3장까지 업로드 하실 수 있습니다.</p>
							<p>
								-  첫번째로 등록되는 이미지가 대표 이미지 입니다.<br>
							</p>
							<p>
								- 한번에 다중 선택해야 여러 파일을 업로드 하실 수 있습니다.<br>
							</p>
							<p>
							- 파일은 (jpg, png, gif, bmp, jpeg) 형식만 등록 가능합니다.<br>
							</p>
						</div>
					</div>

<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-12"></div> -->
<!-- 					</div> -->
				</div>
				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px;">브랜드</div>
				<div class="col-lg-4 border p-0">
					<input type="text" id=brand name="shop_brand"
						class="form-control input" >
				</div>
				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px;">재료</div>
				<div class="col-lg-4 border p-0">
					<input type="text" id=material name="shop_material"
						class="form-control input"  placeholder="알레르기 정보를 위하여 입력해주세요">
				</div>

				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px;">지역</div>
				<div class="col-lg-4 border p-0">
					<select name="shop_location"
						class="browser-default  form-control input">
						<option selected>지역 선택</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option>
					</select>
				</div>

				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px;">유통기한</div>
				<div class="col-lg-4 border p-0">
					<input id="datepicker" name="shop_expiration" class="form-control"
						readonly>


					<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
						type="text/javascript"></script>
					<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
						rel="stylesheet" type="text/css" />

					<script>
						var today = new Date(new Date().getFullYear(),
								new Date().getMonth(), new Date().getDate());
						$("#datepicker").datepicker({
							uiLibrary : 'bootstrap4',
							format : "yyyy-mm-dd",
							minDate : today

						});

						$('#datepicker').datepicker('setDate', 'today');
					</script>

				</div>

				<div class="col-lg-2 border text-center"
					style="background: #FFF8E7; padding-top: 8px;">가격</div>
				<div class="col-lg-4 border p-0">
					<input type="text" id=price name="shop_price"
						class="form-control input" placeholder="택배비 포함 가격 입력">
				</div>
				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 8px;">수량</div>
				<div class="col-lg-4 border p-0">
					<input type="text" id=quantity name="shop_quantity"
						class="form-control input" placeholder="무게 단위 판매는 내용에 추가로 기재">
				</div>
				<div class="col-lg-2 border text-center align-middle"
					style="background: #FFF8E7; padding-top: 130px;">내용</div>
				<div class="col-lg-10 border p-0 m-0">
					<textarea style="resize: none;" id=contents name="shop_contents" 
						class="form-control input" style="height: 15rem;"></textarea>
				</div>
				<!-- 	-정현 추가 사업자번호  -->
				<input type="hidden" value="${id.memberSell_seq }" name="sell_seq">

					<p>
						<input type="checkbox" id="must1"> <small class="must1">
						(필수)부정확한 정보 입력으로 발생한 문제는 판매자가 책임지겠습니다</small>
							</p>
				<div class="col-lg-12 text-center mb-5">
					<input id="submitbtn" type="button" value="판매등록"
						class="btn akame-btn btn-3 mt-15 active">
				</div>



			</div>
		</div>

	</form>
	</section>
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
																&& fileEx != "jpeg"
													) {
														alert("파일은 (jpg, png, gif, bmp, jpeg) 형식만 등록 가능합니다.");
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
													$('#food' + index + '')
															.css("width",
																	"100rem");
													$('#food' + index + '')
															.css("height",
																	"100%");
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
		$("#submitbtn").on(
				"click",
				function() {
					var origin = /^[0-9]{1,}$/
					var regpr = /^[0-9]{1,6}$/
					var reg = /^[0-9]{1,10}$/
						var emp = /^\s*$/g;
					var inputcount = 0;
					$(".input").each(function(i, item) {
						if ($(item).val() == "" || emp.test($(item).val())) {
							inputcount++; //만일 입력창 어딘가에 빈 칸이 있을 경우 카운트를 증가시킨다.
						}
					});

					if (inputcount > 0) {
						alert("모든 항목을 반드시 입력하셔야 합니다.");
						return false;
					} else if ($('#food0').attr('src') == '/img/default.jpg') { //이미지가 하나도 업로드되지 않은 경우
						alert("상품 이미지는 적어도 1개 이상 들어가야 합니다.");
						return false;
					} else if ($("#title").val().length > 30) {
						alert(" 제목 길이를 초과하였습니다");
					} else if ($("#brand").val().length > 15) {
						alert(" 브랜드 길이를 초과하였습니다");
					} else if ($("#material").val().length > 30) {
						alert("재료입력 길이를 초과하였습니다");
					} else if ($("#contents").val().length > 200) {
						alert("가능한 내용 길이를 초과하였습니다");
					} else if (!origin.test($("#price").val())
							|| !origin.test($("#quantity").val())) {
						alert("수량이나 가격은 숫자만 가능합니다");
					} else if (!regpr.test($("#price").val())) {
						alert("100만원 이상은 관리자에게 문의주세요");
					} else if (!reg.test($("#quantity").val())) {
						alert("수량을 다시 입력해주세요");
					} else if ($("#must1").is(":checked") == false) {
						alert("필수사항을 읽고 체크해주세요");
					}else {
						removeXSS($("#title").val(), $("#title").attr("id"));
						removeXSS($("#brand").val(), $("#brand").attr("id"));
						removeXSS($("#material").val(), $("#material").attr("id"));
						removeXSS($("#contents").val(), $("#contents").attr(
								"id"));
						removeXSS($("#datepicker").val(), $("#datepicker")
								.attr("id"));
						removeXSS($("#price").val(), $("#price").attr("id"));
						removeXSS($("#quantity").val(), $("#quantity").attr(
								"id"));
						alert("정상적으로 등록되었습니다.");
						$("#SBwrite").submit();
					}

				});
		
		$(".must1").on("click", function() {
			$("#must1").click();
		});
	</script>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>