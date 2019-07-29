<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>타임라인 작성하기</title>
<style>
	textarea{
	width: 100%;
	height: 100px;
	}

</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="../css/style2.css">
<!-- <link rel="stylesheet" href="style.css"> -->
	<script type="text/javascript" src="/js/cross.js"></script><!-- 지우지 말 것 -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

	<section class="akame-contact-area bg-gray section-padding-80">

	<div class="container">
		<div class="row">
			<div class="col-lg-7" style="margin: auto">
				<div class="row">
					<!-- Section Heading -->
					<div class="col-12">
						<div class="section-heading text-center">
							<h2 style="font-family: 'Sunflower', sans-serif;">여러분의 의견을 남겨주세요!</h2>
							<p style="font-family: 'Sunflower', sans-serif;">자유롭게 남겨주세요!</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<!-- Form -->
						<form action="/timeline/writedProc" method="post" id="formTL"
							enctype="multipart/form-data"
							class="akame-contact-form border-0 p-0">
							<div class="row">
								<div class="col-lg-12">
									<h3 style="font-family: 'Sunflower', sans-serif;">- 제목 -</h3>
								</div>
								<div class="col-lg-12">
									<input type="text" name="tl_title" class="form-control mb-30" id="title"
										placeholder="제목을 입력해주세요">
								</div>

								<div class="col-lg-12 ">
									<h3 style="font-family: 'Sunflower', sans-serif;">- 내용 -</h3>
									<div id="img_field" class="border" style="height: 23em;text-align: center;background-color: white">
										<img  id="image_section" src="/img/placeholder.png" alt=""
											style="height: 100%;margin: auto">
									</div>

										<div class="custom-file">
											<input type="file" class="custom-file-input form-control" name="tl_image"
												id="imgInput" accept=".gif, .jpg, .png, .jpeg" onchange="checkFile(this)" aria-describedby="inputGroupFileAddon01"> 
												<label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
<!-- 												<input type=file id="file" name="file" accept=".gif, .jpg, .png, .jpeg" onchange="checkFile(this)"> -->
										</div>
										

								</div>
								<div class="col-lg-12 ">
									<textarea style="resize: none;" name="tl_contents" class="form-control mb-30" id="contents"
										placeholder="내용을 입력해주세요"></textarea>
								</div>
								<div class="col-lg-6 text-right">
									<button type="button" id="OK" class="btn akame-btn btn-3 mt-15 active">작성
										완료</button>
								</div>
								<div class="col-lg-6 text-left">
									<button type="button" class="btn akame-btn btn-3 mt-15 active"
										id="tolistbtn">목록으로</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
	</section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	

	
	<script>
	
	function checkFile(f){
		// files 로 해당 파일 정보 얻기.
		var file = f.files;
		// file[0].name 은 파일명 입니다.
		// 정규식으로 확장자 체크
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
		alert('gif, jpg, png, jpeg 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
 		$("#imgInput").val("");
		}
		else return;
	}
	
	$("#OK").on("click",function(){
		
		var emp = /^\s*$/g;
		if($("#title").val()=="" || emp.test($("#title").val())){
		
			alert("제목을 입력해주세요");
			$("#title").focus();
		}else if($("#contents").val()=='' || emp.test($("#contents").val())){
			alert("내용을 입력해주세요");
			$("#contents").focus();
		}else if($("#imgInput").val() == ''){
			alert("이미지를 등록해주세요");
		}else{
		removeXSS($("#title").val(),$("#title").attr("id"));
		removeXSS($("#contents").val(),$("#contents").attr("id"));
		removeXSS($("#image_section").val(),$("#image_section").attr("id"));
		$("#formTL").submit();
		}
	});
	
	
		$("#tolistbtn").on("click", function() {
			$(location).attr("href", "/timeline/accessTimeLine?seq=1")
		})
		function readURL(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInput").change(function() {
			readURL(this);
		});
	</script>
	
	
</body>
</html>