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
					<div class="hover" OnClick="location.href ='/fundingDetailStory.kh?fundingNo=170'">
						<div class="img-wrap"><img src="/resources/upload/funding/techimg0.png"></div>
						<div><span class="funding-span">[프리미엄 강철팬] 무쇠팬에 코팅을 더하다! 건강한 요리를 시작하세요!</span></div>
					</div>
					<div class="hover" OnClick="location.href ='/fundingDetailStory.kh?fundingNo=171'">
						<div class="img-wrap"><img src="/resources/upload/funding/fashionimg1.png"></div>
						<div><span class="funding-span">슬리퍼에 러닝화의 최신 기술을 담다, 프리워터스 CLOUD9</span></div>
					</div>
					<div class="hover" OnClick="location.href ='/fundingDetailStory.kh?fundingNo=174'">
						<div class="img-wrap"><img src="/resources/upload/funding/homeimg1.png"></div>
						<div><span class="funding-span">커피의 시작이자 마침표,로스팅 | 커피생활을 확 바꿔줄 스마트APP로스터</span></div>
					</div>
					<div class="hover" OnClick="location.href ='/fundingDetailStory.kh?fundingNo=173'">
						<div class="img-wrap"><img src="/resources/upload/funding/foodimg1.png"></div>
						<div><span class="funding-span">푸드 [날짜지정 배송] 꾸덕달콤상큼! 만족도폭발 '과일' 그릭요거트 앵콜!</span></div>
					</div>
					<div class="hover" OnClick="location.href ='/fundingDetailStory.kh?fundingNo=172'">
						<div class="img-wrap"><img src="/resources/upload/funding/beautyimg1.png"></div>
						<div><span class="funding-span">[에센셜 오일 100%] 꼭 필요한 것만 남긴 인생 핸드워시</span></div>
					</div>
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