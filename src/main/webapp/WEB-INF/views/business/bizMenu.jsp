<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu {
	margin-top: 30px;
	width: 150px;
	height: 100%;
	float: left;
}

.menu ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

.menu a {
	font-size: 14px;
	display: block;
	height: 40px;
	color: black;
	line-height: 40px;
	text-decoration: none;
	position: relative;
}

.sub-menu {
	display: none;
}

.sub-menu a {
	color: gray;
}

.more {
	position: absolute;
	font-size: 20px;
	right: 20px;
	transition-duration: 0.5s;
}

.menu-active {
	transform: rotate(45deg);
}

.page-content {
	float: left;
}
</style>
</head>
<body>
	<div class="menu">
		<ul class="main-menu">
			<li><a href="#">펀딩</a>
				<ul class="sub-menu">
					<li><a href="/fundingInsert.kh">펀딩 등록</a></li>
					<li><a href="/manageFunding.kh">펀딩 관리</a></li>
				</ul></li>
			<li><a href="#">기부</a>
				<ul class="sub-menu">
					<li><a href="/donationWriter.kh">기부 등록</a></li>
					<li><a href="/manageDonation.kh">기부 관리</a></li>
				</ul></li>
			<li><a href="#">경매</a>
				<ul class="sub-menu">
					<li><a href="addAuction.kh">경매 등록</a></li>
					<li><a href="/manageAuction.kh">경매 관리</a></li>
				</ul></li>
			<li><a href="/manageQna.kh?sellerNo=${sessionScope.m.memberNo }&reqPage=1&qnaStatus=2">Q&A페이지</a></li>
			<li><a
				href="/manageDelivery.kh?memberNo=${sessionScope.m.memberNo }">배송관리</a>
			</li>
			<li><a href="#">통계</a>
				<ul class="sub-menu">
					<li><a href="/sumChart.kh">누적 금액</a></li>
					<li><a href="/checkCount.kh">조회수 전일비교</a></li>
				</ul></li>
			<li><a
				href="/shopUploadFrm.kh?memberNo=${sessionScope.m.memberNo }">사업자 정보 수정</a>
			</li>
			<li><a
				href="/updateInfo.kh?memberNo=${sessionScope.m.memberNo }">마이페이지</a>
			</li>
			<li><a href="/shopInfo.kh?memberNo=${sessionScope.m.memberNo }">샵</a>
			</li>
		</ul>
	</div>
</body>
</html>