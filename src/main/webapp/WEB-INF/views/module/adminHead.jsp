<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	.headerbtn{
		border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            
	}
	
	.headerbtn:hover{
		color:white;
            background-color: skyblue;
	}
	#logout{
	border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
	}
	
	#mypage{
	border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
	}


</style>
<!-- Preloader -->
<div id="preloader">
	<div class="loader"></div>
</div>
<!-- /Preloader -->
<!-- Header Area Start -->
<header class="header-area" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<!-- Top Header Area Start -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-5">
					<div class="top-header-content">
						<p>관리자 페이지 입니다</p>
					</div>
				</div>
				<div class="col-7">
					<div class="top-header-content text-right">

						<c:choose>
							<c:when test="${id eq null}">

								<button  id="LogIN" class="headerbtn">LogIN</button>
							</c:when>

							<c:otherwise>
								<button id=logout class="headerbtn">logout</button>
								<button id=mypage  class="headerbtn"></button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Header Area End -->
	<!-- Main Header Start -->
	<div class="main-header-area">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Classy Menu -->
				<nav class="classy-navbar justify-content-between" id="akameNav">

					<!-- Logo -->
					<a class="nav-brand" href="index.html"><img
						src="/img/core-img/logo.png" alt=""></a>
					<!-- Navbar Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">
						<!-- Menu Close Button -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>
						<!-- Nav Start -->
						<div class="classynav">
							<ul id="nav">
								<li ><a href="./index.html">Home</a></li>
								<li><a href="#">회원 관리 </a>
								<li><a href="/home/ee">판매 글 관리</a></li>
								<li><a href="/home/ee">게시판 관리</a></li>
								<li><a href="#">결제 통계</a>
								<li><a href="/timeline/accessTimeLine?seq=1">sns</a></li>
							</ul>
							<!-- Cart Icon -->
							<div class="cart-icon ml-5 mt-4 mt-lg-0">
								<a href="#"><i class="icon_cart"></i></a>
							</div>

							<!-- Book Icon -->
							<div class="book-now-btn ml-5 mt-4 mt-lg-0 ml-md-4">
								<a href="#" class="btn akame-btn">Book Now</a>
							</div>
						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>






	<script>

		$("#LogIN").on("click",function(){
			location.href="/member/loginForm";
			
		})
	
		$("#logout").on("click",function(){
			location.href="/member/logOutProc";
		})
		
		$("#mypage").on("click",function(){

			location.href="/member/myPage";

		})
	</script>

</header>