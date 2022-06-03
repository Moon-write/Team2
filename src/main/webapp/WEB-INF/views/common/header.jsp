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
						<a href="/mypageMain.kh" class="f-light fc-1">마이페이지</a>
					  </c:when>
					  <c:when test="${sessionScope.m.memberLevel eq 1}">
						<a href="/business.kh" class="f-light fc-2">사업자 페이지로 이동</a>
					  </c:when>
					  <c:when test="${sessionScope.m.memberLevel eq 0}">
						<a href="/admin.kh" class="f-light fc-2">관리자 페이지로 이동</a>
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
	<div class="menu-wrap">
		<ul>
			<li><a href="/fundingAllList.kh">펀딩</a>
				<ul class="sub-menu-wrap">
					<li><a href="/fundingTechList.kh">테크·가전</a></li>
					<li><a href="/fundingFashionList.kh">패션·잡화</a></li>
					<li><a href="/fundingHomeList.kh">홈·리빙</a></li>
					<li><a href="/fundingFoodList.kh">식품</a></li>
					<li><a href="/fundingBeautyList">뷰티</a></li>
				</ul>
			</li>
			<li><a href="/donationList.kh">기부</a></li>
			<li><a href="/groupList.kh">공동구매</a>
			</li>
			<li><a href="/auctionList.kh?startFlag=0&endFlag=0&searchKeyword=&order=1&reqPage=1">경매</a></li>
			<li>
				<form action="/searchProject.kh" style="margin-top:10px;">
					<input type="text" name="keyword" id="site-search" autocomplete='off'>
					<span class="material-symbols-outlined" id="searchBtn">search</span>
					<div class="popKeyArea">
						<div style="text-align: center;margin-top:5px;padding-bottom:5px;">인기검색어</div>
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
		const keyword=$("#keyword");
		keyword.empty();
		popKey();
	})
	function popKey(){
		$.ajax({
			url: "/popKey.kh",
			type:"get",
			success:function(list){		
				for(let i=0;i<list.length;i++){
					const keyword=$("#keyword");
					const div=$("<div>");
					const a=$("<a class=\"searchKeyword\" href=\"#\" style=\"color:black\">");
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