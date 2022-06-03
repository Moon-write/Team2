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
.show-content2{
	float:left;
	margin-top:50px;
	margin-left:305px;
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
						<li><a href="/manageFunding.kh">펀딩 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">기부</a>
					<ul class="sub-menu">
						<li><a href="#">기부 등록</a></li>
						<li><a href="/manageDonation.kh">기부 관리</a></li>
					</ul>
				</li>				
				<li>
					<a href="#">경매</a>
					<ul class="sub-menu">
						<li><a href="addAuction.kh">경매 등록</a></li>
						<li><a href="/manageAuction.kh">경매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">Q&A페이지</a>					
				</li>
				<li>
					<a href="/manageDelivery.kh?memberNo=${sessionScope.m.memberNo }">배송관리</a>
				</li>
				<li>
					<a href="#">통계</a>
					<ul class="sub-menu">
						<li><a href="/sumChart.kh">누적 금액</a></li>
						<li><a href="/checkCount.kh">조회수 전일비교</a></li>
					</ul>
				</li>
				<li>
					<a href="/shopUploadFrm.kh?memberNo=${sessionScope.m.memberNo }">상호등록</a>
				</li>
				<li>
					<a href="/updateInfo.kh?memberNo=${sessionScope.m.memberNo }">마이페이지</a>
				</li>
				<li>
					<a href="/shopInfo.kh?memberNo=${sessionScope.m.memberNo }">샵</a>
				</li>
			</ul>
		</div>
		<h2 style="margin-top:50px;margin-left:520px;">사업자 정보 관리</h1>
		<div class="show-content2">
			<form action="/shopUpload.kh" method="post">
				<fieldset style="border:0px solid black;">				
						<div>
						<div style="float:left;">
		                	<div>사업자 번호</div>
		                	<div>상호명</div>		                
		                	<div>주소</div>
		                	<div>상세주소</div>
		                	<div>휴대폰번호</div>                	
		                </div>
		                <div style="float:left; margin-left:40px;">
		                	<div><input type="text" name="bizNo" disabled value="${shop.bizNo }"></div>		                	
		                	<div><input type="text" name="shopName" disabled value="${shop.shopName }"></div>
		                	<div>주소</div>
		                	<div>상세주소</div>
		                	<div>휴대폰번호</div>		                	
		                </div>
		                </div>
		                <input type="hidden" name="memberNo" value="100">
		                <input type="hidden" name="shopNo" value="${shop.shopNo }">
						<div><input type="submit" value="등록" style="float:none;"></div>
				</fieldset>
			</form>
		</div>
	</div>
	<script>
		$(function() {
			$(".sub-menu").prev().append("<span class='more'></span>")
			$(".more").parent().parent().on("click", function(e) {
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