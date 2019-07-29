<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/logo4.png">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400.300"
	rel="stylesheet" type="text/css">
	<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/style2.css">
<title>아이디 찾기</title>
<style>
.form-control[readonly]{
background-color:white;
}
.center{
text-align: center;
}
.h {
	font-family: naBrush;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

	<section style="background-color: #f4ead0";  class="akame-contact-area bg-gray section-padding-80">
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
                        <h2 class=h>회원님의 ID입니다</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                                <input type="text" style="width: 50%;margin: auto;" class="form-control mb-30 center h" placeholder=${confirm } readonly>
                            </div>
                         
                            <div class="col-12 text-center">
                                <button type="button" class="btn akame-btn btn-3 mt-15 active" id=home>Home</button>
                                  <button type="button" class="btn akame-btn btn-3 mt-15 active" id=pass>비밀번호 초기화</button>
                            </div>
                        </div>
                </div>
            </div>
                            <br>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>

		$("#home").on("click", function() {
			location.href = "/home"
		})
		$("#pass").on("click", function() {
			location.href = "/member/findinfo"
		})

	</script>
</body>
</html>