<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	
	
<div class="container">
   
                    <form  action="/member/edit_mypage" method="post">
                        <div class="form-group row"  >
                            <label class="col-lg-3 col-form-label form-control-label">아이디</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" name="member_name" value="${id.member_id }" readonly>
                                
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">이름</label>
                            <div class="col-lg-9">
                                <input class="form-control" name="member_id" type="text" value="${id.member_name }"  readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">생일</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${id.member_birth}"  readonly >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">성별</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${id.member_gender }"  readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">주소</label>
                            <div class="col-lg-9">
                                <input class="form-control" name="member_add" type="text" value="${id.member_add}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">핸드폰 번호</label>
                            <div class="col-lg-9">
                                <input class="form-control" name="member_phone" type="text" value="${id.member_phone}" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">자기 소개</label>
                            <div class="col-lg-9">
                                <input class="form-control" name="member_intro" type="text" value="" >
                            </div>
                        </div>
                       
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">비밀번호</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password" name="member_pw" id="pw1">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">비밀번호 확인</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password"  id="pw2">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="submit" id="edit_info" class="btn btn-primary" value="정보 수정">
                                <input type="button" id="delId" class="btn btn-primary" value="회원 탈퇴">
                            </div>
                        </div>
                    </form>
                </div>
  

<script>
$("#file").hide();
$("#change").on("click",function(){
    $("#file").click();//사진변경 버튼 누르면 file버튼 클릭됨

});

$("#file").on("change",function(){
	file=$("#file").prop("files")[0];
	ImgURL=window.URL.createObjectURL(file);
	$("#preview img").attr('src',ImgURL);
	$("#preview").show();
})

// $("#edit_info").on("click",function(){//정보수정 버튼 클릭시
// 	if($("#pw1").val()==""||$("#pw2").val()==""){
// 		alert("비밀번호를 입력해주세요");
// 		return;
// 	}
// 	else if($("#pw1").val()!=$("#pw2").val()){
// 		alert("비밀번호 값이 같아야 합니다");
// 		return;
// 	}else{	
// 		$("#edit_mypage").submit();
		
// 	}
// })

</script>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>  
</body>
</html>