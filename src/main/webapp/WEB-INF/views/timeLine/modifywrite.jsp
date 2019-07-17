<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<!-- <link rel="stylesheet" href="style.css"> -->

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
									<input type="text" name="tl_title" class="form-control mb-30"
										placeholder="제목을 입력해주세요" value="${title }">
								</div>
								<input type="hidden" name="tl_board_seq" value="${seq }">
								<div class="col-lg-12 ">
									<h3>- contents -</h3>
									<div id="img_field" class="border" style="height: 23em; text-align: center">
										<img class="border" id="image_section" src="${imgaddr}" alt=""
											style="height: 100%;margin: auto">
											<input type="hidden" value="${imgaddr}" name="imagePath">
									</div>
									<div class="custom-file">
										<input type="file" name="tl_image"
											class="custom-file-input form-control" id="imgInput"
											aria-describedby="inputGroupFileAddon01"> <label
											class="custom-file-label" for="inputGroupFile01">Choose
											file</label>
									</div>
								</div>
								<div class="col-lg-12 ">
									<textarea name="tl_contents" class="form-control mb-30"
										placeholder="내용을 입력해주세요">${contents }</textarea>
								</div>
								<div class="col-lg-6 text-right">
									<button type="submit" class="btn akame-btn btn-3 mt-15 active">작성
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
	</script>
</body>
</html>