<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>착한펀딩 프로젝트, weNeedYou</title>
<link href="/resources/css/index.css" rel="stylesheet"> <!-- css여기서 일괄관리 -->
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<div class="page-title">펀딩</div>
				<div class="fundingProduct">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			<div class="page-title">기부</div>
				<div class="donation-main">
					<div OnClick="location.href ='/donationHashtag.kh?donationCategory=pet'"><h1>#동물보호</h1></div>
					<div OnClick="location.href ='/donationHashtag.kh?donationCategory=child'"><h1>#아동보호</h1></div>
					<div OnClick="location.href ='/donationHashtag.kh?donationCategory=female'"><h1>#여성기부</h1></div>
					<div OnClick="location.href ='/donationHashtag.kh?donationCategory=help'"><h1>#불우이웃</h1></div>
					<div OnClick="location.href ='/donationHashtag.kh?donationCategory=old'"><h1>#노인기부</h1></div>
				</div>
			<div class="page-title">실시간 경매 진행 중!</div>
			<div class="auction-section">
				<div class="new-auction">
					<div class="section-title">새로 오픈된 경매</div>
					<a>
						<div class="newAuc-pic"></div>
						<div class="newAuc-info"></div>
					</a>
				</div>
				<div class="last-auction">
					<div class="section-title">마감임박!</div>	
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/resources/js/index.js"></script>
</body>
</html>