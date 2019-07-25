<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
   <div class="container" style="width: 450px; height: 500px">
      <form action="/timeline/messageProc" method="post">
         <div class="row">
            <div class="col-12  p-4">
               <input type="hidden" value="${seq }" name="tl_board_seq">
               <h2 style="color: gray">
                  <img alt="" src="/img/core-img/logo.png"> 메세지 보내기
               </h2>

            </div>

         </div>
         <div class="row">
            <div class="col-12 border-bottom p-4">보내는 사람 : ${sender }</div>
            <input type="hidden" value="${sender }" name="message_sender">
            
         </div>
         <div class="row">
            <div class="col-12 border-bottom p-4">받는 사람 : ${writer }</div>
               <input type="hidden" value="${writer }" name="message_getter">
            
         </div>
         <div class="row">
            <div class="col-12 border-bottom p-4">
               내용
               <textarea id="textWrite"
                  style="width: 413px; height: 300px; resize: none;"
                  name="message_contents"></textarea>
            </div>

         </div>
         <div class="row">
            <div class="col-12 border-bottom p-4">
               <input class="btn btn-secondary" type="submit" value="보내기">
            </div>

         </div>
      </form>
   </div>
   <script>
      if(${no == 1}){
         alert("본인에게 메세지를 보낼 수 없습니다.");
         window.close();
      }
   </script>

</body>
</html>