<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<style>
h5{
display:inline;
}
.float {
	float: left;
}

.over {
	overflow: hidden;
	box-sizing: border-box;
}

.skip {
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	width: 100%;
	overflow: hidden;
}

#findAdd {
	padding: 2px;
	width: 45px;
	height: 45px;
}

#myinfo {
	width: 260px;
	height: 260px;
}

.no {
	padding: 0px;
	margin: 0px;
}

#area {
	width: 100%;
	height: 100px;
}
/*    div{     */
/*     border:1px solid black;     */
/*    }     */
#delId {
	text-align: center;
}

hr {
	margin: 5px;
}

.center {
	text-align: center;
}

.listimg {
	width: 8em;
	height: 6em;
}

#sellTitle {
	hirght: 80px;
}

.mypage_btn1 {
	width: 5em;
	height: 2em;
	background-color: white;
	border: 1px solid black;
	margin-bottom: 0.1em;
	cursor: pointer;
}

.mypage_btn2 {
	width: 5em;
	height: 2em;
	background-color: white;
	border: 1px solid black;
	margin-top: 0.1em;
	cursor: pointer;
}

select {
	color: red;
}

.btn {
	border: 1px solid gray;
	transition-duration: 1s;
	cursor: pointer;
	color: white;
	background-color: #FCBB00;
}

.btn:hover {
	background-color: white;
	border: 1px solid #FCBB00;
	color: black;
}

.form-control[readonly] {
	background-color: white;
}
/* div{ */
/* border: 1px solid black; */
/* } */
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>


	<div class="container">
		<div class="row my-2">
			<div class="col-lg-12 order-lg-2">
				<ul class="nav nav-tabs">
<!-- 					<li class="nav-item"><a href="" data-target="#profile" -->
<!-- 						data-toggle="tab" class="nav-link active">나의 정보</a></li> -->

					<li class="nav-item"><a href="" data-target="#profile"
						data-toggle="tab" class="nav-link active">나의 정보</a></li>
					<li class="nav-item"><a href="" data-target="#delId"
						data-toggle="tab" class="nav-link">회원 탈퇴</a></li>
				</ul>
				<div class="tab-content col-lg-12 py-4 ">
<!-- 					<div class="tab-pane active" id="profile" > -->
<!-- 						<div class="row" style="position: relative; left: 7em" > --> 
<!-- 							<div class="order-lg-1 col-lg-4 float text-center"> -->
<%-- 								<img src="${id.member_imgpath }" class="mx-auto img-circle" id=myinfo alt="avatar"> --%>
<!-- 							</div> -->
<!-- 							<div class="col-lg-8 float"> -->
<!-- 								<div class="float col-lg-12 col-mf-12"> -->
<!-- 									<div class=" form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">아이디</label> -->
<!-- 										<div class=" col-lg-9"> -->
<%-- 											<div class=" form-control" type="text">${id.member_id } --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">이름</label> -->
<!-- 										<div class="col-lg-9"> -->
<%-- 											<div class="form-control" type="text">${id.member_name } --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">생일</label> -->
<!-- 										<div class="col-lg-9"> -->
<%-- 											<div class="form-control" type="text">${id.member_birth}</div> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">핸드폰 -->
<!-- 											번호</label> -->
<!-- 										<div class="col-lg-9"> -->
<%-- 											<div class="form-control" type="text">${id.member_phone}</div> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">기본 -->
<!-- 											주소</label> -->
<!-- 										<div class="col-lg-9"> -->
<%-- 											<div class="form-control" type="text">${id.member_address1 }</div> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-lg-3 col-form-label form-control-label">상세 -->
<!-- 											주소</label> -->
<!-- 										<div class="col-lg-9"> -->
<%-- 											<div class="form-control" type="text">${id.member_address2 }</div> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 					</div> --> 
					
<!-- 					</div> -->



					<div class="tab-pane active col-lg-12" id="profile">
						<div id="preview" class="col-lg-4 order-lg-1 text-center float">
							<form id=mypage_Img action="/member/uploadImg" method="post" enctype="multipart/form-data">
								<div><img src="${id.member_imgpath }" width="280px" height="200px" class="mx-auto img-circle"alt="avatar"></div><br>
								 <input type=file id="file" name="file" accept=".gif, .jpg, .png, .jpeg" onchange="checkFile(this)">
								<input type="button" id="change" class="btn btn-success "name="my_images" value="사진 변경">
								 <input type="submit" id="uploadImg" class="btn btn-success " value="사진 업로드">
							</form>
						</div>

						<div class="float col-lg-8">
							<form id="edit_mypage" action="/member/edit_mypage" method="post">
								<div class="form-group row">

									<label class="col-lg-3 col-form-label form-control-label">아이디(수정
										불가)</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="member_id"
											value="${id.member_id }" readonly>

									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">이름(수정
										불가)</label>
									<div class="col-lg-9">
										<input class="form-control" name="member_name" type="text"
											value="${id.member_name }" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">생일(수정
										불가)</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="member_birth"
											value="${id.member_birth}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">성별(수정
										불가)</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="member_gender"
											value="${id.member_gender }" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">우편번호
