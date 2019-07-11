<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<style>
.float{
float:left;
}
#findAdd{
padding:5px;
width:50px;
height:50px;
}
#myinfo{
width:200px;
height:200px;
}
.no{
padding:0px;
margin:0px;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
                            <label class="col-lg-3 col-form-label form-control-label">우편번호
<!--                             <button type="button" onclick="sample4_execDaumPostcode()" -->
<!--                            class="btn btn-primary p-1"data-aria-haspopup="true"aria-expanded="false" id="findAdd">변경</button>       -->
                           <img src="/img/core-img/find_addr.png"onclick="sample4_execDaumPostcode()" 
                           class=  "mx-auto img-circle"  data-aria-haspopup="true"aria-expanded="false" id="findAdd" >                     
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control" id="postcode"name="member_postcode" type="text" value="${id.member_postcode}" readonly>
                            </div>
                        </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">도로명 주소 </label>
                            <div class="col-lg-9">
                                <input class="form-control" id="add1"name="member_address1" type="text" value="${id.member_address1}" readonly>
                            </div>
                        </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">상세주소  </label>
                            <div class="col-lg-9">
                                <input class="form-control" id="add2"name="member_address2" type="text" value="${id.member_address2}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">핸드폰 번호</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="phone" name="member_phone" type="text" value="${id.member_phone}"
                                placeholder=" '-' 제외하고 입력" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">자기 소개</label>
                            <div class="col-lg-9">
                                <input class="form-control"id="intro" name="member_intro" type="text" value="${id.member_intro}" >
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

$("#edit_info").on("click",function(){//정보수정 버튼 클릭시
	
	var regnum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	
	
	if ($("#postcode").val() == "") {
		alert("주소를 입력하세요");
	}else if ($("#phone").val() == "") {
		alert("핸드폰 번호를 입력하세요");
		$("#phone").focus();
	}else if(!regnum.test($("#phone").val())){
		alert("핸드폰 번호가 형식에 맞지 않습니다");
		$("#phone").focus();
  	}else if($("#pw1").val()==""){
		alert("비밀번호를 입력해주세요");
		$("#pw1").focus();
  	}else if($("#pw2").val()==""){
  		alert("비밀번호 확인을 입력해주세요");
		$("#pw2").focus();
  	}
  	else if($("#pw1").val()!=$("#pw2").val()){
		alert("비밀번호가 같아야 합니다");
		$("#pw2").focus();
	}else if($("#add2").val()==""){
			var result =confirm("상세주소가 없습니다.\n변경하시겠습니까?");
			if(result) $("#edit_mypage").submit();
			else return;
	}
	
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script>  <!--주소등록-->
                              //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                              function sample4_execDaumPostcode() {
                                 new daum.Postcode(
                                       {
                                          oncomplete : function(
                                                data) {
                                             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                             var roadAddr = data.roadAddress; // 도로명 주소 변수
                                             var extraRoadAddr = ''; // 참고 항목 변수

                                             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                             if (data.bname !== ''
                                                   && /[동|로|가]$/g
                                                         .test(data.bname)) {
                                                extraRoadAddr += data.bname;
                                             }
                                             // 건물명이 있고, 공동주택일 경우 추가한다.
                                             if (data.buildingName !== ''
                                                   && data.apartment === 'Y') {
                                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                                      + data.buildingName
                                                      : data.buildingName);
                                             }
                                             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                             if (extraRoadAddr !== '') {
                                                extraRoadAddr = ' ('
                                                      + extraRoadAddr
                                                      + ')';
                                             }

                                             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                             document
                                                   .getElementById('postcode').value = data.zonecode;
                                             document
                                                   .getElementById("add1").value = roadAddr;
//                                              document
//                                                    .getElementById("add2").value = data.jibunAddress;
                                             document
                                             .getElementById("add2").value ="";//도로명만 받기

                                          }
                                       }).open();
                              }
                           </script>

	
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>  
</body>
</html>