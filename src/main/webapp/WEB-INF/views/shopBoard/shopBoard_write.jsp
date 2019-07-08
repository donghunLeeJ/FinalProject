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
<!--  
create table shopboard(

shop_seq number primary key,              --글번호(자동 db저장)
shop_id varchar2(30) not null,            --판매자의 로그인 id(세션값)  
shop_title varchar2(200) not null,        --판매글 제목 
shop_contents varchar2(3000) not null,    --판매글 내용     
shop_writedate timestamp default sysdate, --판매글 작성 시간(자동 db 저장)
shop_location varchar2(30) not null,      --지역 (직접 입력)
shop_expiration  varchar2(30) not null,   --유통기한(직접 입력)
shop_price number not null,               --가격(직접 입력)
shop_quantity number not null,            --수량(직접 입력)

shop_imagepath varchar2(300) not null);   --음식 이미지가 들어가는 경로(서버 내에서 작업해야 함)

아이디<input type="text" name="id" id="id"><input type="button" value="중복확인" id="idcheck"><span id="resultid"></span><br>
비밀번호 <input type="text" name="password"><br>
이름 <input type="text" name="name"><br>
-->
   
     
<div class="container">          
<form action="/shopboard/ShopBoardProc" method="post" enctype="multipart/form-data">

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
           
           </div>
           
           
아이디<input type="text" name="id" id="id"><input type="button" value="중복확인" id="idcheck"><span id="resultid"></span><br>
비밀번호 <input type="text" name="password"><br>
<textarea name="shop_id" class="form-control mb-30" placeholder="내용"></textarea>
이미지<input type="file" name="shop_image"><br>
<input type="submit">


    </div>
</form> 
<div>



<!--  
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
   </div>
-->

 
 
 
 
 
 
 
 
 
 
 
 
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