<!-- 										                            <button type="button" onclick="sample4_execDaumPostcode()" -->
<!-- 										                           class="btn btn-success p-1"data-aria-haspopup="true"aria-expanded="false" id="findAdd">변경</button>       -->
										<img src="/img/core-img/find_addr.png"onclick="sample4_execDaumPostcode()"class="mx-auto img-circle" data-aria-haspopup="true"
										aria-expanded="false" id="findAdd">
									</label>
									<div class="col-lg-9">
										<input class="form-control " id="postcode"
											name="member_postcode" type="text"
											value="${id.member_postcode}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">도로명
										주소 </label>
									<div class="col-lg-9">
										<input class="form-control " id="add1" name="member_address1"
											type="text" value="${id.member_address1}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">상세주소
									</label>
									<div class="col-lg-9">
										<input class="form-control" id="add2" name="member_address2"
											 type="text"
											value="${id.member_address2}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">핸드폰
										번호</label>
									<div class="col-lg-9">
										<input class="form-control" id="phone" name="member_phone"
											type="text" value="${id.member_phone}"
											placeholder=" '-'를 제외하고 입력해주세요">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">자기소개</label>
									<div class="col-lg-9" id="introdiv">
										<textarea style="resize: none;" id=area name="member_intro">${id.member_intro}</textarea>
									</div>
<%-- 									<input name="member_intro" type="hidden"> <div class=" ">${id.member_intro}</div> --%>
								</div>

								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">비밀번호</label>
									<div class="col-lg-9">
										<input class="form-control" type="password" name="member_pw"
											id="pw1" placeholder="대/소문자, 숫자 포함 최소 8자리">

									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">비밀번호
										확인</label>
									<div class="col-lg-9">

										<input class="form-control" type="password" id="pw2"
											placeholder="대/소문자, 숫자 포함 최소 8자리">

									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label"></label>
									<div class="col-lg-9"><input type="reset" class="btn btn-secondary" value="초기화">
										<input type="button" id="edit_info" class="btn btn-success" value="정보 수정"> 
										<input type="button" id="goHome" class="btn btn-success" value="홈으로">
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<div class="tab-pane" id="delId">
						<h1 style="font-family :'나눔고딕OTF';" class="my-5">그동안 저희 사이트를 이용해 주셔서 감사합니다</h1>
						<p>
						<h3 style="font-family :'나눔고딕OTF';" class="my-5">본인확인을 위해 정보를 입력해주세요</h3>
						<form id="delform" action="/member/delOK">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">아이디</label>
								<div class="col-lg-6">
									<input class="form-control" id="del_id" name="del_id"
										type="text">
								</div>
							</div>
							<P>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">비밀번호</label>
								<div class="col-lg-6">
									<input class="form-control" id="del_pw" name="del_pw"
										type="password">
								</div>
								<p>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">비밀번호
									확인</label>
								<div class="col-lg-6">
									<input class="form-control" id="del_pw2" type="password">
								</div>
							</div>
						</form>
						<p>
							<input type="button" id="delOK" class="btn btn-success"
								value="회원탈퇴">
					</div>


				</div>
			</div>
		</div>
	</div>


	<script>
