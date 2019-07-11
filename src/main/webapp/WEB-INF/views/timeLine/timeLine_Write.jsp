<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TimeLine Write Page</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<!-- <link rel="stylesheet" href="style.css"> -->
<style>
#content {
   height: 300px;
}

textarea {
   width: 100%;
   height: 100%;
}

#subject input {
   width: 100%;
   height: 100%;
}

#newImg {
   width: 200px;
   height: 200px;
}

#img_field {
   border: 1px solid gray; text-align : center;
   width: 21em;
   height: 21em;
   text-align: center;
}
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

   <section class="akame-contact-area bg-gray section-padding-80">
   <div class="container">
      <div class="row">
         <!-- Section Heading -->
         <div class="col-12">
            <div class="section-heading text-center">
               <h2>Leave your Opinion</h2>
               <p>We have open Mind!</p>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-12">
            <!-- Form -->
            <form action="/timeline/writedProc" method="post"
               enctype="multipart/form-data"
               class="akame-contact-form border-0 p-0">
               <div class="row">
                  <div class="col-lg-6 col-sm-6">
                     <input type="text" name="tl_title" class="form-control mb-30"
                        placeholder="제목을 입력해주세요">
                  </div>

                  <div class="col-lg-12 col-sm-12 mt-4 mb-0">
                     <div id="img_field">
                        <img id="newImg" src="#" alt="">
                     </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                     <!--                   <input type=file name="tl_image" class=" imageInp"> -->

                     <div class="custom-file">
                        <input type="file" name="tl_image"
                           class="custom-file-input form-control" id="inputGroupFile01"
                           aria-describedby="inputGroupFileAddon01"> <label
                           class="custom-file-label" for="inputGroupFile01">Choose
                           file</label>
                     </div>



                  </div>
                  <div class="col-lg-12 ">
                     <textarea name="tl_contents" class="form-control mb-30"
                        placeholder="내용을 입력해주세요"></textarea>
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
   </section>

   <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
   <script>
      $("#tolistbtn").on("click", function() {
         $(location).attr("href", "/timeline/accessTimeLine")
      })
      function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#newImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }

      $(".imageInp").change(function() {
         readURL(this);
      });
   </script>
</body>
</html>