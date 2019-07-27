<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<!-- <link rel="stylesheet" href="style.css"> -->
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
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
							<h2>글 수정</h2>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<!-- Form -->
						<form action="/timeline/boardModified" method="post"
							enctype="multipart/form-data"
							class="akame-contact-form border-0 p-0">
							<div class="row">
								<div class="col-lg-12">
									<h3>- title -</h3>
								</div>
								<div class="col-lg-12">
									<input type="text" name="tl_title" class="form-control mb-30" id=line_title
										placeholder="제목을 입력해주세요" value="${result.tl_title }">
								</div>
								<input type="hidden" name="tl_board_seq" value="${result.tl_board_seq }">
								<div class="col-lg-12 ">
									<h3>- contents -</h3>
									<div id="img_field" class="border" style="height: 23em; text-align: center">
										<img class="border" id="image_section" src="${result.tl_imgaddr}" alt=""
											style="height: 100%;margin: auto">
											<input type="hidden" value="${result.tl_imgaddr}" name="imagePath">
									</div>
									<div class="custom-file">
										<input type="file" name="tl_image"
											class="custom-file-input form-control" id="imgInput"
											aria-describedby="inputGroupFileAddon01" onchange="checkFile(this)"> <label
											class="custom-file-label" for="inputGroupFile01">Choose
											file</label>
									</div>
								</div>
								<div class="col-lg-12 ">
									<textarea name="tl_contents" class="form-control mb-30" id=line_con style="resize: none;"
										placeholder="내용을 입력해주세요">${result.tl_contents }</textarea>
								</div>
								<div class="col-lg-6 text-right">
									<button type="button" class="btn akame-btn btn-3 mt-15 active" id=confirm>수정
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
		
		$("#confirm").on("click",function(){
			var emp = /^\s*$/g;
			if($("#line_title").val()=="" || emp.test($("#line_title").val())){
				alert("제목을 입력해주세요");
			}else if($("#line_con").val()=="" || emp.test($("#line_con").val())){
				alert("내용을 입력해주세요");
			}else{
			removeXSS($("#line_title").val(), $("#line_title").attr("id"));
			removeXSS($("#line_con").val(), $("#line_con").attr("id"));
			$("#delform").submit();
			}
		})
				function checkFile(f) {

			// files 로 해당 파일 정보 얻기.
			var file = f.files;

			// file[0].name 은 파일명 입니다.
			// 정규식으로 확장자 체크

			if (!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
				alert('gif, jpg, png, jpeg 파일만 선택해 주세요.\n\n현재 파일 : '
						+ file[0].name);
				$("#imgInput").val("");
			}
			// 체크를 통과했다면 종료.
			else
				return;

			// 체크에 걸리면 선택된  내용 취소 처리를 해야함.
			// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
			// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
			// 이렇게 하면 간단 !?
			f.outerHTML = f.outerHTML;
		}
	</script>
</body>
</html>