<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	    
<!-- 기본 CSS -->
<link rel="stylesheet" href="../../../resources/css/default.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
    
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- jQuery -->
<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>

<!-- sweetalarm.js -->
<script src="../../../resources/js/sweetalert.min.js"></script>
<script src="../../../resources/js/sweetalert2.all.min.js"></script>

<!-- 메뉴 효과 css -->
<link rel="stylesheet" href="../../../resources/css/common/component.css" />
<link rel="stylesheet" href="../../../resources/css/common/demo.css" />
<link rel="stylesheet" href="../../../resources/css/common/normalize.css" />

<!-- 메뉴 효과 js -->
<script src="../../../resources/js/common/modernizr.custom.js"></script>
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
		<c:choose>
			<c:when test="${not empty sessionScope.m}">
				<c:choose>
					  <c:when test="${sessionScope.m.memberLevel eq 2}">
						<a href="/orderList.kh?reqPage=1&memberNo=${sessionScope.m.memberNo}" class="f-light fc-1">마이페이지</a>
					  </c:when>
					  <c:when test="${sessionScope.m.memberLevel eq 1}">
						<a href="/business.kh" class="f-light fc-2">사업자 페이지로 이동</a>
					  </c:when>
					  <c:when test="${sessionScope.m.memberLevel eq 0}">
						<a href="/selectMemberList.kh?memberLevel=2&reqPage=1" class="f-light fc-2">관리자 페이지로 이동</a>
					  </c:when>
				</c:choose>
			<a href="/logout.kh">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="/loginFrm.kh">로그인</a>
				<a href="/joinSelect.kh">회원가입</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="menu-wrap cl-effect-5" id="cl-effect-5">
		<ul>
			<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory="><span data-hover="펀딩">펀딩</span></a>
				<ul class="sub-menu-wrap cl-effect-1" id="cl-effect-1">
					<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory=테크가전">테크·가전</a></li>
					<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory=패션잡화">패션·잡화</a></li>
					<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory=홈리빙">홈·리빙</a></li>
					<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory=식품">식품</a></li>
					<li><a href="/fundingList.kh?selectedInquire=1&fundingCategory=뷰티">뷰티</a></li>
				</ul>
			</li>
			<li><a href="/donationList.kh"><span data-hover="기부">기부</span></a></li>
			<li><a href="/auctionList.kh?startFlag=0&endFlag=0&searchKeyword=&order=1&reqPage=1"><span data-hover="경매">경매</span></a></li>
			<li>
				<form action="/searchProject.kh" style="margin-top: 5px">
					<input type="text" name="keyword" id="site-search" autocomplete='off'>
					<span class="material-symbols-outlined" id="searchBtn">search</span>
					<div class="popKeyArea">
						<div style="text-align: center;margin-top:5px;padding-bottom:5px;background-color:rgb(30,144,255);color:white;">인기검색어</div>
						<fieldset class="keywordList">
							<div id="rankNo" style="float: left;text-align: center;">
								<div>1</div>
								<div>2</div>
								<div>3</div>
								<div>4</div>
								<div>5</div>
								<div>6</div>
								<div>7</div>
								<div>8</div>
								<div>9</div>
								<div>10</div>
							</div>
							<div id="keyword" style="float: left;margin-left: 10px;"></div>
						</fieldset>
						<a href="#" id="closePopKey">닫기</a>
					</div>									
				</form>
			</li>
		</ul>
	</div>
</header>
<%@include file="/WEB-INF/views/auction/msg.jsp" %>
<script>
	$("#bannerClose").on("click",function(){
		$(this).parent().slideUp();
	})
	$("#searchBtn").on("click",function(){
		location.href="/searchProject.kh?keyword="+$("#site-search").val();
	})
	$("#site-search").on("click",function(){
		const pk=$(".popKeyArea");
		pk.css("display","block");
	})
	
	window.onload=popKey();
	
	
	function popKey(){
		$.ajax({
			url: "/popKey.kh",
			type:"get",
			success:function(list){		
				for(let i=0;i<list.length;i++){
					const keyword=$("#keyword");
					const div=$("<div>");
					const a=$("<a class=\"searchKeyword\" href=\"#\" style=\"color:black;display: inline-block;height:20px;max-width: 90px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;vertical-align: top;\">");
					a.append(list[i]);
					div.append(a);
					keyword.append(div);
				}
			}			
		});			
	}
	$("#closePopKey").on("click",function(){
		const pk=$(".popKeyArea");
		pk.css("display","none");
	})
	$(document).on("click", ".searchKeyword",function(){
		const keyword=$(this).text();
		location.href="/searchProject.kh?keyword="+keyword;
	})
</script>