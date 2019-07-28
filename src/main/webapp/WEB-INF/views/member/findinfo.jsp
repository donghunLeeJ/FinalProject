<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400.300"
	rel="stylesheet" type="text/css">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">
<title>아이디/비밀번호 찾기</title>
<style>
/* div{ */
/* border:1px solid black; */
/* } */
.float {
	float: left;
}

.box {
	box-sizing: border-box;
}

.form-control[readonly] {
	background-color: white;
}
.h {
	font-family: naBrush;
}
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>


<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<section class="section-padding-80"
		style="background-color: #f4ead0; padding-bottom:40px; ">
        <div class="container">
            <div class="row">
                <!-- Section Heading -->
                <div class="col-12">
                    <div class="section-heading text-center">
                      <a href="/home"> <img alt="" src="/img/core-img/logo4.png"style="width: 30%"></a>
                    </div>
                </div>
                <div class="col-12">
                    <div class="section-heading text-center">
                        <h2 class=h>아이디/비밀번호 찾기</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Form -->
                    <form action="/member/findID" method="post" class="akame-contact-form border-0 p-0" id="findID">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                            <h3 class=h>아이디 찾기</h3><br>
                          	  <h5 class=h>성함을 입력해주세요</h5>
                                <input type="text" style="width: 50%;margin: auto;" name="member_name" 
                                placeholder="성합을 입력해주세요" class="form-control mb-30 tmp" id="my_name">
                            </div>
                            <div class="col-lg-12 text-center" >
                                <h5 class=h>핸드폰 번호를 입력해주세요</h5>
                                <input type="text" style="width: 50%; margin: auto;" name="member_phone" 
                                placeholder="'-'를 제외하고 입력해주세요"class="form-control mb-30 tmp" id="my_phone">
                            </div>
                            <div class="col-12 text-center">
                            <br>
                                <button id="find_id" type="button" class="btn akame-btn btn-3 mt-10 active">아이디 찾기</button>
                            </div>
                        </div>
                    </form>
                </div>
           
                 <div class="col-12 mt-5">
                    <!-- Form -->
                    <form action="/member/findPW" method="post" class="akame-contact-form border-0 p-0" id="findPW">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                              <h3 class=h>비밀번호 찾기</h3><br>
                          	  <h5 class=h>이메일을 입력해주세요</h5>
                                <input type="text" style="width: 50%;margin: auto;" name="member_id" 
                                placeholder="가입된 이메일을 입력해주세요"class="form-control mb-30 tmp" id="my_email">
                            </div>
                            
                            <div class="col-12 text-center">
                            <br>
                                <button id="find_pw" type="button" class="btn akame-btn btn-3 mt-10 active">email 발송</button>
                            </div>
                        </div>
                    </form>
                </div>
                
            </div>
            
        </div>
    </section>
<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
		$("#find_id")
				.on(
						"click",
						function() {
							var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							var regname = /^[가-힣]{2,4}$/;
							var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,13}$/g;
							var regPw2 = /(\w)\1\1/g;
							var regnum = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;

							var count = 0;

							$(".tmp").each(function(i, item) {
								if ($(item).val == "") {
									count++;
								}
							});

							if (count > 0) {
								alert("모든 항목을 입력하세요");
							} else if (!regname.test($("#my_name").val())) {
								alert("이름이 형식에 맞지 않습니다");
							} else if (!regnum.test($("#my_phone").val())) {
								alert("핸드폰 번호가 형식에 맞지 않습니다");
							} else {
								removeXSS($("#my_name").val(), $("#my_name")
										.attr("id"));
								removeXSS($("#my_phone").val(), $("#my_phone")
										.attr("id"));
								$("#findID").submit();
							}

						});

		$("#find_pw")
				.on(
						"click",
						function() {
							var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

							if ($("#my_email").val() == "") {
								alert("이메일을 입력해주세요");
							} else if (!regId.test($("#my_email").val())) {
								alert("이메일 형식에 맞지 않습니다");
							} else {
								removeXSS($("#my_email").val(), $("#my_email")
										.attr("id"));
								$("#findPW").submit();
							}

						});
	</script>
</body>
</html>