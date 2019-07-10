<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>


<!-- //주소 script -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- // 데이터 피커 사용시 필요한것----------------------------------------------------- -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  


<!-- //------------------------------------------------------------------------------ -->
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">

<style>
.title{
 text-align: left;
 margin-left:26%;
}

#addinput{
	float:left;
	padding-right:10px;
}
</style>

</head>
<body>

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
                        <h2>회원가입</h2>
                      
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Form -->
                    <form id=form action="/member/joinProc" method=post class="akame-contact-form border-0 p-0">
                    
                        <div class="row" >
                            <div class="col-lg-12 text-center">
                          	  <div class=title>아이디</div>
                                <input type="text" style="width: 50%;margin: auto;" id=id name="member_id" class="form-control mb-30" placeholder="id">
                            </div>
                            <div class="col-lg-12 text-center" >
                                <div class=title>비밀번호</div>
                    
                                <input type="password" style="width: 50%; margin: auto;" id=pw name="member_pw" class="form-control mb-30" placeholder="password">
                            </div>
                            <div class="col-lg-12 text-center" >
                                <div class=title>비밀번호 확인</div>
                    
                                <input type="password" id=pwCheck style="width: 50%; margin: auto;"  class="form-control mb-30" placeholder="passwordCheck">
                            </div>
                           
                           <div class="col-lg-12 text-center" >
                                <div class=title>이름</div>
                    
                                <input type="text" id=name style="width: 50%; margin: auto;" name="member_name" class="form-control mb-30" placeholder="name">
                            </div>
                           
                           <div class="col-lg-12 text-center" >
                                <div class=title>생년월일</div>
                    
                                <input type="text" id="birth" style="width: 50%; margin: auto;" name="member_birth" class="form-control mb-30" placeholder="birth">
                            </div>
                           
                           
                                <div class=title id=addinput>주소 입력</div><input id=addbtn type="button" class="mb-12 mb-2" value="우편번호 찾기" id="search">
                                <div class="col-lg-12 text-center" >
                    			 <div class="col-lg-12">
                    			 <input type="text" id="postcode" style="width: 51.2%; margin: auto;" name="member_postcode" class="form-control mb-30" placeholder=""><br>
                    			 <input type="text" id="address1" style="width: 51.2%; margin: auto;" name="member_address1" class="form-control mb-30" placeholder=""><br>
                    			 <input type="text" id="address2" style="width: 51.2%; margin: auto;" name="member_address2" class="form-control mb-30" placeholder="">
                        <br>
                        
                    </div>
                            </div>
                            
                            <div class="col-lg-12 text-center" >
                                <div class=title>성별</div>
                    			<input type="radio" id="man" name=member_gender value="M" checked="checked" >남자
            <input type="radio" id="woman" name=member_gender value="W">여자
                                
                            </div><br>
                           
                           <div class="col-lg-12 text-center" >
                                <div class=title>전화번호</div>
                    
                                <input type="text" name=member_phone id=phone style="width: 50%; margin: auto;"  class="form-control mb-30" placeholder="phone">
                            </div>
                           
                           
                            <div class="col-12 text-center">
                            <br><br>
                                <button type="button" class="btn akame-btn btn-3 mt-15 active" id=send>가입하기</button>
                                
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>


<!-- <form id=form action="/member/joinProc" method=post> -->

<!-- 	<tr> -->
<!--         <th>생일</th> -->
<!--         <td> -->
<!--         <input type="text" name=member_birth id="birth" size="8" maxlength="8" /> -->
<!--         </td> -->

<!-- 	<tr> -->
       
	
	
	<script>
		
		//여기서 부터 가입버튼 눌렀을때 실행
		$("#send").on("click",function(){
			
		if($("#id").val() == ""){
		   alert("아이디를 입력하세요");
			$("#id").focus();
		   }else if($("#pw").val()== ""){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
		}else if($("#pwCheck").val() == ""){
			alert("비밀번호확인을 입력하세요");
			$("#pwCheck").focus();
		}else if($("#pw").val() != $("#pwCheck").val()){
			 $("#pw").val("");
                $("#pwCheck").val("");
			alert("비밀번호가 일치하지 않습니다");
                $("#pw").focus();

		}else if($("#name").val() == ""){
			alert("이름을 입력하세요");
			$("#name").focus();
		}else if($("#birth").val() =="" ){
			alert("생년월일을 입력하세요");
		}else if($("#add").val() == ""){
			alert("주소를 입력하세요");
		}else if($("#phone").val() == ""){
			alert("번호를 입력하세요");
		}else if ($("#man").is(':checked') == false && $("#woman").is(':checked') == false) {
                alert("남자또는 여자를  꼭 선택하세요!");
            }else{
            	$("#form").submit();
            }

		

		
 		
		
		})
		// 여기까지가 가입버튼을 눌렀을때
		
		
		
		
		
		
		
		
		
		$("#pwCheck").on("focus",function(){
			if($("#pw").val().length==0){
				alert("비밀번호 먼저 입력하세요");
				$("#pw").focus();
			} 
		})
		$("#pwCheck").on("focusOut",function(){
			if($("#pw").val() == $("#pwCheck").val()){
				alert("비밀번호가 일치합니다");
			}
		})
	
		
		
		
		//데이터피커 -----------------------------------------------------------
		 $("#birth").datepicker({
		  showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		  buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
		  buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
		  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  nextText: '다음 달', // next 아이콘의 툴팁.
		  prevText: '이전 달', // prev 아이콘의 툴팁.
		  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		  //stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		  closeText: '닫기',  // 닫기 버튼 패널
		  dateFormat: "yymmdd", // 텍스트 필드에 입력되는 날짜 형식.
		  showAnim: "slide", //애니메이션을 적용한다.
		  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		                    
		 });
		
		//----------------------------------------------------------------------------
		
		
		//데이터피커 이미지 지우기
		$("img.ui-datepicker-trigger").remove();
		
		
		
		
		 document.getElementById("search").onclick = searchAddress;
                
                function searchAddress() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraRoadAddr !== ''){
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('postcode').value = data.zonecode;
                            document.getElementById("Address1").value = roadAddr;
                        }
                    }).open();
                }
		
		
		
		
	</script>
	
	
	
</body>
</html>