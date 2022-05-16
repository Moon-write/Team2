<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<a href="#">로그인</a>
		<a href="#">회원가입</a>
		<a href="#">관리자 페이지로 이동</a>
		<a href="#">사업자 페이지로 이동</a>
		<a href="#">마이페이지</a>
		<a href="#">로그아웃</a>
	</div>
	<div class="menu-wrap">
		<ul>
			<li><a href="#">펀 딩</a>
				<ul class="sub-menu-wrap">
					<li><a href="#">소메뉴1</a></li>
					<li><a href="#">소메뉴2</a></li>
					<li><a href="#">소메뉴3</a></li>
				</ul>
			</li>
			<li><a href="#">기 부</a></li>
			<li><a href="#">공 동 구 매</a>
				<ul class="sub-menu-wrap">
					<li><a href="#">소멘뉴1</a></li>
					<li><a href="#">소멘뉴2</a></li>
					<li><a href="#">소멘뉴3</a></li>
				</ul>
			</li>
			<li><a href="#">경 매</a></li>
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