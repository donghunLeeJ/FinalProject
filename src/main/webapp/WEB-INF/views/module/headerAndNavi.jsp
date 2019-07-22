<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.headerbtn {
	border: 0px solid #FCBB00;
	background-color: rgba(0, 0, 0, 0);
	color: white;
	padding: 5px;
	padding-top: 0px;
}

.headerbtn:hover {
	color: white;
}

#logout {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

#mypage {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 10%;
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

li:hover {
	color: #FCBB00;
}
</style>
<!-- Preloader -->
<div id="preloader">
	<div class="loader"></div>
</div>
<!-- /Preloader -->
<!-- Header Area Start -->
<header class="header-area" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return false">
	<!-- Top Header Area Start -->
	<div class="top-header-area" style="background-color: #FCBB00">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-5">
					<div class="top-header-content">
						<p>Welcome to hair salon!</p>
					</div>
				</div>
				<div class="col-7">
					<div class="top-header-content text-right">

						<c:choose>
							<c:when test="${id eq null}">

								<button id="LogIN" class="headerbtn">LogIN</button>
							</c:when>

							<c:otherwise>
								<input id="listid" type="hidden" value="${id.member_id}">
								<button id=mypage class="headerbtn">
									<img src="/img/button-img/m_iconM.png">
								</button>
								<button id=logout style="width: 8%;" class="headerbtn ">
									<img src="/img/button-img/logout-icon.png">
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Header Area End -->
	<!-- Main Header Start -->
	<div class="main-header-area " id="fixedNav">
		<div class="classy-nav-container breakpoint-off "
			style="border: 1px solid #FCBB00;">
			<div class="container">
				<!-- Classy Menu -->
				<nav class="classy-navbar justify-content-between  " id="akameNav"
					style="background-color: white">

					<!-- Logo -->
					<a class="nav-brand" href="/home"><img
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
								<li><a href="/home">Home</a></li>
								<li><a href="#">서비스 소개</a></li>
								<!--                         <li><a href="#">Pages</a> -->
								<!--                            <ul class="dropdown"> -->
								<!--                               <li><a href="/home">- Home</a></li> -->
								<!--                               <li><a href="./about.html">- About Us</a></li> -->
								<!--                               <li><a href="./service.html">- 서비스 소개</a></li> -->
								<!--                               <li><a href="shopboard/shopBoardGo?page=1">- 글 보기</a></li> -->
								<!--                               <li><a href="./blog.html">- sns</a></li> -->
								<!--                               <li><a href="/member/sellContentsGo">- 판매 내역 </a></li> -->
								<!--                               <li><a href="./contact.html">- Contact</a></li> -->
								<!--                               <li><a href="#">- Dropdown</a> -->
								<!--                                  <ul class="dropdown"> -->
								<!--                                     <li><a href="#">- Dropdown Item</a></li> -->
								<!--                                     <li><a href="#">- Dropdown Item</a></li> -->
								<!--                                     <li><a href="#">- Dropdown Item</a></li> -->
								<!--                                     <li><a href="#">- Dropdown Item</a></li> -->
								<!--                                  </ul></li> -->
								<!--                            </ul></li> -->
								<!--                         <li><a href="#">판매 / 구매</a> -->
								<!--                            <ul class="dropdown"> -->
								<li><a href="/member/myMsg">쪽지함</a></li>
								<li><a href="/shopboard/shopBoardGo?page=1">구매하기</a></li>
								<li><a href="/shopboard/ShopBoard_write">판매하기</a></li>
								<li><a href="/member/buyContentsGo">구매내역</a></li>
								<li><a href="/member/sellContentsGo">판매내역</a></li>
								<!--                            </ul> -->
								<!--                            </li> -->
								<li><a href="/timeline/accessTimeLine?seq=1">SNS</a></li>

							</ul>

							<!-- Cart Icon -->
							<div class="cart-icon ml-2 mt-4 mt-lg-0">
								<a id="list" href="#"><i class="icon_cart"></i></a>
							</div>

							<!-- Book Icon -->
							<!--                      <div class="book-now-btn ml-5 mt-4 mt-lg-0 ml-md-4"> -->
							<!--                         <a href="#" class="btn akame-btn">Book Now</a> -->
							<!--                      </div> -->
						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>

	<script>
      $("#list").on("click", function() {
         var listId = $("#listid").val();
         location.href = "/Basket/basketList?id=" + encodeURI(listId);
      })

      $(window).scroll(function() {

         var docScrollY = $(document).scrollTop()
         var barThis = $("#fixedNav")

         //          console.log(docScrollY);
         if (docScrollY > 200) {
            barThis.fadeIn();
            barThis.addClass("fixed-top");

         } else {
            barThis.removeClass("fixed-top");
         }

      });
   </script>


	<script>
      $("#LogIN").on("click", function() {
         location.href = "/member/loginForm";

      })

      $("#logout").on("click", function() {
         location.href = "/member/logOutProc";
      })

      $("#mypage").on("click", function() {

         location.href = "/member/myPage";

      })
   </script>


</header>