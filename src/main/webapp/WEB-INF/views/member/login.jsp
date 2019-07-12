<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<title>Insert title here</title>

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
                        <h2>LogIN</h2>
                      
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Form -->
                    <form action="/member/loginProc" method="post" class="akame-contact-form border-0 p-0">
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                          	  <h3>ID</h3>
                                <input type="text" style="width: 50%;margin: auto;" name="member_id" class="form-control mb-30" placeholder="id">
                            </div>
                            <div class="col-lg-12 text-center" >
                                <h3>Password</h3>
                    
                                <input type="password" style="width: 50%; margin: auto;" name="member_pw" class="form-control mb-30" placeholder="password">
                            </div>
                           
                            <div class="col-12 text-center">
                            <br><br>
                                <button type="submit" class="btn akame-btn btn-3 mt-15 active">log in</button>
                                <button id="joinmem" type="button" class="btn akame-btn btn-3 mt-15 active">join member</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>

		$("#joinmem").on("click", function() {
			location.href = "/member/joinForm"

		})

	</script>
</body>
</html>