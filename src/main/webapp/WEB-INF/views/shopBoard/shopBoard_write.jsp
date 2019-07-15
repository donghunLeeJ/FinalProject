<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
#contents{
width:100%;
height:250px;
}
</style>
</head>


<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<!-- /shopboard/filetest


 /shopboard/ShopBoardInsertProc
  -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
		type="text/javascript"></script>
	<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
		rel="stylesheet" type="text/css" />



	<section class="welcome-area">
	<div class="container mt-5">
		<form action="/shopboard/ShopBoardInsertProc"
			enctype="multipart/form-data" method="post">
			<div class="row">
				<div class="col-lg-5">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 mt-4"
							style="height: 25.2rem;">
							<img id="mainimg" src="/img/default.jpg"
								style="width: 100rem; height: 100%;">
						</div>
					</div>
					<div class="row mt-2">
						<div class="d-none d-sm-block  col-lg-4 col-md-4 col-sm-4"
							style="height: 6rem;">
							<img id="food0" class="img" src="" alt="">
						</div>
						<div class="d-none d-sm-block  col-lg-4 col-md-4 col-sm-4"
							style="height: 6rem;">
							<img id="food1" class="img" src="" alt="">
						</div>
						<div class="d-none d-sm-block col-lg-4 col-md-4 col-sm-4"
							style="height: 6rem;">
							<img id="food2" class="img" src="" alt="">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<input multiple="multiple" type="file" class="custom-file-input"
								id="files" name="shop_images"> <label
								class="custom-file-label" for="customFile">이미치는 최대 3장까지
								업로드가 가능합니다</label>
						</div>
					</div>
				</div>
				<div class="col-lg-7 mt-2">
					<div class="mt-2">
						제목<input type="text" name="shop_title" class="form-control input" id=title>
					</div>
					<br>
					<div class="mt-2">
						판매자 브랜드<input type="text" name="shop_brand" id=brand
							class="form-control input">
					</div>
					<br>

					<div class="mt-2">
						판매지역 <select name="shop_location"
							class="browser-default custom-select form-control input">
							<option selected></option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="부산">부산</option>
						</select>
					</div>
					<br>

					<!--<input type="hidden">-->
					<!-- 	-정현 추가 사업자번호  -->
					<input type="hidden" value="${id.memberSell_seq }" name="sell_seq">

					<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
						type="text/javascript"></script>
					<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
						rel="stylesheet" type="text/css" />


					<div class="mt-2">
						유통기한이야!<input id="datepicker" name="shop_expiration" 
							class="form-control">
					</div>
					<script>
						$("#datepicker").datepicker({
							uiLibrary : 'bootstrap4',
							format : "yyyy-mm-dd",
							language : "kr"

						});
					</script>
					<br>
					<div class="mt-2">
						가격<input type="number" name="shop_price" id=price
							class="form-control input">
					</div>
					<br>
					<div class="mt-2">
						수량 <input type="number" name="shop_quantity" id=quantity
							class="form-control input">
					</div>
					<br>
				</div>
				<div class="col-lg-4 custom-file"></div>
				<div class="col-lg-12 mt-2">
					<textarea style="resize: none;"  name="shop_contents" class="form-control mb-30 input" id=contents 
						placeholder="내용" style="height: 15rem;"></textarea>
				</div>


				<div class="col-lg-12"></div>


				<div class="col-lg-12 text-center">
					<input id="submitbtn" type="submit" value="제출"
						class="btn akame-btn btn-3 mt-15 active">
				</div>
			</div>
		</form>
	</div>

	</section>
	<!-- Header Area End -->
	
	<script>
	function removeXSS (str, id) {
		//	console.log(str);
		//	console.log(id);
		//	alert("XSS");
			var str_low = "";
			//var str = str1;
			// HTML tag를 사용하게 할 경우 부분 허용
			// HTML tag를 모두 제거
			str = str.replace("<", "");
			str = str.replace("<", "");
			str = str.replace("<", "");
			str = str.replace("<", "");
			str = str.replace(">", "");
			str = str.replace(">", "");
			str = str.replace(">", "");
			str = str.replace(">", "");
			// 특수 문자 제거
			str = str.replace("\"", "&gt;");
			str = str.replace("&", "&amp;");
			str = str.replace("%00", null);
			str = str.replace("\"", "&#34;");
			str = str.replace("\'", "&#39;");
			str = str.replace("%", "&#37;");
			str = str.replace("../", "");
			str = str.replace("..\\\\", "");
			str = str.replace("./", "");
			str = str.replace("%2F", "");
			// 허용할 HTML tag만 변경
			str = str.replace("&lt;p&gt;", "<p>");
			str = str.replace("&lt;P&gt;", "<P>");
			str = str.replace("&lt;br&gt;", "<br>");
			str = str.replace("&lt;BR&gt;", "<BR>");
			// 스크립트 문자열 필터링 (선별함 - 필요한 경우 보안가이드에 첨부된 구문 추가)
			str_low = str.toLowerCase();
			if (str_low.includes("javascript") || str_low.includes("script")
					|| str_low.includes("div") || str_low.includes("iframe")
					|| str_low.includes("src") || str_low.includes("href")
					|| str_low.includes("url") || str_low.includes("ajax")
					|| str_low.includes("data") || str_low.includes("img")
					|| str_low.includes("code") || str_low.includes("ript")
					|| str_low.includes("for") || str_low.includes("json")
					|| str_low.includes("document")
					|| str_low.includes("vbscript")
					|| str_low.includes("applet") || str_low.includes("embed")
					|| str_low.includes("object") || str_low.includes("frame")
					|| str_low.includes("grameset")
					|| str_low.includes("layer") || str_low.includes("bgsound")
					|| str_low.includes("alert") || str_low.includes("onblur")
					|| str_low.includes("onchange")
					|| str_low.includes("onclick")
					|| str_low.includes("ondblclick")
					|| str_low.includes("enerror")
					|| str_low.includes("onfocus")
					|| str_low.includes("onload")
					|| str_low.includes("onmouse")
					|| str_low.includes("onscroll")
					|| str_low.includes("onsubmit")
					|| str_low.includes("onunload")) 
			{
				str = str_low;
				str = str.replace("url", "1212");
				str = str.replace("<sc", "---");
				str = str.replace("cr", "---");
				str = str.replace("ri", "---");
				str = str.replace("it", "---");
				str = str.replace("ip", "");
				str = str.replace("img", "");
				str = str.replace("im", "---");
				str = str.replace("al", "---");
				str = str.replace("er", "---");
				str = str.replace("rt>", "---");
				str = str.replace("ajax", "Hello");
				str = str.replace("href", "-----");
				str = str.replace("div", "x-div");
				str = str.replace("json", "14dd2");
				str = str.replace("for", "world");
				str = str.replace("ript", "");
				str = str.replace("code", "x-code");
				str = str.replace("src", "x-src");
				str = str.replace("href", "x-href");
				str = str.replace("javascript", "x-javascript");
				str = str.replace("script", "x-script");
				str = str.replace("iframe", "x-iframe");
				str = str.replace("document", "x-document");
				str = str.replace("vbscript", "x-vbscript");
				str = str.replace("applet", "x-applet");
				str = str.replace("embed", "x-embed");
				str = str.replace("object", "x-object");
				str = str.replace("frame", "x-frame");
				str = str.replace("grameset", "x-grameset");
				str = str.replace("layer", "x-layer");
				str = str.replace("bgsound", "x-bgsound");
				str = str.replace("alert", "x-alert");
				str = str.replace("onblur", "x-onblur");
				str = str.replace("onchange", "x-onchange");
				str = str.replace("onclick", "x-onclick");
				str = str.replace("ondblclick", "x-ondblclick");
				str = str.replace("enerror", "x-enerror");
				str = str.replace("onfocus", "x-onfocus");
				str = str.replace("onload", "x-onload");
				str = str.replace("onmouse", "x-onmouse");
				str = str.replace("onscroll", "x-onscroll");
				str = str.replace("onsubmit", "x-onsubmit");
				str = str.replace("onunload", "x-onunload");
				//console.log("함수"+str);
				$("#"+id).val(str);
			}
		}
	</script>

	<script>
		$('#files').change(function() {

							var FileCount = 0;
							//이미지 업로드 버튼을 누를 때마다 미리보기 이미지들을 초기화시킴
							$('#mainimg').attr('src', "/img/default.jpg");
							for (var i = 0; i < 3; i++) {
								$('#food' + i + '').attr('src', "");
							}

							const target = document.getElementsByName('shop_images');
							//const fileLength = target[0].files.length;

							if (target[0].files.length > 3) {
							alert("이미지는 최대 3개까지만 업로드가 가능합니다.");
								} else {$.each(target[0].files,function(index, file) {
													const fileName = file.name;
													const fileEx = fileName.slice(fileName	.indexOf(".") + 1).toLowerCase();
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
				removeXSS($("#files").val(),$("#files").attr("id"));
				removeXSS($("#title").val(),$("#title").attr("id"));
				removeXSS($("#brand").val(),$("#brand").attr("id"));
				removeXSS($("#datepicker").val(),$("#datepicker").attr("id"));
				removeXSS($("#price").val(),$("#price").attr("id"));
				removeXSS($("#quantity").val(),$("#quantity").attr("id"));
				removeXSS($("#contents").val(),$("#contents").attr("id"));
				alert("정상적으로 등록되었습니다.");
				return true;
			}
		});
	</script>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>