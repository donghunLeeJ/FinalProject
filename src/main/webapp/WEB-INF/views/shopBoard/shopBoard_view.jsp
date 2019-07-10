<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.row {
   border-bottom: 1px solid gray;
}

#buy.btn {
   
}
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
   <div class="container-fluid mt-5">
      <div class="row pt-5 ">
         <div class="col-2">왼쪽</div>
         <div class="col-8">
            <div class="container">
               <div class="row">
                  <div class="col-5">
                     <img src=${dto.shop_imagepath } alt="안뜸">
                  </div>
                  <div class="col-7">

                     <div class="row pb-4 ">
                        <div class="col-12">
                           <strong>[${dto.shop_id}] ${dto.shop_title }</strong>
                        </div>

                     </div>

                     <div class="row pb-3 mt-4">
                        <div class="col-4">판매가</div>
                        <div class="col-8">
                           <p>
                              <strong>${dto.shop_price }</strong>
                           </p>

                        </div>
                     </div>


                     <div class="row pb-3 mt-4 ">
                        <div class="col-4">판매 단위</div>
                        <div class="col-8">
                           <p>
                              ${dto.shop_quantity } <strong> (개)</strong>
                           </p>

                        </div>
                     </div>




                     <div class="row pb-3 mt-4">
                        <div class="col-4">유통기한</div>
                        <div class="col-8">
                           <p>
                              <strong>${dto.shop_expiration }</strong>
                           </p>

                        </div>
                     </div>

                     <div class="row pb-3 mt-4">
                        <div class="col-4">지역</div>
                        <div class="col-8">
                           <p>
                              <strong>${dto.shop_location }</strong>
                           </p>

                        </div>
                     </div>

                     <!-- 테이블 추가요망 -->
                     <div class="row pb-3 mt-4">
                        <div class="col-4">알레르기 정보</div>
                        <div class="col-8">
                           <p>
                              <strong>-밀,계란,우유,밤,함유(공주밤 몽블랑)</strong>
                           </p>

                        </div>
                     </div>

                     <div class="row pb-3 mt-4">
                        <div class="col-12" style="text-align: center" style="font-wight:600">

                           <a href="#" class="btn akame-btn">구 매 하 기</a> <a href="#"
                              class="btn akame-btn"><i class="icon_cart"></i>장 바 구 니</a>

                        </div>
                     </div>

                  </div>
               </div>


            </div>


         </div>
         <div class="col-2">오른쪽</div>
      </div>
      <div class="row pb-5">
         <div class=" col-12"></div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>