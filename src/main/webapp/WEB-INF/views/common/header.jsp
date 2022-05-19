<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	    
<!-- 기본 CSS -->
<link rel="stylesheet" href="../../../resources/css/default.css" />
<link rel="stylesheet" href="../../../resources/css/header_.css" />

    
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- jstl -->

<!-- jQuery -->
<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>

<!-- sweetalarm.js -->
<script src="../../../resources/js/sweetalert2.min.js"></script>


<!-- -- -- -- -- -- html 시작 -- -- -- -- --  -->
<div class="msg-banner">
	<span>메세지 전달용 배너</span>
	<span class="material-symbols-outlined" id="bannerClose">close</span>
</div>
<header>
	<div class="logo-wrap">
		<a href="/"><img src="../../../resources/img/logo/WNYlogo1.png"></a>
	</div>
	<div class="login-wrap">
		<a href="/loginFrm.kh">로그인</a>
		<a href="#">회원가입</a>
		<!-- 일반회원/사업자/관리자별로 header상단 버튼 변화(만드는중-신영) -->
			<li><a href="#" class="f-light fc-2">관리자 페이지로 이동</a></li>
			<li><a href="/business.kh" class="f-light fc-2">사업자 페이지로 이동</a></li>
			<li><a href="#" class="f-light fc-1">마이페이지</a></li>	
		<a href="/logout.kh">로그아웃</a>
	</div>
	<div class="menu-wrap">
		<ul>
			<li><a href="/fundingList.kh">펀딩</a>
				<ul class="sub-menu-wrap">
					<li><a href="#">소메뉴1</a></li>
					<li><a href="#">소메뉴2</a></li>
					<li><a href="#">소메뉴3</a></li>
				</ul>
			</li>
			<li><a href="/donationList.kh">기부</a></li>
			<li><a href="/groupList.kh">공동구매</a>
			</li>
			<li><a href="/auctionList.kh">경매</a></li>
			<li>
				<input type="text" id="site-search">
				<span class="material-symbols-outlined">search</span>
			</li>
		</ul>
	</div>


</header>
<script>
	$("#bannerClose").on("click",function(){
		$(this).parent().slideUp();
	})
</script>