$("#uploadImg").hide();	
	
	$("#area").on("input",function(){
	if ($("#area").val().length > 100) {
		alert("자기소개 제한 글자를 초과하였습니다");
	}
	});
	
	
	
		$("#goHome").on("click", function() {
			location.href = "/home";
		})

		//-----------------------------회원탈퇴
		$("#delOK").on("click", function() {
			if ($("#del_id").val() == "") {
				alert("아이디를 입력해주세요");
			} else if ($("#del_pw").val() == "") {
				alert("비밀번호를 입력해주세요");
			} else if ($("#del_pw2").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
			} else if ($("#del_pw").val() != $("#del_pw2").val()) {
				alert("비밀번호가 일치하지 않습니다");
			} else {
				var result = confirm("정말 탈퇴하시겠습니까?");
				if (result) {
					removeXSS($("#del_id").val(), $("#del_id").attr("id"));
					removeXSS($("#del_pw").val(), $("#del_pw").attr("id"));
					removeXSS($("#del_pw2").val(), $("#del_pw2").attr("id"));
					$("#delform").submit();
				} else
					return;
			}
		});
		//-----------------------------회원탈퇴 끝

		$("#file").hide();
		//---------------------------------------------- 정보수정 이미지 변경 확장자 제한
		function checkFile(f) {

			// files 로 해당 파일 정보 얻기.
			var file = f.files;

			// file[0].name 은 파일명 입니다.
			// 정규식으로 확장자 체크

			if (!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
				alert('gif, jpg, png, jpeg 파일만 선택해 주세요.\n\n현재 파일 : '
						+ file[0].name);
				$("#imgInput").val("");
			}
			// 체크를 통과했다면 종료.
			else
				return;

			// 체크에 걸리면 선택된  내용 취소 처리를 해야함.
			// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
			// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
			// 이렇게 하면 간단 !?
			f.outerHTML = f.outerHTML;
		}

		$("#change").on("click", function() {
			$("#file").click();//사진변경 버튼 누르면 file버튼 클릭됨
		});

		$("#file").on("change", function() {
			file = $("#file").prop("files")[0];
			ImgURL = window.URL.createObjectURL(file);
			$("#preview img").attr('src', ImgURL);
			$("#preview").show();
			$("#uploadImg").show();	
		});

		$("#edit_info").on("click", function() {//정보수정 버튼 클릭시

			 var regnum = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/g;
			var regPw2 = /(\w)\1\1/g;

			if ($("#postcode").val() == "") {
				alert("주소를 입력하세요");
				$("#findAdd").click();
			} else if ($("#phone").val() == "") {
				alert("핸드폰 번호를 입력하세요");
				$("#phone").focus();
			} else if (!regnum.test($("#phone").val())) {
				alert("핸드폰 번호가 형식에 맞지 않습니다");
				$("#phone").focus();
				$("#phone").focus("");
			} else if ($("#area").val() == "") {
				alert("자기소개를 입력해주세요");
				$("#area").focus();

			}  else if ($("#pw1").val() == "") {

				alert("비밀번호를 입력해주세요");
				$("#pw1").focus();
			} else if (!regPw.test($("#pw1").val())) {
				alert("비밀번호 형식에 맞지 않습니다");
				$("#pw1").focus();
				$("#pw1").focus("");
			} else if (regPw2.test($("#pw1").val())) {
				alert('연속으로 같은 문자를 3번 이상 사용하실 수 없습니다.');
				$("#pw1").focus();
				$("#pw1").focus("");
			} else if ($("#pw2").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#pw2").focus();
			} else if ($("#pw1").val() != $("#pw2").val()) {
				alert("비밀번호가 같아야 합니다");
				$("#pw2").focus();
				$("#pw2").val("");
			} else if ($("#add2").val() == "") {
				var result = confirm("상세주소가 없습니다.\n변경하시겠습니까?");
				if (result)
					$("#edit_mypage").submit();
				else
					$("#add2").focus();
			} else {//정보수정을 완벽히 입력했다면
				removeXSS($("#postcode").val(), $("#postcode").attr("id"));
				removeXSS($("#add1").val(), $("#add1").attr("id"));
				removeXSS($("#add2").val(), $("#add2").attr("id"));
				removeXSS($("#phone").val(), $("#phone").attr("id"));
				removeXSS($("#area").val(), $("#area").attr("id"));
				removeXSS($("#pw1").val(), $("#pw1").attr("id"));
				removeXSS($("#pw2").val(), $("#pw2").attr("id"));
				$("#edit_mypage").submit();
			}

		});

		$(".del_list2").hide();

		$(".del_list").on("click", function() {
			alert("삭제 요청되었습니다");
			$(".del_list").hide();
			$(".del_list2").show();
		})
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	<!--주소등록-->
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("add1").value = roadAddr;
					//                                              document
					//                                                    .getElementById("add2").value = data.jibunAddress;
					document.getElementById("add2").value = "";//도로명만 받기

				}
			}).open();
		}
		$("#myModal").modal('show').css({
			'margin-top' : function() {
				return -($(this).height() / 2);
			},
			' margin-left' : function() {
				return -($(this).width() / 2);
			}
		})
	</script>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>


