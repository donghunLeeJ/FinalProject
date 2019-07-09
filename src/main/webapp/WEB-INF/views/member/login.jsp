<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/logincss.css">
</head>
<body>

<div class="login-page">
	
  <div class="form">
  <h2>logo</h2>
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    
    
    
    <form class="login-form" action=/member/loginProc>
      <input type="text" placeholder="username" name="member_id"/>
      <input type="password" placeholder="password" name="member_pw"/>
      <button type="submit">login</button>
      <p class="message"> <a href="#">아이디 찾기/</a> <a href="#">비밀번호 찾기</a></p>
    </form>
  </div>
</div>


<!-- 	<a href="/home">logo</a> -->
<!-- 	<form action="/member/loginProc"> -->
<!-- 	<input type=text name="member_id">아이디<br> -->
<!-- 	<input type=text name="member_pw">패스워드 -->
<!-- 		<button type="submit">로그인</button> -->
<!-- 		<button type="button" id="joinmem">회원가입</button> -->
<!-- 	</form> -->
	
	<script>
		$("#joinmem").on("click",function(){
			location.href="/member/joinForm"
		})
	
	$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
	</script>
</body>
</html>