<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
     
<div class="container">          
<form action="/shopboard/ShopBoardInsertProc" method="post" enctype="multipart/form-data">

<div class="row">

   <div class="col-lg-4">
         
            <div class="row card" style="width: 20rem; ">             
               <img id="food" src="#" class="card-img-top" alt="..." style="height: 12rem">            
               <div class="card-body">         
               <label class="custom-file">
               <input type="file" id="shop_image" name="shop_image" class="custom-file-input">
               <span class="custom-file-control">Choose file</span></label>
               </div>                                         
            </div>                
       </div>
         
           <div class="col-lg-6">
           
           <input type="text" name="shop_title" class="form-control mb-30" placeholder="제목">
           <input type="text" name="shop_location" class="form-control mb-30" placeholder="판매지역"> 
           <input type="text" name="shop_expiration" class="form-control mb-30" placeholder="유통기한">
           <input type="text" name="shop_price" class="form-control mb-30" placeholder="가격">
           <input type="text" name="shop_quantity" class="form-control mb-30" placeholder="수량">
           
           </div>
                
  <div class="col-10">
            <textarea name="shop_contents" class="form-control mb-30" placeholder="내용"></textarea>
         </div>
         
         <div class="col-10 text-center">
            <input type="submit" value="제출" class="btn akame-btn btn-3 mt-15 active" >
         </div>

    </div>
</form> 
<div>


<script>
//이미지 미리보기 기능
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#food').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#shop_image").change(function() {
    readURL(this);
});
</script>


 <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>  
</body>
</html>