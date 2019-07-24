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
h5 {
	display: inline;
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
	padding: 5px;
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
</style>
<script type="text/javascript" src="/js/cross.js"></script>
<!-- 지우지 말 것 -->
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<section class="why-choose-us-area bg-gray pt-3">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<div class="container">
		<div class="row my-2">
			<div class="col-lg-12 order-lg-2">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a href="/timeline/messageList"  class="nav-link ">보낸 쪽지함</a></li>
					<li class="nav-item"><a href="/timeline/getMessagePage"  class="nav-link active">받은 쪽지함</a></li>
				</ul>
				<div class="tab-content py-4 ">
					<div class="tab-pane active" id="edit">
						<div class="container">
							<div class="row border-bottom  mt-5 pb-1 border-warning">
								<div class="col-12">
									<h4 style="font-family :'나눔고딕OTF';>받은 쪽지함</h4>

								</div>
							</div>
							<div
								class="row border-top border-bottom border-warning text-center py-1">
								
								<div class="col-3">보낸 사람</div>
								<div class="col-2">받는 이</div>
								<div class="col-2">받은 날짜</div>
								<div class="col-3">내용</div>
								<div class="col-2"></div>
							</div>

							<div class="row text-center border-bottom border-warning py-1">
							
							
								<c:forEach var="i" items="${getter }">
									<div class="col-3 skip" style="margin-top: 0em">
										${i.message_sender }</div>
									<div class="col-2 " style="margin-top: 0em">
										${i.message_getter }</div>
									<div class="col-2 " style="margin-top: 0em">
										${i.message_time }</div>
									<div class="col-3 " style="margin-top: 0em;">
										${i.message_contents }</div>
									<div class="col-2 " style="margin-top: 0em;">
										<button id="btn${i.message_seq }">답장</button>
										<button id="delete${i.message_seq }">삭제</button>
									</div>

									<script>
										$("#btn${i.message_seq }").on("click",function() {window.open("/timeline/reply?id=${i.message_sender }",
												"",
												"width=470px, height=800px , resizable=no");
														})
														$("#delete${i.message_seq}").on("click",function(){
															
															location.href="/timeline/messageDelete?seq=${i.message_seq}";
														})
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$("#goHome").on("click", function() {
			location.href = "/home";
		})
	</script>

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>

