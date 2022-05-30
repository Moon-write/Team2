<%@page import="kr.or.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	Member m = (Member)session.getAttribute("m");
    %>
	    
<!-- 기본 CSS -->
<link rel="stylesheet" href="../../../resources/css/default.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/business/business.css" />
    
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- jstl -->

<!-- jQuery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
		<%if(m != null) {
			  switch(m.getMemberLevel()) {
				case 2: %>
				<a href="/mypageMain.kh" class="f-light fc-1">마이페이지</a>
				<%break;
				case 1: %>
				<a href="/business.kh" class="f-light fc-2">사업자 페이지로 이동</a>
				<%break;
				case 0: %>
				<a href="#" class="f-light fc-2">관리자 페이지로 이동</a>
				<%break;
				} %>
		<a href="/logout.kh">로그아웃</a>
		<%}else {%>
			<a href="/loginFrm.kh">로그인</a>
			<!-- 회원가입 /joinSelect.kh로 바꾸기(신영) -->
			<a href="/joinFrmMember.kh">회원가입</a>
		<%} %>
	</div>
	


</header>
<script>
	$("#bannerClose").on("click",function(){
		$(this).parent().slideUp();
	})
</script>