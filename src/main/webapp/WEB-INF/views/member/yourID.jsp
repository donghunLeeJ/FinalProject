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
                        <h2>회원님의 ID입니다</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                                <input type="text" style="width: 50%;margin: auto;" class="form-control mb-30 center" placeholder=${confirm } readonly>
                            </div>
                         
                            <div class="col-12 text-center">
                                <button type="button" class="btn akame-btn btn-3 mt-15 active" id=home>Home</button>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>

		$("#home").on("click", function() {
			location.href = "/home"
		})

	</script>
</body>
</html>