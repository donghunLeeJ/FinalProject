<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
 <!-- /shopboard/filetest
 /shopboard/ShopBoardInsertProc
  -->    
<div class="container">          

<div class="row">

   <div class="col-lg-4">
        
        <div class="row">
         <div class="card col-lg-12">             
                <div id="mainimg" class="card-body">         
            <img src="/img/default.jpg">
               </div>                       
         </div>         
        </div>
        
 <form action="/shopboard/ShopBoardInsertProc" method="post" enctype="multipart/form-data">
        
        <div class="row">
        
            <div class="col-lg-4" style="width: 5rem; ">  
                       
               <img id="food1" class="img">            
                      
               <label class="custom-file">
               <input  multiple="multiple" type="file" id="shop_image1" name="shop_image" class="custom-file-input">
               <span class="custom-file-control">이미지 선택</span></label>
                                                                 
            </div>    
           
           
            <div class="col-lg-4" style="width: 5rem; ">             
               <img id="food2" class="img">            
                      
               <label class="custom-file">
               <input  multiple="multiple" type="file" id="shop_image2" name="shop_image" class="custom-file-input">
               <span class="custom-file-control">이미지 선택</span></label>                                                
            </div>    
            
            
             <div class="col-lg-4" style="width: 5rem; ">                         
               <img id="food3" class="img">                          
               <label class="custom-file">
               <input  multiple="multiple" type="file" id="shop_image3" name="shop_image" class="custom-file-input">
               <span class="custom-file-control">이미지 선택</span></label>                                                  
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
                
  <div class="col-12">
            <textarea name="shop_contents" class="form-control mb-30" placeholder="내용"></textarea>
         </div>
         
                   
         <div class="col-10 text-center">
            <input type="submit" value="제출이야" class="btn akame-btn btn-3 mt-15 active" >
         </div>


    </div>
</form> 
<div>


<!--  
 <form name="fileForm" action="/shopboard/filetest" method="post" enctype="multipart/form-data">
 
        <input multiple="multiple" type="file" name="shop_image" />
        <input multiple="multiple" type="file" name="shop_image" />
        <input multiple="multiple" type="file" name="shop_image" />
        <input type="text" name="shop_title" />
        <input type="submit" value="전송임ㅇ" />
        
   </form> -->
<script>
//이미지 미리보기 기능







function readURL1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#food1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#shop_image1").change(function() {
    readURL1(this);
});


function readURL2(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#food2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#shop_image2").change(function() {
    readURL2(this);
});


function readURL3(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#food3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#shop_image3").change(function() {
    readURL3(this);
});



$(".img").each(function(i,item){
    
     $(item).on("click",function(){	
    	
    	$("#mainimg").html($(item).clone());
      	
    })    
});  



</script>


 <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>  
</body>
</html>