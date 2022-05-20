<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<style>
.menu {
	margin-top:30px;
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
	color:black;
	line-height: 40px;
	text-decoration: none;
	position: relative;
}

.sub-menu {
	display: none;
}

.sub-menu a{
	color:gray;
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
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<div class="menu">
			<ul class="main-menu">
				<li>
					<a href="#">펀딩</a>
					<ul class="sub-menu">
						<li><a href="#">펀딩 등록</a></li>
						<li><a href="/manageFunding.kh?memberNo=100">펀딩 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">기부</a>
					<ul class="sub-menu">
						<li><a href="#">기부 등록</a></li>
						<li><a href="/manageDonation.kh?memberNo=100">기부 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">공동구매</a>
					<ul class="sub-menu">
						<li><a href="#">공동구매 등록</a></li>
						<li><a href="/manageGroup.kh?memberNo=100">공동구매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">경매</a>
					<ul class="sub-menu">
						<li><a href="#">경매 등록</a></li>
						<li><a href="/manageAuction.kh?memberNo=100">경매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">Q&A페이지</a>
					
				</li>
				<li>
					<a href="#">통계</a>
					<ul class="sub-menu">
						<li><a href="#">누적 금액</a></li>
						<li><a href="#">성별/연령별</a></li>
						<li><a href="/checkCount.kh?memberNo=100">일별 카운트</a></li>
					</ul>
				</li>
				<li>
					<a href="/shopUploadFrm.kh?memberNo=100">상호등록</a>
				</li>
				<li>
					<a href="/shopInfo.kh?memberNo=100">마이페이지</a>
				</li>
			</ul>
		</div>
		<div class="show-content">
			<div>
				<h3>진행중인 기부</h3>
				<table border="1">
					<tr>
						<th>프로젝트명</th><th>목표기부금액</th><th>상품가격</th><th>시작일</th><th>종료일</th>
					</tr>
					<c:forEach var="d" items="${d }">
						<tr>
							<td>${d.donationTitle }</td><td>${d.donationTarget }</td><td>${d.donationCash }</td><td>${d.donationStartdate }</td><td>${d.donationEnddate }</td>
							<td><button><a href="#">수정하기</a></button></td>
						</tr>
					</c:forEach>									
				</table>
			</div>
			<div>
				<h3>종료된 기부</h3>
				<table border="1">
					<tr>
						<th>프로젝트명</th><th>목표기부금액</th><th>상품가격</th><th>시작일</th><th>종료일</th>
					</tr>
					<c:forEach var="d" items="${expiredD }">
						<tr>
							<td>${d.donationTitle }</td><td>${d.donationTarget }</td><td>${d.donationCash }</td><td>${d.donationStartdate }</td><td>${d.donationEnddate }</td>
							<td><button><a href="#">수정하기</a></button></td>
						</tr>
					</c:forEach>									
				</table>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".sub-menu").prev().append("<span class='more'></span>")
			$(".more").parent().parent().on(
					"click",
					function(e) {
						$(this).children().last().slideToggle();
						$(this).children().first().children(".more")
								.toggleClass("menu-active");
						e.stopPropagation();
					})
		})
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>