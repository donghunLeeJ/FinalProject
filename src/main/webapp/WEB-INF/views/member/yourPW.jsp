<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<title>Insert title here</title>
<style>
.form-control[readonly]{
background-color:white;
}
.center{
text-align: center;
}
</style>
<script type="text/javascript" src="/js/cross.js"></script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

	<section class="akame-contact-area bg-gray section-padding-80">
        <div class="container">
            <div class="row">
                <!-- Section Heading -->
                <div class="col-12">
                    <div class="section-heading text-center">
                        <img alt="" src="/img/core-img/fakelogo.png" style="width: 30%">
                    </div>
                </div>
                <div class="col-12">
                    <div class="section-heading text-center">
                        <h2>비밀번호를 초기화합니다</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                <form action="/member/cleanPW" id="cleanPW" method="post" class="akame-contact-form border-0 p-0">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                             <h3>비밀번호 입력</h3>
                             <input type="hidden" value="${change}" name=member_id>
                                <input type="password" style="width: 50%;margin: auto;" name="member_pw" id=pw
                                class="form-control mb-30"placeholder="대,소문자,숫자 포함 8~13자리">
                            </div>
                          <div class="col-lg-12 text-center" >
                                <h3>비밀번호 재입력</h3>
                                <input type="password" style="width: 50%; margin: auto;" id=pw2 
                                class="form-control mb-30" placeholder="대,소문자,숫자 포함 8~13자리">
                            </div>
                           
                            <div class="col-12 text-center">
                                <button type="button" class="btn akame-btn btn-3 mt-15 active" id=clean>초기화</button>
                            </div>
                        </div>
                         </form>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>

		$("#clean").on("click", function() {
			
			  var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,13}$/g;
		      var regPw2=/(\w)\1\1/g;
		      var reg = /\s/g;
		      
		  if($("#pw").val()==""){
		   alert("비밀번호를 입력하세요");
		   $("#pw").focus();
		  } else if(!regPw.test($("#pw").val())){
            alert("비밀번호 형식에 맞지 않습니다");
            $("#pw").val("");
            $("#pw").focus();
          }else if(regPw2.test($("#pw").val())){
             alert('연속으로 같은 문자를 3번 이상 사용하실 수 없습니다.');
             $("#pw").focus();
          }else if(reg.test($("#pw").val())){
             alert("공백은 입력할 수 없습니다");
             $("#pw").focus();
          }else if ($("#pw2").val() == "") {
             alert("비밀번호확인을 입력하세요");
             $("#pw2").focus();
          } else if ($("#pw").val() != $("#pw2").val()) {
             $("#pw").val("");
             $("#pw2").val("");
             alert("비밀번호가 일치하지 않습니다");
             $("#pw").focus();
          }else{
        	removeXSS($("#pw").val(),$("#pw").attr("id"));
          	removeXSS($("#pw2").val(),$("#pw2").attr("id"));
          	$("#cleanPW").submit();
          }
			
		})

	</script>
</body>
</html>