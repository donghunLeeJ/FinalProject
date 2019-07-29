<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>타임라인</title>
<style>
#optionbtn {
	width: 2em;
	height: 2em;
}
</style>
<link rel="icon" href="/img/core-img/logo4.png">
<link rel="stylesheet" href="/css/style2.css">
<style>
</style>
</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<!-- Preloader -->
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
	<!-- Header Area End -->


	<!-- Welcome Area Start -->


	<!-- About Area Start -->
	<section class="akame-about-area section-padding-80-0"> <!--        --------------------------------------------------------------------------------------------------- -->


	<div class="container " id="startSns">
		<div class="row mt-4">
			<div class="col-lg-6 border" style="margin: auto">
				<div class="row py-3">
					<div class="col-lg-2 text-center ">
						<img class="rounded-circle" alt="" src="${id.member_imgpath }">

					</div>

					<div class="col-lg-10 py-2 px-0 text-center">${id.member_id}님
						환영합니다<br> 새로운 글을 등록하여 모두 함께 글을 공유해 보세요 <br>
						<button id="writebtn" class="btn btn-primary">글쓰기</button>
						<script>
    					  $("#writebtn").on("click",function(){
         					$(location).attr("href", "/timeline/tl_boardWrite")
      					})
   						</script>

					</div>


				</div>

			</div>
		
		</div>
		<c:forEach var="i" items="${result}">
			<div class="row mt-4">
				<div class="col-lg-6 border" style="margin:auto;">
					<div class="row py-3">
						<div class="col-lg-2 text-center">
							<img class="rounded-circle" alt="" src="${i.tl_writer_profile }">
							${i.tl_writer }
						</div>

						<div class="col-lg-8 py-2 text-center">${i.tl_title }<input
								type="hidden" value="${i.tl_board_seq }">
						</div>
						<div class="col-lg-2 text-right">
							<button id="optionbtn" data-toggle="modal"
								data-target="#tlboardInfo${i.tl_board_seq }"
								style="background-color: white; border: none;">
								<i class="xi-bars"></i>
							</button>
						</div>

					</div>
					<div class="single-post-area">
						<div class="post-thumbnail" style="text-align: center">
							<img src="${i.tl_imgaddr}" alt="">
						</div>
						<div class="post-content">

							<div class="post-meta">
								<a class="post-date"><i class="icon_clock_alt">작성일</i>
									${i.tl_writedate}</a> 
							</div>
							<p>${i.tl_contents }</p>
							<hr>
							<div class="post-meta">
								<a id="replyShow${i.tl_board_seq }" class="post-date">댓글보기</a>
							</div>
							<input type="hidden" value="${i.tl_board_seq }"
								id="hiddenSeq${i.tl_board_seq }">
							<div id="reply_view${i.tl_board_seq }" style="display: none">
								<div id="forReply${i.tl_board_seq }"></div>
								<input id="replyInput${i.tl_board_seq }" type="text"
									name="tl_repl_contents" class="mb-3"
									style="width: 25em; border-radius: 4px;">
								<button type="button" id="replyBTN${i.tl_board_seq }"
									class="commentbtn btn btn-outline-success btn-sm ml-2 mb-2">댓글
									입력</button>
								
							</div>



						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="tlboardInfo${i.tl_board_seq }"
				tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body1">
							<form>
								<div class="form-group m-0 p-0">
									<div class="card">
										<div class="card-header">
											<i class="fa fa-user"></i><strong class="card-title pl-2">옵션
											</strong>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="card-body text-center">
											<div class="mx-auto d-block">
												<h5 class="text-center mt-2 mb-1">
													<b id="member_id"> </b>
												</h5>
											</div>
											<hr>
											<div class="card-text">
												<div>
													<a onclick="window.open('/timeline/reportProc?seq=${i.tl_board_seq }','','width=450px, height=600px , resizable=no')"><b
														style="color: red;">신고하기</b></a>
												</div>
												<div>
													<a
														href="/timeline/boardModify?tl_board_seq=${i.tl_board_seq }"><b>글
															수정 </b></a>
												</div>
												<div>
													<a
														href="/timeline/boardDelete?seq=${i.tl_board_seq }&writer=${i.tl_writer}"><b>글
															삭제</b></a>
												</div>
												<div>
														<a onclick="window.open('/timeline/message?seq=${i.tl_board_seq }&writer=${i.tl_writer}','','width=470px, height=800px , resizable=no')">
														<b>쪽지보내기</b></a>
													<p id="tl_board"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
			<script>
			
			
			$("#replyShow${i.tl_board_seq }").on("click",function(){
				
				var seq = $("#hiddenSeq${i.tl_board_seq }").val();	
				 if ( $("#reply_view${i.tl_board_seq }").css("display") == "none" ){
					 $("#reply_view${i.tl_board_seq }").css("display","block");	
						
					
						$.ajax({
	                     url : "/timeline/ajaxProcReple",
	                     type : "post",
	                     data : {
	                    	 seq : seq
	                     }
	                  }).done(function(resp) {
	                	
	                	  var result = JSON.parse(resp);
	                	  console.log(result);
	                	  for(var i = 0 ; i < result.length ; i ++){
	                		  var writer = result[i].tl_repl_writer;
	                		  var writerList = writer.split('@');
	                		  $("#forReply${i.tl_board_seq }").append("<div><strong>"+writerList[0]+"&nbsp;&nbsp;</strong>"+result[i].tl_repl_contents+"<img onclick=repleDelete("+result[i].tl_repl_seq+") id=reple"+result[i].tl_repl_seq+" style='width:10px' src='/img/delte.png'><div>");
	                	  }
	                	 
	                  })
				}else if($("#reply_view${i.tl_board_seq }").css("display") == "block"){
					 $("#reply_view${i.tl_board_seq }").css("display","none");	
					 $("#forReply${i.tl_board_seq }").html("");
				
				 }
			})
			$("#replyBTN${i.tl_board_seq }").on("click",function(){
				
				var emp = /^\s*$/g;
				var reply = $("#replyInput${i.tl_board_seq }").val();
				var seq = $("#hiddenSeq${i.tl_board_seq }").val();
				if($("#replyInput${i.tl_board_seq }").val()=="" || emp.test($("#replyInput${i.tl_board_seq }").val())){
					alert("댓글을 입력해주세요");
					}else{
				$.ajax({
                     url : "/timeline/replyAjaxProc",
                     type : "post",
                     data : {
                        page : reply,
                        seq : seq
                     }
                  }).done(function(resp) {
                	  var result = resp;
                	  var result2 = result.split(':');
                	  $("#forReply${i.tl_board_seq }").append("<div><strong>"+result2[0]+"&nbsp;&nbsp;</strong>"+result2[1]+"<div>");
                	  console.log(resp);
                	  $("#replyInput${i.tl_board_seq }").val("");
                  })
					}
			});
			
		</script>
		</c:forEach>
	</div>

	<div class="row mt-4"></div>
	</section>


	<script>

     
	var repleDelete = function(seq){
		location.href = "/timeline/replyDelete?seq="+seq;
	}
	
	
	var count = 2;
      $(window).scroll(
            function() {
               // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
               // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
                  if($(document).height() <= $(window).scrollTop() + $(window).height() ){
                  // 최하단으로 도달했을 경우
                  $.ajax({
                     url : "/timeline/ajaxProc",
                     type : "post",
                     data : {
                        page : count
                     }
                  }).done(function(resp) {
                     count++
                     var result = JSON.parse(resp);
                  
                     console.log(result);
                     for(var i = 0 ; i < result.length ; i ++){

                    	 
                     $("#startSns").append(`<div class="row mt-4">
				<div class='col-lg-6 border' style='margin: auto'>
					<div class='row py-3'>
						<div class='col-lg-2 text-center'>
							<img class='rounded-circle' alt='' src='`+result[i].tl_writer_profile+`'>
								`+result[i].tl_writer+`
						</div>

						<div class='col-lg-8 py-2 text-center'>`+result[i].tl_title+`<input
								type='hidden' value='`+result[i].tl_board_seq+`'>
						</div>
						<div class='col-lg-2 text-right'>
							<button id='optionbtn' data-toggle='modal'
								data-target='#tlboardInfo`+result[i].tl_board_seq+`'
								style='background-color: white; border: none;'>
								<i class='xi-bars'></i>
							</button>
						</div>

					</div>
					<div class='single-post-area'>
						<div class='post-thumbnail' style='text-align: center'>
							<img src='`+result[i].tl_imgaddr+`' alt=''>
						</div>
						<div class='post-content'>

							<div class='post-meta'>
								<a  class='post-date'><i class='icon_clock_alt'>작성일</i>
								`+result[i].tl_writedate+`</a> 
							</div>
							<p>${i.tl_contents }</p>
							<hr>
							<div class='post-meta'>
								<a id='replyShow`+result[i].tl_board_seq+`' class='post-date'>댓글보기</a>
							</div>
							<input type='hidden' value='`+result[i].tl_board_seq+`'
								id='hiddenSeq`+result[i].tl_board_seq+`'>
							<div id='reply_view`+result[i].tl_board_seq+`' style='display: none'>
								<div id='forReply`+result[i].tl_board_seq+`'></div>
								<input id='replyInput`+result[i].tl_board_seq+`' type='text'
									name='tl_repl_contents' class='mb-3'
									style='width: 25em; border-radius: 4px;'>
								<button type='button' id='replyBTN`+result[i].tl_board_seq+`'
									class='commentbtn btn btn-outline-success btn-sm ml-2 mb-2'>댓글
									입력</button>

							</div>



						</div>
					</div>
				</div>
			</div>

			<div class='modal fade' id='tlboardInfo`+result[i].tl_board_seq+`'
				tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel1'
				aria-hidden='true'>
				<div class='modal-dialog' role='document'>
					<div class='modal-content'>
						<div class='modal-body1'>
							<form>
								<div class='form-group m-0 p-0'>
									<div class='card'>
										<div class='card-header'>
											<i class='fa fa-user'></i><strong class='card-title pl-2'>옵션
											</strong>
											<button type='button' class='close' data-dismiss='modal'
												aria-label='Close'>
												<span aria-hidden='true'>&times;</span>
											</button>
										</div>
										<div class='card-body text-center'>
											<div class='mx-auto d-block'>
												<h5 class='text-center mt-2 mb-1'>
													<b id='member_id'> </b>
												</h5>
											</div>
											<hr>
											<div class='card-text'>
												<div>
													<a onclick="window.open('/timeline/reportProc?seq=`+result[i].tl_board_seq+`','','width=450px, height=600px , resizable=no')" ><b
														style='color: red;'>신고하기</b></a>
												</div>
												<div>
													<a
														href='/timeline/boardModify?seq=`+result[i].tl_board_seq+`'><b>글
															수정 </b></a>
												</div>
												<div>
													<a
														href='/timeline/boardDelete?seq=`+result[i].tl_board_seq+`&writer=`+result[i].tl_writer+`'><b>글
															삭제</b></a>
												</div>
												<div>
												<a onclick="window.open('/timeline/message?seq=`+result[i].tl_board_seq+`&writer=`+result[i].tl_writer+`','','width=470px, height=800px , resizable=no')">	
												<b>쪽지보내기</b></a>
													<p id='tl_board'></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class='modal-footer'>
									<button type='button' class='btn btn-secondary'
										data-dismiss='modal'>닫기</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
			<script>
			
			$('#replyShow`+result[i].tl_board_seq+`').on('click',function(){
				var seq = $('#hiddenSeq`+result[i].tl_board_seq+`').val();	
				 if ( $('#reply_view`+result[i].tl_board_seq+`').css('display') == 'none' ){
					 $('#reply_view`+result[i].tl_board_seq+`').css('display','block');	

						$.ajax({
	                     url : '/timeline/ajaxProcReple',
	                     type : 'post',
	                     data : {
	                    	 seq : seq
	                     }
	                  }).done(function(resp) {
	                	  var result1 = JSON.parse(resp);
	                	 
	                	  for(var i = 0 ; i < result1.length ; i ++){
	                		  var writer =  result1[i].tl_repl_writer;
	                		 	var writerList = writer.split('@');
	                		  $('#forReply`+result[i].tl_board_seq+`').append('<div><strong>'+writerList[0]+'&nbsp;&nbsp;</strong>'+result1[i].tl_repl_contents+'<img src=/img/delte.png style=width:10px onclick=repleDelete('+result1[i].tl_repl_seq+') id=repleDelete'+result1[i].tl_repl_seq+'> </div>');
	                	  }
	                  })
				}else if($('#reply_view`+result[i].tl_board_seq+`').css('display') == 'block'){
					 $('#reply_view`+result[i].tl_board_seq+`').css('display','none');	
					 $('#forReply`+result[i].tl_board_seq+`').html('');
				
				 }
			})
			$('#replyBTN`+result[i].tl_board_seq+`').on('click',function(){
				var emp = /^\s*$/g;
				var reply = $('#replyInput`+result[i].tl_board_seq+`').val();
				var seq = $('#hiddenSeq`+result[i].tl_board_seq+`').val();
				if(reply=="" || emp.test(reply)){
					alert("댓글을 입력해주세요");
					}else{
				$.ajax({
                     url : '/timeline/replyAjaxProc',
                     type : 'post',
                     data : {
                        page : reply,
                        seq : seq
                     }
                  }).done(function(resp) {
                	  var result1 = resp;
                	  var result1List = resp.split(":");
                	  $('#forReply`+result[i].tl_board_seq+`').append('<div><strong>'+result1List[0]+'&nbsp;&nbsp;</strong>'+result1List[1]+'</div>');
                	  console.log(resp);
                	  $('#replyInput`+result[i].tl_board_seq+`').val('');
                  })
			}
			})`)
                     }
                  
                     })

                  
                  console.log('바닥입니다!');
               } else if ($(window).scrollTop() == 0) {
                  // 최상단으로 도달했을 경우
                  console.log('꼭대기입니다!');
               }
            });
      
   </script>



	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>