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
.show-content{
	float:left;
	margin-top:50px;
	margin-left:305px;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="menu">
			<ul class="main-menu">
				<li>
					<a href="#">펀딩</a>
					<ul class="sub-menu">
						<li><a href="#">펀딩 등록</a></li>
						<li><a href="#">펀딩 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">기부</a>
					<ul class="sub-menu">
						<li><a href="#">기부 등록</a></li>
						<li><a href="#">기부 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">공동구매</a>
					<ul class="sub-menu">
						<li><a href="#">공동구매 등록</a></li>
						<li><a href="#">공동구매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">경매</a>
					<ul class="sub-menu">
						<li><a href="#">경매 등록</a></li>
						<li><a href="#">경매 관리</a></li>
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
						<li><a href="#">일별 카운트</a></li>
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
		<h2 style="margin-top:50px;margin-left:520px;">사업자 정보 관리</h1>
		<div class="show-content">
			<form action="/shopUpload.kh" method="post" enctype="multipart/form-data">
				<fieldset style="border:0px solid black;">				
						<div>
						<div style="float:left;">
		                	<div>사업자 번호</div>
		                	<div>상호명</div>		                
		                	<div>주소</div>
		                	<div>상세주소</div>
		                	<div>휴대폰번호</div>
		                	<div>배경사진</div>
		                </div>
		                <div style="float:left; margin-left:40px;">
		                	<div><input type="text" name="bizNo" disabled value="${shop.bizNo }"></div>		                	
		                	<div><input type="text" name="shopName" disabled value="${shop.shopName }"></div>
		                	<div>주소</div>
		                	<div>상세주소</div>
		                	<div>휴대폰번호</div>
		                	<div><input type="file" name="upfile" multiple></div>
		                </div>
		                </div>
		                <input type="hidden" name="memberNo" value="100">
		                <input type="hidden" name="shopNo" value="${shop.shopNo }">
						<div><input type="submit" value="등록" style="float:none;" class="btn bc11"></div>
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