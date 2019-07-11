<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
</style>
</head>

<body>
   <!-- Preloader -->
    <jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
   <!-- Header Area End -->

   <!-- Welcome Area Start -->


   <!-- About Area Start -->
   <section class="akame-about-area section-padding-80-0"> 
   <!--        --------------------------------------------------------------------------------------------------- -->
   <button id="writebtn">글쓰기</button>
   <script>
      $("#writebtn").on("click",function(){
         $(location).attr("href", "/timeline/tl_boardWrite")
      })
   </script>
   <div class="container ">
      <c:forEach var="i" items="${result}">
      <div class="row mt-4">
         <div class="col-lg-6 border" style="margin: 0 auto">
            <div class="row py-3">
               <div class="col-lg-2"><img class="rounded-circle" alt="" src="/img/core-img/empty_profile.png">${i.tl_writer }</div>
               <div class="col-lg-10 py-2">${i.tl_title }</div>
            </div>
            <div class="single-post-area">
               <div class="post-thumbnail" style="text-align: center" >
                  <img src="${i.tl_imgaddr}" alt="">
               </div>
               <div class="post-content">
               
                  <div class="post-meta">
                     <a href="#" class="post-date"><i class="icon_clock_alt"></i>
                        <fmt:formatDate var="resultRegDt" value="${i.tl_writedate}" pattern="yyyy-MM-dd"/>
                  ${resultRegDt}</a> <a href="#" class="post-comments"><i
                        class="icon_chat_alt"></i> ${i.tl_likecount }</a>
                  </div>
                  <p>${i.tl_contents } </p>
               </div>
            </div>
         </div>
      </div>
      </c:forEach>
   </div>
   </section>
   <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>