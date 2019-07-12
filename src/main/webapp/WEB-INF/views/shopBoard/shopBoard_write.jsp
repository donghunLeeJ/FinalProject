<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
img {
	max-width: 100%;
	height: auto;
}
</style>

<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
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

	<div class="container">
		<div class="row">
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 mt-4"
						style="height: 25.2rem;">
						<img id="mainimg" src="/img/default.jpg"
							style="width: 100rem; height: 100%;">
					</div>
				</div>
				<form id="frm" action="/shopboard/ShopBoardInsertProc" method="post">

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
			</div>


			<div class="col-lg-7 mt-2">

				<div class="mt-2">
					제목<input type="text" name="shop_title" class="form-control input">
				</div>
				<br>
				<div class="mt-2">
					판매자 브랜드<input type="text" name="shop_brand"
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

				<div class="mt-2">
					유통기한이야!<input id="datepicker" name="shop_expiration"
						class="form-control">
				</div>
				<br>
				<div class="mt-2">
					가격<input type="number" name="shop_price" class="form-control input">
				</div>
				<br>
				<div class="mt-2">
					수량 <input type="number" name="shop_quantity"
						class="form-control input">
				</div>
				<br>
			</div>

			<div class="col-12 mt-2">
				<textarea name="shop_contents" class="form-control mb-30 input"
					placeholder="내용" style="height: 15rem;"></textarea>
			</div>


			<div class="col-10"></div>
			<div class="col-2 custom-file">
				<input multiple="multiple" type="file" class="custom-file-input"
					id="files" name="shop_images"> <label
					class="custom-file-label" for="customFile">이미지올리기</label>
			</div>

			<div class="col-12 text-center">
				<input id="submitbtn" type="submit" value="제출"
					class="btn akame-btn btn-3 mt-15 active">
			</div>
			<button id="ddd">dddddd</button>
		</div>
	
		
	</form>

			<script>
//datepicker 한국식 날짜 표현


$("#datepicker").datepicker({
   uiLibrary : 'bootstrap4',
   format: "yyyy-mm-dd",
   language: "kr"
    
   });  

//$("#ddd").on("click",function(){
//	alert($("#datepicker").val());
//})
//$(".datepicker").change(function(){
//$("#expiration").val($(".datepicker").val());
//});



//이미지 미리보기 기능
$('#files').change(function(){
    var FileCount = 0;     
  
	//이미지 업로드 버튼을 누를 때마다 미리보기 이미지들을 초기화시킴
    $('#mainimg').attr('src',"/img/default.jpg");	       
	for(var i=0; i<3; i++){$('#food'+i+'').attr('src',"");}
	
        const target = document.getElementsByName('shop_images');          
       //const fileLength = target[0].files.length;
         
       if(target[0].files.length > 3){
    	   
    	   alert("이미지는 최대 3개까지만 업로드가 가능합니다.");
       
       }else{
    	   
    	   $.each(target[0].files, function(index, file){
	   	    	
               const fileName = file.name;
                   
               const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
                     
               if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
                   alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
                   resetFile();
                   return false;}
                       
               //업로드한 이미지 파일중 최대 3개까지 미리보기 영역에 등록시킴
                if(FileCount == 0){ 
                	
                   $('#mainimg').attr('src' ,''+URL.createObjectURL(file)+'');	
                }
               
               $('#food'+index+'').attr('src' ,''+URL.createObjectURL(file)+'');
               $('#food'+index+'').css("width","100rem");
               $('#food'+index+'').css("height","100%");
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

		}else{
			  
			alert("정상적으로 등록되었습니다.");
			return true;
		}
	});	
</script>


			<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>
